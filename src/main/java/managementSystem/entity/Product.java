package managementSystem.entity;

import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.PrePersist;

@Entity
public class Product {

//	---------------- PRODUCT ID ----------------

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)

	private Integer id;

//	---------------- PRODUCT FIELDS ----------------

	private String name;

	private Integer price;

	private Integer stock;

	private String description;

	private String category;

	private LocalDateTime createdAt;

//	---------------- AUTO CREATED TIME ----------------

	@PrePersist
	public void createdTime() {

		this.createdAt = LocalDateTime.now();
	}

//	---------------- GETTER AND SETTER ----------------

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {

		this.description = description;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {

		this.category = category;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {

		this.createdAt = createdAt;
	}

}