package managementSystem.model;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;

public class OrderItemModel {

	private Integer id;

	@NotNull(message = "Quantity Required")
	@Min(value = 1, message = "Quantity Must Be Greater Than 0")
	private Integer quantity;

	@NotNull(message = "Price Required")
	@Min(value = 1, message = "Price Must Be Greater Than 0")
	private Integer price;

	@NotNull(message = "Product Id Required")
	private Integer productId;

//	GETTERS & SETTERS

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}
}