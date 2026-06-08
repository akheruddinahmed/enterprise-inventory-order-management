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

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

import managementSystem.entity.Product;
import managementSystem.model.ProductModel;
import managementSystem.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	private ProductService service;

//	---------------- HOME PAGE ----------------

	@GetMapping({ "", "/" })
	public String home(

			HttpSession session,

			Model model) {

//		ROLE CHECK

		String role = (String) session.getAttribute("role");

		if (role == null || !role.equals("ADMIN")) {

			model.addAttribute("msg", "Access Denied");

			return "error/error";
		}

		return "product/addProduct";
	}

//	---------------- SAVE PRODUCT ----------------

	@PostMapping("/save")
	public String saveProduct(

			@Valid ProductModel product,

			BindingResult result,

			Model model,

			HttpSession session) {

//		ROLE CHECK

		String role = (String) session.getAttribute("role");

		if (role == null || !role.equals("ADMIN")) {

			model.addAttribute("msg", "Access Denied");

			return "error/error";
		}

//		VALIDATION ERROR

		if (result.hasErrors()) {

			model.addAttribute(

					"msg",

					result.getFieldError().getDefaultMessage());

			return "product/addProduct";
		}

//		SAVE PRODUCT

		Optional<Product> optional = service.saveProduct(product);

//		CHECK SAVE

		if (optional.isPresent()) {

			model.addAttribute(

					"msg",

					"Product Saved Successfully");

		} else {

			model.addAttribute(

					"msg",

					"Product Not Saved");
		}

		return "product/addProduct";
	}

//	---------------- FETCH PRODUCT BY ID ----------------

	@GetMapping("/fetch")
	public String fetchById(

			@RequestParam Integer id,

			Model model,

			HttpSession session) {

//		ROLE CHECK

		String role = (String) session.getAttribute("role");

		if (role == null || !role.equals("ADMIN")) {

			model.addAttribute(

					"msg",

					"Access Denied");

			return "error/error";
		}

//		FETCH PRODUCT

		Optional<Product> product = service.fetchById(id);

//		CHECK PRODUCT

		if (product.isPresent()) {

			model.addAttribute(

					"product",

					product.get());

			return "product/updateProduct";

		} else {

			model.addAttribute(

					"msg",

					"Product Not Found");

			return "product/displayProduct";
		}
	}

//	---------------- FETCH ALL PRODUCT ----------------

	@GetMapping("/getall")
	public String getAll(

			@RequestParam(required = false) String field,

			Model model,

			HttpSession session) {

//		CHECK LOGIN

		Object user = session.getAttribute("user");

		String role = (String) session.getAttribute("role");

//		ALLOW ADMIN OR USER

		if (user == null && (role == null || !role.equals("ADMIN"))) {

			return "redirect:/user/loginPage";
		}

//		FETCH PRODUCT LIST

		List<Product> list;

		if (field != null) {

			list = service.fetchAll(field);

		} else {

			list = service.fetchAll();
		}

//		SEND LIST

		model.addAttribute("list", list);

		return "product/displayProduct";
	}

//	---------------- DELETE PRODUCT ----------------

	@PostMapping("/delete")
	public String deleteProduct(

			@RequestParam Integer id,

			Model model,

			HttpSession session) {

//		ROLE CHECK

		String role = (String) session.getAttribute("role");

		if (role == null || !role.equals("ADMIN")) {

			model.addAttribute(

					"msg",

					"Access Denied");

			return "error/error";
		}

//		DELETE PRODUCT

		Optional<Product> product = service.deleteProduct(id);

//		CHECK DELETE

		if (product.isPresent()) {

			model.addAttribute(

					"msg",

					"Product Deleted Successfully");

		} else {

			model.addAttribute(

					"msg",

					"Product Not Found");
		}

//		RELOAD PRODUCTS

		model.addAttribute(

				"list",

				service.fetchAll());

		return "product/displayProduct";
	}

//	---------------- UPDATE PRODUCT ----------------

	@PostMapping("/update")
	public String updateProduct(

			@RequestParam Integer id,

			@Valid ProductModel product,

			BindingResult result,

			Model model,

			HttpSession session) {

//		ROLE CHECK

		String role = (String) session.getAttribute("role");

		if (role == null || !role.equals("ADMIN")) {

			model.addAttribute(

					"msg",

					"Access Denied");

			return "error/error";
		}

//		VALIDATION ERROR

		if (result.hasErrors()) {

			model.addAttribute(

					"msg",

					result.getFieldError().getDefaultMessage());

			model.addAttribute("product", product);

			return "product/updateProduct";
		}

//		UPDATE PRODUCT

		Optional<Product> updateProduct =

				service.updateProduct(id, product);

//		CHECK UPDATE

		if (updateProduct.isPresent()) {

			model.addAttribute(

					"msg",

					"Product Updated Successfully");

		} else {

			model.addAttribute(

					"msg",

					"Product Not Updated");
		}

		return "product/addProduct";
	}

//	---------------- ADD STOCK ----------------

	@PostMapping("/addStock")
	public String addStock(

			@RequestParam Integer id,

			@RequestParam Integer stock,

			HttpSession session,

			Model model) {

//		CHECK ADMIN

		String role = (String) session.getAttribute("role");

		if (role == null || !role.equals("ADMIN")) {

			model.addAttribute(

					"msg",

					"Access Denied");

			return "error/error";
		}

//		FETCH PRODUCT

		Optional<Product> optional = service.fetchById(id);

//		CHECK PRODUCT

		if (optional.isPresent()) {

			Product product = optional.get();

//			ADD STOCK

			product.setStock(

					product.getStock() + stock);

//			SAVE UPDATED PRODUCT

			service.saveUpdatedProduct(product);
		}

//		REDIRECT REPORT PAGE

		return "redirect:/admin/reports";
	}
}