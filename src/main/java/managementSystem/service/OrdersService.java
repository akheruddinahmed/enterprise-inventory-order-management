package managementSystem.service;

import java.util.List;
import java.util.Optional;

import managementSystem.entity.Orders;
import managementSystem.entity.UserEntity;
import managementSystem.model.OrdersModel;

public interface OrdersService {

//	---------------- SAVE ORDER ----------------

	Optional<Orders> saveOrder(OrdersModel model, UserEntity user);

//	---------------- SAVE UPDATED ORDER ----------------

	Orders saveUpdatedOrder(Orders order);

//	---------------- FETCH ORDER BY ID ----------------

	Optional<Orders> fetchById(Integer id);

//	---------------- FETCH ALL ORDERS ----------------

	List<Orders> fetchAll();

//	---------------- DELETE ORDER ----------------

	Optional<Orders> deleteOrder(Integer id);
	
	
	
	
}
