package com.example.project.model.product.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.project.model.product.dto.CartDTO;

@Repository
public class PetCartDAOImpl implements PetCartDAO {
	
	@Inject
	SqlSession sql;

	@Override
	public List<CartDTO> cart_Money() {
		return sql.selectList("petcart.cart_Money");
	}

	@Override
	public void pet_insert(CartDTO dto) {
		sql.insert("petcart.pet_insert", dto);

	}

	@Override
	public List<CartDTO> list_petCart(String userid) {
		return sql.selectList("petcart.list_petCart", userid);
	}

	@Override
	public void pet_delete(int cart_id) {
		sql.delete("petcart.pet_delete",cart_id);

	}

	@Override
	public void pet_deleteAll(String userid) {
		sql.delete("petcart.pet_deleteAll",userid);

	}

	@Override
	public void pet_update(int cart_id) {
		// TODO Auto-generated method stub

	}

	@Override
	public int pet_Money(String userid) {
		return sql.selectOne("petcart.pet_Money", userid);
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
		sql.update("petcart.modify_petCart", dto);

	}

	@Override
	public List<CartDTO> picture_url() {
		return sql.selectList("petcart.petcarlist");
	}

}
