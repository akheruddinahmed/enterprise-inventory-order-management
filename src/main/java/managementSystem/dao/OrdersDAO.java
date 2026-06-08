package managementSystem.dao;

import java.util.List;
import java.util.Optional;

import managementSystem.entity.Orders;

public interface OrdersDAO {

//	SAVE ORDER

	Orders saveOrder(Orders orders);

//	FETCH ORDER BY ID

	Optional<Orders> fetchById(Integer id);

//	FETCH ALL ORDERS

	List<Orders> fetchAll();

//	DELETE ORDER

	Optional<Orders> deleteOrder(Integer id);
}