package com.example.project.model.product.dto;

import org.springframework.web.multipart.MultipartFile;

public class ProductDTO {
	private int product_id;
	private String product_code;
	private String product_name;
	private String product_company;
	private int price;
	private String description;
	private int product_buy;
	private String picture_url;
	private String picture_url_sub1;
	private String picture_url_sub2;
	private String picture_url_sub3;
	private String picture_url_detail;
	private MultipartFile file1;
	private MultipartFile file2;
	private MultipartFile file3;
	private MultipartFile file4;
	private MultipartFile file5;
	
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProduct_code() {
		return product_code;
	}
	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_company() {
		return product_company;
	}
	public void setProduct_company(String product_company) {
		this.product_company = product_company;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getProduct_buy() {
		return product_buy;
	}
	public void setProduct_buy(int product_buy) {
		this.product_buy = product_buy;
	}
	public String getPicture_url() {
		return picture_url;
	}
	public void setPicture_url(String picture_url) {
		this.picture_url = picture_url;
	}
	public MultipartFile getFile1() {
		return file1;
	}
	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}
	
	public String getPicture_url_sub1() {
		return picture_url_sub1;
	}
	public void setPicture_url_sub1(String picture_url_sub1) {
		this.picture_url_sub1 = picture_url_sub1;
	}
	public String getPicture_url_sub2() {
		return picture_url_sub2;
	}
	public void setPicture_url_sub2(String picture_url_sub2) {
		this.picture_url_sub2 = picture_url_sub2;
	}
	public String getPicture_url_sub3() {
		return picture_url_sub3;
	}
	public void setPicture_url_sub3(String picture_url_sub3) {
		this.picture_url_sub3 = picture_url_sub3;
	}
	public String getPicture_url_detail() {
		return picture_url_detail;
	}
	public void setPicture_url_detail(String picture_url_detail) {
		this.picture_url_detail = picture_url_detail;
	}
	
	public MultipartFile getFile2() {
		return file2;
	}
	public void setFile2(MultipartFile file2) {
		this.file2 = file2;
	}
	public MultipartFile getFile3() {
		return file3;
	}
	public void setFile3(MultipartFile file3) {
		this.file3 = file3;
	}
	public MultipartFile getFile4() {
		return file4;
	}
	public void setFile4(MultipartFile file4) {
		this.file4 = file4;
	}
	public MultipartFile getFile5() {
		return file5;
	}
	public void setFile5(MultipartFile file5) {
		this.file5 = file5;
	}
	@Override
	public String toString() {
		return "ProductDTO [product_id=" + product_id + ", product_code=" + product_code + ", product_name="
				+ product_name + ", product_company=" + product_company + ", price=" + price + ", description="
				+ description + ", product_buy=" + product_buy + ", picture_url=" + picture_url + ", picture_url_sub1="
				+ picture_url_sub1 + ", picture_url_sub2=" + picture_url_sub2 + ", picture_url_sub3=" + picture_url_sub3
				+ ", picture_url_detail=" + picture_url_detail + ", file1=" + file1 + ", file2=" + file2 + ", file3="
				+ file3 + ", file4=" + file4 + ", file5=" + file5 + "]";
	}
	
}
