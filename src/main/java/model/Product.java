package model;

public class Product {
	private int id;
	private String name;
	private String brand;
	private String description;
	private String size;
	private int quantity;
	private double price;
	private String category;
	private String gender;
	private String image;

	public Product() {

	}

	public Product(int id, String name, String brand, String description, String size, int quantity, double price,
			String catagory, String gender, String image) {
		this.id = id;
		this.name = name;
		this.brand = brand;
		this.description = description;
		this.size = size;
		this.quantity = quantity;
		this.price = price;
		this.category = catagory;
		this.gender = gender;
		this.image = image;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
}
