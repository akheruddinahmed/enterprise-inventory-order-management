package managementSystem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

import managementSystem.entity.Orders;
import managementSystem.entity.Product;
import managementSystem.service.OrdersService;
import managementSystem.service.ProductService;
import managementSystem.service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private ProductService productService;

	@Autowired
	private UserService userService;

	@Autowired
	private OrdersService ordersService;

//	---------------- ADMIN HOME ----------------

	@GetMapping("/home")
	public String adminHome(

			Model model,

			HttpSession session) {

//		ROLE CHECK

		String role = (String) session.getAttribute("role");

		if (role == null || !role.equals("ADMIN")) {

			return "error/error";
		}

//		GET MESSAGE

		String msg = (String) session.getAttribute("msg");

		model.addAttribute("msg", msg);

//		REMOVE MESSAGE AFTER SHOWING ONCE

		session.removeAttribute("msg");

//		TOTAL PRODUCT COUNT

		model.addAttribute(

				"productCount",

				productService.fetchAll().size());

//		TOTAL USER COUNT

		model.addAttribute(

				"userCount",

				userService.fetchAll().size());

//		TOTAL ORDER COUNT

		model.addAttribute(

				"orderCount",

				ordersService.fetchAll().size());

		return "admin/adminHome";
	}

//	---------------- REPORT PAGE ----------------

	@GetMapping("/reports")
	public String reports(

			@RequestParam(defaultValue = "0") int lowPage,

			@RequestParam(defaultValue = "0") int completedPage,

			@RequestParam(defaultValue = "0") int pendingPage,

			Model model,

			HttpSession session) {

//		CHECK ADMIN

		String role = (String) session.getAttribute("role");

		if (role == null || !role.equals("ADMIN")) {

			return "error/error";
		}

//		PAGE SIZE

		int size = 3;

//		LOW STOCK PRODUCTS

		List<Product> lowStockList =

				productService.fetchAll()

						.stream()

						.filter(product ->

						product.getStock() < 5)

						.toList();

//		ALL ORDERS

		List<Orders> allOrders =

				ordersService.fetchAll();

//		COMPLETED ORDERS

		List<Orders> completedList =

				allOrders.stream()

						.filter(order ->

						order.getStatus()

								.equalsIgnoreCase("DELIVERED"))

						.toList();

//		PENDING ORDERS

		List<Orders> pendingList =

				allOrders.stream()

						.filter(order ->

						!order.getStatus()

								.equalsIgnoreCase("DELIVERED"))

						.toList();

//		LOW STOCK PAGINATION

		int lowStart = lowPage * size;

		int lowEnd =

				Math.min(lowStart + size,

						lowStockList.size());

		List<Product> lowStock =

				lowStockList.subList(

						lowStart,

						lowEnd);

//		COMPLETED PAGINATION

		int completedStart = completedPage * size;

		int completedEnd =

				Math.min(completedStart + size,

						completedList.size());

		List<Orders> completedOrders =

				completedList.subList(

						completedStart,

						completedEnd);

//		PENDING PAGINATION

		int pendingStart = pendingPage * size;

		int pendingEnd =

				Math.min(pendingStart + size,

						pendingList.size());

		List<Orders> pendingOrders =

				pendingList.subList(

						pendingStart,

						pendingEnd);

//		SEND DATA

		model.addAttribute(

				"lowStock",

				lowStock);

		model.addAttribute(

				"completedOrders",

				completedOrders);

		model.addAttribute(

				"pendingOrders",

				pendingOrders);

//		CURRENT PAGE

		model.addAttribute(

				"lowPage",

				lowPage);

		model.addAttribute(

				"completedPage",

				completedPage);

		model.addAttribute(

				"pendingPage",

				pendingPage);

//		CHECK NEXT PAGE

		model.addAttribute(

				"lowHasNext",

				lowEnd < lowStockList.size());

		model.addAttribute(

				"completedHasNext",

				completedEnd < completedList.size());

		model.addAttribute(

				"pendingHasNext",

				pendingEnd < pendingList.size());

		return "admin/reports";
	}
}