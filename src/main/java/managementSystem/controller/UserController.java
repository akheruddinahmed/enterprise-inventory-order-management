package managementSystem.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

import managementSystem.entity.UserEntity;
import managementSystem.model.UserModel;
import managementSystem.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService service;

//	---------------- REGISTER PAGE ----------------

	@GetMapping({ "", "/" })
	public String registerPage() {

		return "user/register";
	}

//	---------------- USER LOGIN PAGE ----------------

	@GetMapping("/loginPage")
	public String loginPage() {

		return "user/login";
	}

//	---------------- ADMIN LOGIN PAGE ----------------

	@GetMapping("/adminLogin")
	public String adminLoginPage() {

		return "admin/adminLogin";
	}

//	---------------- REGISTER USER ----------------

	@PostMapping("/register")
	public String register(

			@Valid UserModel user,

			BindingResult result,

			Model model) {

//		VALIDATION ERROR

		if (result.hasErrors()) {

			model.addAttribute("msg", result.getFieldError().getDefaultMessage());

			return "user/register";
		}

//		SAVE USER

		Optional<UserEntity> optional = service.saveUser(user);

//		CHECK SAVE

		if (optional.isPresent()) {

			model.addAttribute("msg", "Registration Successful");

			return "user/login";

		} else {

			model.addAttribute("msg", "Registration Failed");

			return "user/register";
		}
	}

//	---------------- LOGIN USER ----------------

	@PostMapping("/login")
	public ModelAndView login(

			ModelAndView view,

			@RequestParam String userName,

			@RequestParam String password,

			HttpServletRequest request) {

//		DESTROY OLD SESSION

		request.getSession().invalidate();

//		CREATE NEW SESSION

		HttpSession session = request.getSession(true);

//		---------------- ADMIN LOGIN ----------------

		if (userName.equals("admin") && password.equals("admin123")) {

			session.setAttribute("role", "ADMIN");

			session.setAttribute("msg", "Admin Login Successful");

			view.setViewName("redirect:/admin/home");

			return view;
		}

//		---------------- USER LOGIN ----------------

		Optional<UserEntity> user = service.fetchByUserNameAndPassword(userName, password);

		if (user.isPresent()) {

//			STORE USER

			session.setAttribute("user", user.get());

//			STORE ROLE

			session.setAttribute("role", user.get().getRole());

//			SUCCESS MESSAGE

			session.setAttribute("msg", "Login Successful");

//			REDIRECT USER HOME

			view.setViewName("redirect:/user/home");

		} else {

//			FAIL MESSAGE

			view.addObject("msg", "Invalid Credential");

//			BACK TO LOGIN

			view.setViewName("user/login");
		}

		return view;
	}

//	---------------- FETCH ALL USER ----------------

	@GetMapping("/getall")
	public String getAll(

			@RequestParam(required = false) String field,

			Model model,

			HttpSession session) {

//		CHECK ADMIN

		String role = (String) session.getAttribute("role");

		if (role == null || !role.equals("ADMIN")) {

			model.addAttribute("msg", "Access Denied");

			return "error/error";
		}

//		FETCH USERS

		List<UserEntity> list;

		if (field != null) {

			list = service.fetchAll(field);

		} else {

			list = service.fetchAll();
		}

//		SEND LIST

		model.addAttribute("list", list);

		return "user/displayUser";
	}

//	---------------- UPDATE PAGE ----------------

	@GetMapping("/updatePage")
	public String updatePage(

			@RequestParam Integer id,

			Model model,

			HttpSession session) {

//		CHECK ADMIN

		String role = (String) session.getAttribute("role");

		if (role == null || !role.equals("ADMIN")) {

			model.addAttribute("msg", "Access Denied");

			return "error/error";
		}

//		FETCH USER

		Optional<UserEntity> optional = service.fetchById(id);

//		CHECK USER

		if (optional.isPresent()) {

			model.addAttribute("user", optional.get());

			return "user/updateUser";
		}

		model.addAttribute("msg", "User Not Found");

		return "error/error";
	}

//	---------------- UPDATE USER ----------------

	@PostMapping("/update")
	public String updateUser(

			@RequestParam Integer id,

			@RequestParam String name,

			@RequestParam String email,

			@RequestParam Integer age,

			@RequestParam String phone,

			@RequestParam String address,

			@RequestParam String role,

			Model model,

			HttpSession session) {

//		CHECK ADMIN

		String adminRole = (String) session.getAttribute("role");

		if (adminRole == null || !adminRole.equals("ADMIN")) {

			model.addAttribute("msg", "Access Denied");

			return "error/error";
		}

//		FETCH USER

		Optional<UserEntity> optional = service.fetchById(id);

//		CHECK USER

		if (optional.isPresent()) {

			UserEntity user = optional.get();

//			UPDATE DETAILS

			user.setName(name);

			user.setEmail(email);

			user.setAge(age);

			user.setPhone(phone);

			user.setAddress(address);

			user.setRole(role);

//			SAVE UPDATED USER

			service.saveUpdatedUser(user);

//			SUCCESS MESSAGE

			model.addAttribute("msg", "User Updated Successfully");

//			RELOAD USERS

			model.addAttribute("list", service.fetchAll());

			return "user/displayUser";
		}

//		USER NOT FOUND

		model.addAttribute("msg", "User Not Found");

		return "error/error";
	}

//	---------------- LOGOUT ----------------

	@GetMapping("/logout")
	public String logout(HttpSession session) {

		session.invalidate();

		return "redirect:/";
	}
}