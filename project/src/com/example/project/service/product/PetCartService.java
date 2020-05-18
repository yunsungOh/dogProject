package com.example.project.service.product;

import java.util.List;

import com.example.project.model.product.dto.CartDTO;

public interface PetCartService {
	
	public List<CartDTO> cart_Money();
	public void pet_insert(CartDTO dto);//장바구니에 상품저장
	public List<CartDTO> list_petCart(String userid);//장바구니 상품 리스트보기
	public void pet_delete(int cart_id);//장바구니 개별 상품 삭제
	public void pet_deleteAll(String userid);//장바구니 전체지우기
	public void pet_update(int cart_id);
	public int pet_Money(String userid);//장바구니 상품 합계금액처리
	public int countCart(String userid, int product_id);
	public void update_petCart(CartDTO dto);//장바구니속 전체상품 수정
	public void modify_petCart(CartDTO dto);//장바구니 개별상품 수량수정
	public List<CartDTO> picture_url();//이미지

}
