package managementSystem.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import managementSystem.dao.OrdersDAO;
import managementSystem.entity.OrderItem;
import managementSystem.entity.Orders;
import managementSystem.entity.Product;
import managementSystem.entity.UserEntity;
import managementSystem.model.OrderItemModel;
import managementSystem.model.OrdersModel;
import managementSystem.repository.ProductRepository;

@Service
@Transactional
public class OrdersServiceImpl implements OrdersService {

	@Autowired
	private OrdersDAO dao;

	@Autowired
	private ProductRepository productRepository;

//	---------------- SAVE ORDER ----------------

	@Override
	public Optional<Orders> saveOrder(

			OrdersModel model,

			UserEntity user) {

		Orders orders = new Orders();

//		SET USER

		orders.setUser(user);

//		DEFAULT STATUS

		orders.setStatus("PLACED");

//		CREATE ITEM LIST

		List<OrderItem> items = new ArrayList<>();

//		CHECK NULL ITEMS

		if (model.getItems() == null || model.getItems().isEmpty()) {

			return Optional.empty();
		}

//		LOOP THROUGH ITEMS

		for (OrderItemModel itemModel : model.getItems()) {

//			CHECK INVALID QUANTITY

			if (itemModel.getQuantity() <= 0) {

				return Optional.empty();
			}

//			FETCH PRODUCT

			Optional<Product> optional =

					productRepository.findById(

							itemModel.getProductId());

//			CHECK PRODUCT

			if (optional.isPresent()) {

				Product product = optional.get();

//				CHECK STOCK

				if (product.getStock() >= itemModel.getQuantity()) {

//					CREATE ORDER ITEM

					OrderItem item = new OrderItem();

//					SET ORDER

					item.setOrders(orders);

//					SET PRODUCT

					item.setProduct(product);

//					SET QUANTITY

					item.setQuantity(itemModel.getQuantity());

//					SET PRICE

					item.setPrice(product.getPrice());

//					REDUCE STOCK

					product.setStock(

							product.getStock()

									-

									itemModel.getQuantity());

//					SAVE UPDATED PRODUCT

					productRepository.save(product);

//					ADD ITEM

					items.add(item);

				} else {

//					INSUFFICIENT STOCK

					return Optional.empty();
				}

			} else {

//				PRODUCT NOT FOUND

				return Optional.empty();
			}
		}

//		CHECK EMPTY ORDER

		if (items.isEmpty()) {

			return Optional.empty();
		}

//		SET ITEMS

		orders.setItems(items);

//		SAVE ORDER

		Orders savedOrder = dao.saveOrder(orders);

//		RETURN ORDER

		return Optional.of(savedOrder);
	}

//	---------------- SAVE UPDATED ORDER ----------------

	@Override
	public Orders saveUpdatedOrder(Orders order) {

		return dao.saveOrder(order);
	}

//	---------------- FETCH ORDER BY ID ----------------

	@Override
	public Optional<Orders> fetchById(Integer id) {

		return dao.fetchById(id);
	}

//	---------------- FETCH ALL ORDERS ----------------

	@Override
	public List<Orders> fetchAll() {

		return dao.fetchAll();
	}

//	---------------- DELETE ORDER ----------------

	@Override
	public Optional<Orders> deleteOrder(Integer id) {

		return dao.deleteOrder(id);
	}
}