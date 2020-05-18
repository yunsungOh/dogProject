package com.example.project.model.product.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.project.model.product.dto.ProductDTO;

@Repository
public class ProductDAOImpl implements ProductDAO {

	
	@Inject
	SqlSession sqlSession;
	@Override
	public List<ProductDTO> listProduct() {
		
		return sqlSession.selectList("product.product_list");
	}

	@Override
	public ProductDTO detailProduct(int product_id) {
		return sqlSession.selectOne("product.detail_product",product_id);
	}

	@Override
	public String fileInfo(int product_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateProduct(ProductDTO dto) {
		sqlSession.update("product.update_product",dto);

	}

	@Override
	public void deleteProduct(int product_id) {
		sqlSession.delete("product.product_delete",product_id);

	}

	@Override
	public void insertProduct(ProductDTO dto) {
		sqlSession.insert("product.insert",dto);

	}

	@Override
	public List<ProductDTO> list_pProduct() {
		return sqlSession.selectList("product.product_list_p");
	}

	@Override
	public List<ProductDTO> list_p2Product() {
		return sqlSession.selectList("product.product_list_p2");
	}

	@Override
	public List<ProductDTO> list_cProduct() {
		return sqlSession.selectList("product.product_list_c");
	}

	@Override
	public List<ProductDTO> list_nProduct() {
		return sqlSession.selectList("product.product_list_n");
	}
	
	@Override
	public List<ProductDTO> list_AProduct() {
		return sqlSession.selectList("product.product_list_A");
	}

	@Override
	public List<ProductDTO> list_ApProduct() {
		return sqlSession.selectList("product.product_list_Ap");
	}
	
	@Override
	public List<ProductDTO> list_Ap2Product() {
		return sqlSession.selectList("product.product_list_Ap2");
	}

	@Override
	public List<ProductDTO> list_AcProduct() {
		return sqlSession.selectList("product.product_list_Ac");
	}

	@Override
	public List<ProductDTO> list_AnProduct() {
		return sqlSession.selectList("product.product_list_An");
	}

	@Override
	public List<ProductDTO> bestListProduct() {
		return sqlSession.selectList("product.product_bestList");
	}

	@Override
	public List<ProductDTO> list_BProduct() {
		return sqlSession.selectList("product.product_list_B");
	}

	@Override
	public List<ProductDTO> list_BpProduct() {
		return sqlSession.selectList("product.product_list_Bp");
	}
	
	@Override
	public List<ProductDTO> list_Bp2Product() {
		return sqlSession.selectList("product.product_list_Bp2");
	}


	@Override
	public List<ProductDTO> list_BcProduct() {
		return sqlSession.selectList("product.product_list_Bc");
	}

	@Override
	public List<ProductDTO> list_BnProduct() {
		return sqlSession.selectList("product.product_list_Bn");
	}

	@Override
	public List<ProductDTO> list_CProduct() {
		return sqlSession.selectList("product.product_list_C");
	}

	@Override
	public List<ProductDTO> list_CpProduct() {
		return sqlSession.selectList("product.product_list_Cp");
	}
	
	@Override
	public List<ProductDTO> list_Cp2Product() {
		return sqlSession.selectList("product.product_list_Cp2");
	}


	@Override
	public List<ProductDTO> list_CcProduct() {
		return sqlSession.selectList("product.product_list_Cc");
	}

	@Override
	public List<ProductDTO> list_CnProduct() {
		return sqlSession.selectList("product.product_list_Cn");
	}

	@Override
	public List<ProductDTO> list_DProduct() {
		return sqlSession.selectList("product.product_list_D");
	}

	@Override
	public List<ProductDTO> list_DpProduct() {
		return sqlSession.selectList("product.product_list_Dp");
	}
	
	@Override
	public List<ProductDTO> list_Dp2Product() {
		return sqlSession.selectList("product.product_list_Dp2");
	}

	@Override
	public List<ProductDTO> list_DcProduct() {
		return sqlSession.selectList("product.product_list_Dc");
	}

	@Override
	public List<ProductDTO> list_DnProduct() {
		return sqlSession.selectList("product.product_list_Dn");
	}

	@Override
	public List<ProductDTO> list_EProduct() {
		return sqlSession.selectList("product.product_list_E");
	}

	@Override
	public List<ProductDTO> list_EpProduct() {
		return sqlSession.selectList("product.product_list_Ep");
	}
	
	@Override
	public List<ProductDTO> list_Ep2Product() {
		return sqlSession.selectList("product.product_list_Ep2");
	}

	@Override
	public List<ProductDTO> list_EcProduct() {
		return sqlSession.selectList("product.product_list_Ec");
	}

	@Override
	public List<ProductDTO> list_EnProduct() {
		return sqlSession.selectList("product.product_list_En");
	}

	@Override
	public List<ProductDTO> list_FProduct() {
		return sqlSession.selectList("product.product_list_F");
	}

	@Override
	public List<ProductDTO> list_FpProduct() {
		return sqlSession.selectList("product.product_list_Fp");
	}
	
	@Override
	public List<ProductDTO> list_Fp2Product() {
		return sqlSession.selectList("product.product_list_Fp2");
	}

	@Override
	public List<ProductDTO> list_FcProduct() {
		return sqlSession.selectList("product.product_list_Fc");
	}

	@Override
	public List<ProductDTO> list_FnProduct() {
		return sqlSession.selectList("product.product_list_Fn");
	}

	@Override
	public List<ProductDTO> list_GProduct() {
		return sqlSession.selectList("product.product_list_G");
	}

	@Override
	public List<ProductDTO> list_GpProduct() {
		return sqlSession.selectList("product.product_list_Gp");
	}
	
	@Override
	public List<ProductDTO> list_Gp2Product() {
		return sqlSession.selectList("product.product_list_Gp2");
	}

	@Override
	public List<ProductDTO> list_GcProduct() {
		return sqlSession.selectList("product.product_list_Gc");
	}

	@Override
	public List<ProductDTO> list_GnProduct() {
		return sqlSession.selectList("product.product_list_Gn");
	}

	@Override
	public List<ProductDTO> list_HProduct() {
		return sqlSession.selectList("product.product_list_H");
	}

	@Override
	public List<ProductDTO> list_HpProduct() {
		return sqlSession.selectList("product.product_list_Hp");
	}
	
	@Override
	public List<ProductDTO> list_Hp2Product() {
		return sqlSession.selectList("product.product_list_Hp2");
	}

	@Override
	public List<ProductDTO> list_HcProduct() {
		return sqlSession.selectList("product.product_list_Hc");
	}

	@Override
	public List<ProductDTO> list_HnProduct() {
		return sqlSession.selectList("product.product_list_Hn");
	}

	@Override
	public List<ProductDTO> listAll(String search_option, String keyword, int start, int end) {
		Map<String,Object> map=new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");
		map.put("start", start);//맵에 자료저장
		map.put("end", end);
		
		return sqlSession.selectList("product.product_list",map);
	}

	@Override
	public int countArticle(String search_option, String keyword) {
		return 0;
	}

	@Override
	public List<ProductDTO> adminListProduct() {
		
		return sqlSession.selectList("product.product_adminList");
	}

	
}
