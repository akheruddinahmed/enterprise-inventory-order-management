package managementSystem.entity;

import java.time.LocalDateTime;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrePersist;

@Entity
public class UserEntity {

//	---------------- USER ID ----------------

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)

	private Integer id;

//	---------------- USER NAME ----------------

	private String name;

//	---------------- USER AGE ----------------

	private Integer age;

//	---------------- USER EMAIL ----------------

	@Column(unique = true)

	private String email;

//	---------------- USERNAME ----------------

	@Column(unique = true)

	private String userName;

//	---------------- PASSWORD ----------------

	private String password;

//	---------------- PHONE ----------------

	private String phone;

//	---------------- ADDRESS ----------------

	private String address;

//	---------------- ROLE ----------------

	private String role;

//	---------------- CREATED TIME ----------------

	private LocalDateTime createdAt;

//	---------------- USER ORDERS ----------------

	@OneToMany(mappedBy = "user")

	private List<Orders> orders;

//	---------------- AUTO CREATED TIME ----------------

	@PrePersist
	public void createdTime() {

		this.createdAt = LocalDateTime.now();

//		DEFAULT ROLE

		if (this.role == null) {

			this.role = "USER";
		}
	}

//	---------------- GETTER SETTER ----------------

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

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {

		this.createdAt = createdAt;
	}

	public List<Orders> getOrders() {
		return orders;
	}

	public void setOrders(List<Orders> orders) {
		this.orders = orders;
	}
}