package managementSystem;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;

import managementSystem.repository.ProductRepository;

@SpringBootApplication
public class VendorManagementSystemApplication {

	private final ProductRepository repo;

	public VendorManagementSystemApplication(ProductRepository repository) {
		this.repo = repository;
	}

	public static void main(String[] args) {

		ApplicationContext context = SpringApplication.run(VendorManagementSystemApplication.class, args);

		ProductRepository pr = context.getBean(ProductRepository.class);

		System.out.println("IOC created..." + " --> " + pr);
	}
}