package managementSystem.model;

import java.time.LocalDateTime;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

public class ProductModel {

	
	
//	---------------- PRODUCT NAME ----------------

	@NotBlank(
	message = "Product name is required")
	
	@Size(
	min = 2,
	max = 50,
	message =
	"Product name must be between 2 to 50 characters")
	
	private String name;

	
	
//	---------------- PRODUCT PRICE ----------------

	@NotNull(
	message = "Product price is required")
	
	@Min(
	value = 1,
	message =
	"Price must be greater than 0")
	
	private Integer price;

	
	
//	---------------- PRODUCT STOCK ----------------

	@NotNull(
	message = "Product stock is required")
	
	@Min(
	value = 0,
	message =
	"Stock cannot be negative")
	
	private Integer stock;

	
	
//	---------------- PRODUCT CATEGORY ----------------

	@NotBlank(
	message = "Category is required")
	
	private String category;

	
	
//	---------------- PRODUCT DESCRIPTION ----------------

	@Size(
	max = 200,
	message =
	"Description cannot exceed 200 characters")
	
	private String description;

	
	
//	---------------- PRODUCT CREATED TIME ----------------

	private LocalDateTime createdAt;

	
	
	
//	---------------- GETTER AND SETTER ----------------

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Integer getStock() {
		return stock;
	}

	public void setStock(Integer stock) {
		this.stock = stock;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(
			String description) {

		this.description = description;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(
			LocalDateTime createdAt) {

		this.createdAt = createdAt;
	}

}