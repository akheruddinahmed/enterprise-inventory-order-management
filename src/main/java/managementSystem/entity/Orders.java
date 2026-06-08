package managementSystem.entity;

import java.time.LocalDateTime;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrePersist;

@Entity
public class Orders {

//	---------------- ORDER ID ----------------

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)

	private Integer id;

//	---------------- ORDER DATE & TIME ----------------

	private LocalDateTime dateTime;

//	---------------- ORDER STATUS ----------------

	private String status;

//	---------------- MANY ORDERS BELONG TO ONE USER ----------------

	@ManyToOne

	private UserEntity user;

//	---------------- ONE ORDER HAS MANY ITEMS ----------------

	@OneToMany(

			mappedBy = "orders",

			cascade = CascadeType.ALL)

	@JsonManagedReference

	private List<OrderItem> items;

//	---------------- AUTO DATE & STATUS ----------------

	@PrePersist
	public void createdOrder() {

		this.dateTime = LocalDateTime.now();

		if (this.status == null) {

			this.status = "PLACED";
		}
	}

//	---------------- GETTERS & SETTERS ----------------

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

	public UserEntity getUser() {

		return user;
	}

	public void setUser(UserEntity user) {

		this.user = user;
	}

	public List<OrderItem> getItems() {

		return items;
	}

	public void setItems(List<OrderItem> items) {

		this.items = items;
	}

	@Override
	public String toString() {

		return "Orders [id=" + id + "]";
	}
}