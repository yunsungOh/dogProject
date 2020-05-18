package com.example.project.service.product;

import java.util.List;

import com.example.project.model.product.dto.ProductDTO;

public interface ProductService {
	public List<ProductDTO> listProduct();
	public ProductDTO detailProduct(int product_id);
	public String fileInfo(int product_id);
	public void updateProduct(ProductDTO dto);
	public void deleteProduct(int product_id);
	public void insertProduct(ProductDTO dto);
	public List<ProductDTO> bestListProduct();
	
	public List<ProductDTO> list_pProduct();
	public List<ProductDTO> list_p2Product();
	public List<ProductDTO> list_cProduct();
	public List<ProductDTO> list_nProduct();
	
	public List<ProductDTO> list_AProduct();
	public List<ProductDTO> list_ApProduct();
	public List<ProductDTO> list_Ap2Product();
	public List<ProductDTO> list_AcProduct();
	public List<ProductDTO> list_AnProduct();
	
	public List<ProductDTO> list_BProduct();
	public List<ProductDTO> list_BpProduct();
	public List<ProductDTO> list_Bp2Product();
	public List<ProductDTO> list_BcProduct();
	public List<ProductDTO> list_BnProduct();
	
	public List<ProductDTO> list_CProduct();
	public List<ProductDTO> list_CpProduct();
	public List<ProductDTO> list_Cp2Product();
	public List<ProductDTO> list_CcProduct();
	public List<ProductDTO> list_CnProduct();

	public List<ProductDTO> list_DProduct();
	public List<ProductDTO> list_DpProduct();
	public List<ProductDTO> list_Dp2Product();
	public List<ProductDTO> list_DcProduct();
	public List<ProductDTO> list_DnProduct();
	
	public List<ProductDTO> list_EProduct();
	public List<ProductDTO> list_EpProduct();
	public List<ProductDTO> list_Ep2Product();
	public List<ProductDTO> list_EcProduct();
	public List<ProductDTO> list_EnProduct();
	
	public List<ProductDTO> list_FProduct();
	public List<ProductDTO> list_FpProduct();
	public List<ProductDTO> list_Fp2Product();
	public List<ProductDTO> list_FcProduct();
	public List<ProductDTO> list_FnProduct();

	public List<ProductDTO> list_GProduct();
	public List<ProductDTO> list_GpProduct();
	public List<ProductDTO> list_Gp2Product();
	public List<ProductDTO> list_GcProduct();
	public List<ProductDTO> list_GnProduct();
	
	public List<ProductDTO> list_HProduct();
	public List<ProductDTO> list_HpProduct();
	public List<ProductDTO> list_Hp2Product();
	public List<ProductDTO> list_HcProduct();
	public List<ProductDTO> list_HnProduct();
	public List<ProductDTO> listAll(String search_option, String keyword, int start, int end);
	public int countArticle(String search_option, String keyword);
	public List<ProductDTO> adminListProduct();
}
