package com.service.spring.domain;

public class Snack {
	private Long snackId;
    private String name;
    private int price;    
    private String category;
    private int quantity;
    private String imgUrl;
    
    public Snack() {
    	
    }
	public Snack(String name, int price, String category, int quantity, String imgUrl) {
		super();
		this.name = name;
		this.price = price;
		this.category = category;
		this.quantity = quantity;
		this.imgUrl = imgUrl;
	}
	public Snack(Long snackId, String name, int price, String category, int quantity, String imgUrl) {
		super();
		this.snackId = snackId;
		this.name = name;
		this.price = price;
		this.category = category;
		this.quantity = quantity;
		this.imgUrl = imgUrl;
	}
	public Long getSnackId() {
		return snackId;
	}
	public void setSnackId(Long snackId) {
		this.snackId = snackId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	@Override
	public String toString() {
		return "Snack [snackId=" + snackId + ", name=" + name + ", price=" + price + ", category=" + category
				+ ", quantity=" + quantity + ", imgUrl=" + imgUrl + "]";
	}
}
