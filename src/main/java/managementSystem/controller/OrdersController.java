package managementSystem.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

import managementSystem.entity.OrderItem;
import managementSystem.entity.Orders;
import managementSystem.entity.UserEntity;
import managementSystem.model.OrdersModel;
import managementSystem.service.OrdersService;

@Controller
public class OrdersController {

	@Autowired
	private OrdersService service;

//	---------------- OPEN ORDER PAGE ----------------

	@GetMapping("/orders")
	public String orderPage(

			@RequestParam Integer productId,

			Model model,

			HttpSession session) {

//		CHECK LOGIN

		Object user = session.getAttribute("user");

		if (user == null) {

			return "redirect:/user/loginPage";
		}

//		SEND PRODUCT ID TO JSP

		model.addAttribute("productId", productId);

		return "orders/placeOrder";
	}

//	---------------- SAVE ORDER ----------------

	@PostMapping("/orders/save")
	public String saveOrder(

			OrdersModel model,

			HttpSession session,

			Model view) {

//		GET LOGGED-IN USER

		UserEntity user = (UserEntity) session.getAttribute("user");

//		CHECK LOGIN

		if (user == null) {

			return "redirect:/user/loginPage";
		}

//		SAVE ORDER

		Optional<Orders> optional = service.saveOrder(model, user);

//		CHECK SAVE

		if (optional.isPresent()) {

			view.addAttribute("msg", "Order Placed Successfully");

			return "orders/orderSuccess";

		} else {

			view.addAttribute(

					"msg",

					"Invalid Product, Quantity, Or Insufficient Stock");

			return "orders/placeOrder";
		}
	}

//	---------------- FETCH ALL ORDERS ----------------

	@GetMapping("/orders/getall")
	public String getAllOrders(

			Model model,

			HttpSession session) {

//		CHECK ADMIN

		String role = (String) session.getAttribute("role");

		if (role == null || !role.equals("ADMIN")) {

			model.addAttribute("msg", "Access Denied");

			return "error/error";
		}

//		FETCH ALL ORDERS

		List<Orders> list = service.fetchAll();

//		SEND TO JSP

		model.addAttribute("list", list);

		return "orders/displayOrders";
	}

//	---------------- MY ORDERS ----------------

	@GetMapping("/orders/myorders")
	public String myOrders(

			Model model,

			HttpSession session) {

//		CHECK LOGIN

		UserEntity user = (UserEntity) session.getAttribute("user");

		if (user == null) {

			return "redirect:/user/loginPage";
		}

//		FETCH ALL ORDERS

		List<Orders> allOrders = service.fetchAll();

//		FILTER USER ORDERS

		List<Orders> myOrders = allOrders.stream()

				.filter(order ->

				order.getUser().getId().equals(user.getId()))

				.toList();

//		SEND TO JSP

		model.addAttribute("list", myOrders);

		return "orders/displayOrders";
	}

//	---------------- ADMIN VIEW USER ORDERS ----------------

	@GetMapping("/orders/userOrders")
	public String userOrders(

			@RequestParam Integer id,

			Model model,

			HttpSession session) {

//		ADMIN CHECK

		String role = (String) session.getAttribute("role");

		if (role == null || !role.equals("ADMIN")) {

			model.addAttribute("msg", "Access Denied");

			return "error/error";
		}

//		FETCH ALL ORDERS

		List<Orders> allOrders = service.fetchAll();

//		FILTER USER ORDERS

		List<Orders> userOrders = allOrders.stream()

				.filter(order ->

				order.getUser().getId().equals(id))

				.toList();

//		SEND TO JSP

		model.addAttribute("list", userOrders);

		return "orders/displayOrders";
	}

//	---------------- ORDER DETAILS ----------------

	@GetMapping("/orders/details")
	public String orderDetails(

			@RequestParam Integer id,

			Model model,

			HttpSession session) {

//		CHECK LOGIN

		UserEntity user = (UserEntity) session.getAttribute("user");

		String role = (String) session.getAttribute("role");

		if (user == null && (role == null || !role.equals("ADMIN"))) {

			return "redirect:/user/loginPage";
		}

//		FETCH ORDER

		Optional<Orders> optional = service.fetchById(id);

		if (optional.isPresent()) {

			Orders order = optional.get();

//			SECURITY CHECK

			if (role == null || !role.equals("ADMIN")) {

				if (!order.getUser().getId().equals(user.getId())) {

					model.addAttribute("msg", "Access Denied");

					return "error/error";
				}
			}

//			SEND ORDER

			model.addAttribute("order", order);

			return "orders/orderDetails";
		}

		model.addAttribute("msg", "Order Not Found");

		return "error/error";
	}

//	---------------- INVOICE PAGE ----------------

	@GetMapping("/orders/invoice")
	public String invoice(

			@RequestParam Integer id,

			Model model,

			HttpSession session) {

//		CHECK LOGIN

		UserEntity user = (UserEntity) session.getAttribute("user");

		String role = (String) session.getAttribute("role");

		if (user == null && (role == null || !role.equals("ADMIN"))) {

			return "redirect:/user/loginPage";
		}

//		FETCH ORDER

		Optional<Orders> optional = service.fetchById(id);

		if (optional.isPresent()) {

			Orders order = optional.get();

//			SECURITY CHECK

			if (role == null || !role.equals("ADMIN")) {

				if (!order.getUser().getId().equals(user.getId())) {

					model.addAttribute("msg", "Access Denied");

					return "error/error";
				}
			}

//			SEND ORDER

			model.addAttribute("order", order);

//			CALCULATE TOTAL

			int total = 0;

			for (OrderItem item : order.getItems()) {

				total += item.getPrice() * item.getQuantity();
			}

//			SEND TOTAL

			model.addAttribute("total", total);

			return "orders/invoice";
		}

		model.addAttribute("msg", "Order Not Found");

		return "error/error";
	}

//	---------------- UPDATE PAGE ----------------

	@GetMapping("/orders/updatePage")
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

//		FETCH ORDER

		Optional<Orders> optional = service.fetchById(id);

		if (optional.isPresent()) {

			model.addAttribute("order", optional.get());

			return "orders/updateOrder";
		}

		model.addAttribute("msg", "Order Not Found");

		return "error/error";
	}

//	---------------- UPDATE ORDER ----------------

	@PostMapping("/orders/update")
	public String updateOrder(

			@RequestParam Integer id,

			@RequestParam String status,

			Model model,

			HttpSession session) {

//		CHECK ADMIN

		String role = (String) session.getAttribute("role");

		if (role == null || !role.equals("ADMIN")) {

			model.addAttribute("msg", "Access Denied");

			return "error/error";
		}

//		FETCH ORDER

		Optional<Orders> optional = service.fetchById(id);

//		CHECK ORDER

		if (optional.isPresent()) {

			Orders order = optional.get();

//			UPDATE STATUS

			order.setStatus(status);

//			SAVE UPDATED ORDER

			service.saveUpdatedOrder(order);

//			REDIRECT TO REPORT PAGE

			return "redirect:/admin/reports";
		}

//		ORDER NOT FOUND

		model.addAttribute("msg", "Order Not Found");

		return "error/error";
	}

//	---------------- DELETE ORDER ----------------

	@PostMapping("/orders/delete")
	public String deleteOrder(

			@RequestParam Integer id,

			Model model,

			HttpSession session) {

//		CHECK ADMIN

		String role = (String) session.getAttribute("role");

		if (role == null || !role.equals("ADMIN")) {

			model.addAttribute("msg", "Access Denied");

			return "error/error";
		}

//		DELETE ORDER

		Optional<Orders> optional = service.deleteOrder(id);

//		CHECK DELETE

		if (optional.isPresent()) {

			model.addAttribute("msg", "Order Deleted Successfully");

		} else {

			model.addAttribute("msg", "Order Not Found");
		}

//		RELOAD LIST

		model.addAttribute("list", service.fetchAll());

		return "orders/displayOrders";
	}
}