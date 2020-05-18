package com.example.project.service.product;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.project.model.product.dao.ProductDAO;
import com.example.project.model.product.dto.ProductDTO;


@Service
public class ProductServiceImpl implements ProductService {

	
	@Inject
	ProductDAO productDao;
	@Override
	public List<ProductDTO> listProduct() {
		
		return productDao.listProduct();
	}

	@Override
	public ProductDTO detailProduct(int product_id) {
		return productDao.detailProduct(product_id);
	}

	@Override
	public String fileInfo(int product_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateProduct(ProductDTO dto) {
		productDao.updateProduct(dto);

	}

	@Override
	public void deleteProduct(int product_id) {
		productDao.deleteProduct(product_id);

	}

	@Override
	public void insertProduct(ProductDTO dto) {
		productDao.insertProduct(dto);

	}
	
	@Override
	public List<ProductDTO> list_pProduct() {
		return productDao.list_pProduct();
	}

	@Override
	public List<ProductDTO> list_p2Product() {
		return productDao.list_p2Product();
	}

	@Override
	public List<ProductDTO> list_cProduct() {
		return productDao.list_cProduct();
	}

	@Override
	public List<ProductDTO> list_nProduct() {
		return productDao.list_nProduct();
	}

	@Override
	public List<ProductDTO> list_AProduct() {
		return productDao.list_AProduct();
	}

	@Override
	public List<ProductDTO> list_ApProduct() {
		return productDao.list_ApProduct();
	}
	
	@Override
	public List<ProductDTO> list_Ap2Product() {
		return productDao.list_Ap2Product();
	}

	@Override
	public List<ProductDTO> list_AcProduct() {
		return productDao.list_AcProduct();
	}

	@Override
	public List<ProductDTO> list_AnProduct() {
		return productDao.list_AnProduct();
	}

	@Override
	public List<ProductDTO> bestListProduct() {
		return productDao. bestListProduct();
	}

	@Override
	public List<ProductDTO> list_BProduct() {
		return productDao.list_BProduct();
	}

	@Override
	public List<ProductDTO> list_BpProduct() {
		return productDao.list_BpProduct();
	}
	
	@Override
	public List<ProductDTO> list_Bp2Product() {
		return productDao.list_Bp2Product();
	}

	@Override
	public List<ProductDTO> list_BcProduct() {
		return productDao.list_BcProduct();
	}

	@Override
	public List<ProductDTO> list_BnProduct() {
		return productDao.list_BnProduct();
	}

	@Override
	public List<ProductDTO> list_CProduct() {
		return productDao.list_CProduct();
	}

	@Override
	public List<ProductDTO> list_CpProduct() {
		return productDao.list_CpProduct();
	}
	
	@Override
	public List<ProductDTO> list_Cp2Product() {
		return productDao.list_Cp2Product();
	}

	@Override
	public List<ProductDTO> list_CcProduct() {
		return productDao.list_CcProduct();
	}

	@Override
	public List<ProductDTO> list_CnProduct() {
		return productDao.list_CnProduct();
	}

	@Override
	public List<ProductDTO> list_DProduct() {
		return productDao.list_DProduct();
	}

	@Override
	public List<ProductDTO> list_DpProduct() {
		return productDao.list_DpProduct();
	}
	
	@Override
	public List<ProductDTO> list_Dp2Product() {
		return productDao.list_Dp2Product();
	}

	@Override
	public List<ProductDTO> list_DcProduct() {
		return productDao.list_DcProduct();
	}

	@Override
	public List<ProductDTO> list_DnProduct() {
		return productDao.list_DnProduct();
	}

	@Override
	public List<ProductDTO> list_EProduct() {
		return productDao.list_EProduct();
	}

	@Override
	public List<ProductDTO> list_EpProduct() {
		return productDao.list_EpProduct();
	}

	@Override
	public List<ProductDTO> list_Ep2Product() {
		return productDao.list_Ep2Product();
	}
	
	@Override
	public List<ProductDTO> list_EcProduct() {
		return productDao.list_EcProduct();
	}

	@Override
	public List<ProductDTO> list_EnProduct() {
		return productDao.list_EnProduct();
	}

	@Override
	public List<ProductDTO> list_FProduct() {
		return productDao.list_FProduct();
	}

	@Override
	public List<ProductDTO> list_FpProduct() {
		return productDao.list_FpProduct();
	}
	
	@Override
	public List<ProductDTO> list_Fp2Product() {
		return productDao.list_Fp2Product();
	}

	@Override
	public List<ProductDTO> list_FcProduct() {
		return productDao.list_FcProduct();
	}

	@Override
	public List<ProductDTO> list_FnProduct() {
		return productDao.list_FnProduct();
	}@Override
	public List<ProductDTO> list_GProduct() {
		return productDao.list_GProduct();
	}

	@Override
	public List<ProductDTO> list_GpProduct() {
		return productDao.list_GpProduct();
	}
	
	@Override
	public List<ProductDTO> list_Gp2Product() {
		return productDao.list_Gp2Product();
	}

	@Override
	public List<ProductDTO> list_GcProduct() {
		return productDao.list_GcProduct();
	}

	@Override
	public List<ProductDTO> list_GnProduct() {
		return productDao.list_GnProduct();
	}
	
	@Override
	public List<ProductDTO> list_HProduct() {
		return productDao.list_HProduct();
	}

	@Override
	public List<ProductDTO> list_HpProduct() {
		return productDao.list_HpProduct();
	}
	
	@Override
	public List<ProductDTO> list_Hp2Product() {
		return productDao.list_Hp2Product();
	}

	@Override
	public List<ProductDTO> list_HcProduct() {
		return productDao.list_HcProduct();
	}

	@Override
	public List<ProductDTO> list_HnProduct() {
		return productDao.list_HnProduct();
	}

	@Override
	public List<ProductDTO> listAll(String search_option, String keyword, int start, int end) {
		
		return productDao.listAll(search_option, keyword, start, end);
	}

	@Override
	public int countArticle(String search_option, String keyword) {
		return 0;
	}

	@Override
	public List<ProductDTO> adminListProduct() {
		
		return productDao.adminListProduct();
	}

}
