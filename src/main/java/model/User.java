package model;

public class User {
	private String firstName;
	private String LastName;
	private String userName;
	private String accountType;
	private String email;
	private String password;
	private String address;
	private String phone;
	private String imageUrl;

	public User(String userName, String accountType, String firstName, String lastName, String email, String password,
			String address, String phone, String imageUrl) {
		this.firstName = firstName;
		this.LastName = lastName;
		this.userName = userName;
		this.accountType = accountType;
		this.email = email;
		this.password = password;
		this.address = address;
		this.phone = phone;
		this.imageUrl = imageUrl;
	}

	public User() {
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return LastName;
	}

	public void setLastName(String lastName) {
		LastName = lastName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public String getAccountType() {
		return accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getFullName() {
		return this.firstName + " " + this.LastName;
	}
}
