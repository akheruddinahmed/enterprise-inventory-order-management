package managementSystem.dao;

import java.util.List;
import java.util.Optional;

import managementSystem.entity.OrderItem;

public interface OrderItemDAO {

//	SAVE ORDER ITEM

	OrderItem saveOrderItem(OrderItem item);

//	FETCH ORDER ITEM BY ID

	Optional<OrderItem> fetchById(Integer id);

//	FETCH ALL ORDER ITEMS

	List<OrderItem> fetchAll();

//	DELETE ORDER ITEM

	Optional<OrderItem> deleteOrderItem(Integer id);
}