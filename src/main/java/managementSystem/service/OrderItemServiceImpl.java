package managementSystem.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import managementSystem.dao.OrderItemDAO;
import managementSystem.entity.OrderItem;
import managementSystem.model.OrderItemModel;

@Service
public class OrderItemServiceImpl implements OrderItemService {

	@Autowired
	private OrderItemDAO dao;

//	SAVE ORDER ITEM

	@Override
	public Optional<OrderItem> saveOrderItem(OrderItemModel model) {

		OrderItem item = new OrderItem();

		item.setQuantity(model.getQuantity());

		item.setPrice(model.getPrice());

		return Optional.of(dao.saveOrderItem(item));
	}

//	FETCH ORDER ITEM BY ID

	@Override
	public Optional<OrderItem> fetchById(Integer id) {

		return dao.fetchById(id);
	}

//	FETCH ALL ORDER ITEMS

	@Override
	public List<OrderItem> fetchAll() {

		return dao.fetchAll();
	}

//	DELETE ORDER ITEM

	@Override
	public Optional<OrderItem> deleteOrderItem(Integer id) {

		return dao.deleteOrderItem(id);
	}
}