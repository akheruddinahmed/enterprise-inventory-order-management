package managementSystem.service;

import java.util.List;
import java.util.Optional;

import managementSystem.entity.Product;
import managementSystem.model.ProductModel;

public interface ProductService {

//	---------------- SAVE PRODUCT ----------------

	Optional<Product> saveProduct(ProductModel product);

//	---------------- FETCH PRODUCT BY ID ----------------

	Optional<Product> fetchById(Integer id);

//	---------------- FETCH ALL PRODUCT ----------------

	List<Product> fetchAll();

//	---------------- FETCH ALL PRODUCT BY FIELD ----------------

	List<Product> fetchAll(String field);

//	---------------- UPDATE PRODUCT ----------------

	Optional<Product> updateProduct(Integer id, ProductModel product);

//	---------------- SAVE UPDATED PRODUCT ----------------

	Product saveUpdatedProduct(Product product);

//	---------------- DELETE PRODUCT ----------------

	Optional<Product> deleteProduct(Integer id);

}