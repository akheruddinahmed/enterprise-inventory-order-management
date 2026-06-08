package managementSystem.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import managementSystem.dao.ProductDAO;
import managementSystem.entity.Product;
import managementSystem.model.ProductModel;

@Service
public class ProductServiceImp implements ProductService {

	@Autowired
	private ProductDAO dao;

//	---------------- SAVE PRODUCT ----------------

	@Override
	public Optional<Product> saveProduct(ProductModel product) {

		Product p = new Product();

		BeanUtils.copyProperties(product, p);

		return dao.saveProduct(p);
	}

//	---------------- FETCH PRODUCT BY ID ----------------

	@Override
	public Optional<Product> fetchById(Integer id) {

		return dao.fetchById(id);
	}

//	---------------- FETCH ALL PRODUCT ----------------

	@Override
	public List<Product> fetchAll() {

		return dao.fetchAll();
	}

//	---------------- FETCH ALL PRODUCT BY FIELD ----------------

	@Override
	public List<Product> fetchAll(String field) {

		return dao.fetchAll(field);
	}

//	---------------- UPDATE PRODUCT ----------------

	@Override
	public Optional<Product> updateProduct(

			Integer id,

			ProductModel product) {

		Product p = new Product();

		BeanUtils.copyProperties(product, p);

		return dao.updateProduct(id, p);
	}

//	---------------- SAVE UPDATED PRODUCT ----------------

	@Override
	public Product saveUpdatedProduct(Product product) {

		return dao.saveProduct(product).get();
	}

//	---------------- DELETE PRODUCT ----------------

	@Override
	public Optional<Product> deleteProduct(Integer id) {

		return dao.deleteProduct(id);
	}
}