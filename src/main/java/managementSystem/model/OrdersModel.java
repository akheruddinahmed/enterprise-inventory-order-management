package managementSystem.model;

import java.time.LocalDateTime;
import java.util.List;

public class OrdersModel {

	private Integer id;

	private LocalDateTime dateTime;

	private String status;

	private List<OrderItemModel> items;

//	GETTERS & SETTERS

	public Integer getId() {

		return id;
	}

	public void setId(Integer id) {

		this.id = id;
	}

	public LocalDateTime getDateTime() {

		return dateTime;
	}

	public void setDateTime(LocalDateTime dateTime) {

		this.dateTime = dateTime;
	}

	public String getStatus() {

		return status;
	}

	public void setStatus(String status) {

		this.status = status;
	}

	public List<OrderItemModel> getItems() {

		return items;
	}

	public void setItems(List<OrderItemModel> items) {

		this.items = items;
	}
}