package managementSystem.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import managementSystem.entity.OrderItem;
import managementSystem.repository.OrderItemRepository;

@Repository
public class OrderItemDAOImpl implements OrderItemDAO {

	@Autowired
	private OrderItemRepository repository;

//	SAVE ORDER ITEM

	@Override
	public OrderItem saveOrderItem(OrderItem item) {

		return repository.save(item);
	}

//	FETCH ORDER ITEM BY ID

	@Override
	public Optional<OrderItem> fetchById(Integer id) {

		return repository.findById(id);
	}

//	FETCH ALL ORDER ITEMS

	@Override
	public List<OrderItem> fetchAll() {

		return repository.findAll();
	}

//	DELETE ORDER ITEM

	@Override
	public Optional<OrderItem> deleteOrderItem(Integer id) {

		Optional<OrderItem> optional = repository.findById(id);

		if (optional.isPresent()) {

			repository.delete(optional.get());

			return optional;
		}

		return Optional.empty();
	}
}