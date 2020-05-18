package com.example.project.service.product;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.project.model.product.dao.PetCartDAO;
import com.example.project.model.product.dto.CartDTO;

@Service
public class PetCartServiceImpl implements PetCartService {
	
	@Inject
	PetCartDAO dao;

	@Override
	public List<CartDTO> cart_Money() {
		return dao.cart_Money();
	}

	@Override
	public void pet_insert(CartDTO dto) {
		dao.pet_insert(dto);;

	}

	@Override
	public List<CartDTO> list_petCart(String userid) {
		return dao.list_petCart(userid);
	}

	@Override
	public void pet_delete(int cart_id) {
		dao.pet_delete(cart_id);

	}

	@Override
	public void pet_deleteAll(String userid) {
		dao.pet_deleteAll(userid);

	}

	@Override
	public void pet_update(int cart_id) {
		// TODO Auto-generated method stub

	}

	@Override
	public int pet_Money(String userid) {
		return dao.pet_Money(userid);
	}

	@Override
	public int countCart(String userid, int product_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void update_petCart(CartDTO dto) {
		// TODO Auto-generated method stub

	}

	@Override
	public void modify_petCart(CartDTO dto) {
		dao.modify_petCart(dto);

	}

	@Override
	public List<CartDTO> picture_url() {
		return dao.picture_url();
	}

}
