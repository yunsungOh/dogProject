package com.example.project.model.product.dto;

public class CartDTO {
	private int cart_id;
	private String userid;
	private String username;
	private int product_id;
	private String product_name;
	private int price;
	private int money;
	private int amount;
	private String picture_url;
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	public String getPicture_url() {
		return picture_url;
	}
	public void setPicture_url(String picture_url) {
		this.picture_url = picture_url;
	}
	@Override
	public String toString() {
		return "CartDTO [cart_id=" + cart_id + ", userid=" + userid + ", username=" + username + ", product_id=" + product_id
				+ ", product_name=" + product_name + ", price=" + price + ", money=" + money + ", amount=" + amount
				+ ", picture_url=" + picture_url + "]";
	}
	
	

}
