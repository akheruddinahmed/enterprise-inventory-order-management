package managementSystem.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;

import managementSystem.entity.UserEntity;

@Controller
@RequestMapping("/user")
public class UserHomeController {

	@GetMapping("/home")
	public String userHome(

			Model model,

			HttpSession session) {

//		CHECK USER SESSION

		Object user = session.getAttribute("user");

		if (user == null) {

			return "redirect:/user/loginPage";
		}

//		GET MESSAGE

		String msg = (String) session.getAttribute("msg");

		model.addAttribute("msg", msg);

//		REMOVE MESSAGE AFTER SHOWING ONCE

		session.removeAttribute("msg");

		return "user/userHome";
	}

//	---------------- USER PROFILE ----------------

	@GetMapping("/profile")
	public String profile(

			HttpSession session,

			Model model) {

//		CHECK LOGIN

		UserEntity user = (UserEntity) session.getAttribute("user");

		if (user == null) {

			return "redirect:/user/loginPage";
		}

//		SEND USER DATA

		model.addAttribute("user", user);

		return "user/profile";
	}
}