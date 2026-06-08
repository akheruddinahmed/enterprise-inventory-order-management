package managementSystem.model;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

public class UserModel {

//	---------------- USER NAME ----------------

	@NotBlank(message = "Name is required")

	private String name;

//	---------------- USER AGE ----------------

	@NotNull(message = "Age is required")

	@Min(value = 18,

			message = "Age must be 18 or above")

	private Integer age;

//	---------------- USER EMAIL ----------------

	@NotBlank(message = "Email is required")

	@Email(message = "Invalid email")

	private String email;

//	---------------- USER PHONE ----------------

	@NotBlank(message = "Phone number required")

	private String phone;

//	---------------- USER ADDRESS ----------------

	@NotBlank(message = "Address required")

	private String address;

//	---------------- USERNAME ----------------

	@NotBlank(message = "Username required")

	private String userName;

//	---------------- PASSWORD ----------------

	@NotBlank(message = "Password required")

	@Size(min = 6,

			message = "Password must be at least 6 characters")

	private String password;

//	---------------- GETTER SETTER ----------------

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

}