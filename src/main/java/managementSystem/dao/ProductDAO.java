package managementSystem.dao;

import java.util.List;
import java.util.Optional;

import managementSystem.entity.Product;

public interface ProductDAO {

//	---------------- SAVE PRODUCT ----------------

	Optional<Product> saveProduct(Product product);

//	---------------- FETCH PRODUCT BY ID ----------------

	Optional<Product> fetchById(Integer id);

//	---------------- FETCH ALL PRODUCT ----------------

	List<Product> fetchAll();

//	---------------- FETCH ALL PRODUCT BY FIELD ----------------

	List<Product> fetchAll(String field);

//	---------------- UPDATE PRODUCT ----------------

	Optional<Product> updateProduct(Integer id, Product product);

//	---------------- DELETE PRODUCT ----------------

	Optional<Product> deleteProduct(Integer id);

}