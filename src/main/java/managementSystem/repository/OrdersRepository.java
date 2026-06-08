package managementSystem.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import managementSystem.entity.Orders;

public interface OrdersRepository extends JpaRepository<Orders, Integer> {

}