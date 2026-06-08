package managementSystem.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

import managementSystem.entity.Product;
import managementSystem.repository.ProductRepository;

@Repository
public class ProductDaoImplement implements ProductDAO {

	@Autowired
	private ProductRepository repository;

//	---------------- SAVE PRODUCT ----------------

	@Override
	public Optional<Product> saveProduct(Product product) {

		Product saveProduct = repository.save(product);

		return Optional.ofNullable(saveProduct);
	}

//	---------------- FETCH PRODUCT BY ID ----------------

	@Override
	public Optional<Product> fetchById(Integer id) {

		Optional<Product> optional = repository.findById(id);

		return optional;
	}

//	---------------- FETCH ALL PRODUCT ----------------

	@Override
	public List<Product> fetchAll() {

		List<Product> list = repository.findAll();

		return list;
	}

//	---------------- FETCH ALL PRODUCT BY FIELD ----------------

	@Override
	public List<Product> fetchAll(String field) {

		return repository.findAll(Sort.by(field));
	}

//	---------------- UPDATE PRODUCT ----------------

	@Override
	public Optional<Product> updateProduct(Integer id, Product product) {

		Optional<Product> optional = repository.findById(id);

		if (optional.isPresent()) {

			Product dbProduct = optional.get();

			dbProduct.setName(product.getName());

			dbProduct.setPrice(product.getPrice());

			dbProduct.setStock(product.getStock());

			dbProduct.setCategory(product.getCategory());

			dbProduct.setDescription(product.getDescription());

			Product updated = repository.save(dbProduct);

			return Optional.of(updated);
		}

		return Optional.empty();
	}

//	---------------- DELETE PRODUCT ----------------

	@Override
	public Optional<Product> deleteProduct(Integer id) {

		Optional<Product> optional = repository.findById(id);

		if (optional.isPresent()) {

			repository.deleteById(id);

			return optional;
		}

		return Optional.empty();
	}

}