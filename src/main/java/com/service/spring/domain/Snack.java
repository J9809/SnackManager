package com.service.spring.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

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
}
