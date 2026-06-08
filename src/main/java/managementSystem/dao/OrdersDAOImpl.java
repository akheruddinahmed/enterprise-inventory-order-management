package managementSystem.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import managementSystem.entity.Orders;
import managementSystem.repository.OrdersRepository;

@Repository
public class OrdersDAOImpl implements OrdersDAO {

	@Autowired
	private OrdersRepository repository;

//	SAVE ORDER

	@Override
	public Orders saveOrder(Orders orders) {

		return repository.save(orders);
	}

//	FETCH ORDER BY ID

	@Override
	public Optional<Orders> fetchById(Integer id) {

		return repository.findById(id);
	}

//	FETCH ALL ORDERS

	@Override
	public List<Orders> fetchAll() {

		return repository.findAll();
	}

//	DELETE ORDER

	@Override
	public Optional<Orders> deleteOrder(Integer id) {

		Optional<Orders> optional =
				repository.findById(id);

		if (optional.isPresent()) {

			repository.delete(optional.get());

			return optional;
		}

		return Optional.empty();
	}
}