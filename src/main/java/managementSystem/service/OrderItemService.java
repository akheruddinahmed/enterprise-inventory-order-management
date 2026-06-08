package managementSystem.service;

import java.util.List;
import java.util.Optional;

import managementSystem.entity.OrderItem;
import managementSystem.model.OrderItemModel;

public interface OrderItemService {

//	SAVE ORDER ITEM

	Optional<OrderItem> saveOrderItem(OrderItemModel model);

//	FETCH ORDER ITEM BY ID

	Optional<OrderItem> fetchById(Integer id);

//	FETCH ALL ORDER ITEMS

	List<OrderItem> fetchAll();

//	DELETE ORDER ITEM

	Optional<OrderItem> deleteOrderItem(Integer id);
}