package com.service.spring.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.json.JSONObject;

@Getter @Setter
@ToString
public class Snack {
	private Long snackId;
    private String name;
    private int price;    
    private String category;
	private String brand;
    private int quantity;
    private String imgUrl;

	private String link;
    
    public Snack() {
    	
    }
	public Snack(String name, int price, String brand, String category, int quantity, String imgUrl, String link) {
		super();
		this.name = name;
		this.price = price;
		this.brand = brand;
		this.category = category;
		this.quantity = quantity;
		this.imgUrl = imgUrl;
		this.link = link;
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

	public Snack(JSONObject item, String category, int quantity) {
		this.snackId = Long.parseLong(item.getString("productId"));
		this.name = item.getString("title");
		this.price = Integer.parseInt(item.getString("lprice"));
		this.brand = item.getString("brand");
		this.imgUrl = item.getString("image");
		this.link = item.getString("link");
		this.category = category;
		this.quantity = quantity;
	}
	
    public Snack(Long snackId) {
    	this.snackId = snackId;
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
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
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
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}

	@Override
	public String toString() {
		return "Snack{" +
				"snackId=" + snackId +
				", name='" + name + '\'' +
				", price=" + price +
				", category='" + category + '\'' +
				", brand='" + brand + '\'' +
				", quantity=" + quantity +
				", imgUrl='" + imgUrl + '\'' +
				", link='" + link + '\'' +
				'}';
	}
}
