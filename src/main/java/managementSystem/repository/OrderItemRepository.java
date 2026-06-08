package managementSystem.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import managementSystem.entity.OrderItem;

public interface OrderItemRepository extends JpaRepository<OrderItem, Integer> {

}