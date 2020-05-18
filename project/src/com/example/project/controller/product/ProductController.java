package com.example.project.controller.product;

import javax.inject.Inject;
import java.io.File;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.product.dto.ProductDTO;
import com.example.project.service.product.ProductService;

import com.example.project.service.product.Pager;


@Controller
@RequestMapping("shop/product/*")
public class ProductController {

	@Inject
	ProductService productService;

	@RequestMapping("list.do")
	public ModelAndView list(
			@RequestParam(defaultValue = "name") String search_option,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue="1") int curPage) 
					throws Exception {
		//레코드 갯수 계산
		int count=productService.countArticle(search_option,keyword);
		//페이지 관련 설정
		Pager pager=new Pager(count, curPage);
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();

		List<ProductDTO> list=productService.listAll(search_option,keyword, start,end); //게시물 목록
		ModelAndView mav=new ModelAndView();
		HashMap<String, Object> map=new HashMap<>();
		map.put("list", list); //map에 자료 저장
		map.put("count", count);
		map.put("pager", pager); //페이지 네비게이션을 위한 변수
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		mav.setViewName("shop/product_list"); //포워딩할 뷰의 이름
		mav.addObject("map", map); //ModelAndView에 map을 저장
		return mav; //
	}//list()
	/**********************************list***************************************/
	@RequestMapping("bestList.do")
	public ModelAndView bestList(ModelAndView mav) {
		mav.setViewName("shop/product_bestList");
		mav.addObject("list", productService.bestListProduct());
		return mav;
	}//end bestList() best 리스트

	@RequestMapping("adminList.do")
	public ModelAndView adminList(ModelAndView mav) {
		mav.setViewName("shop/product_adminList");
		mav.addObject("list", productService.adminListProduct());
		return mav;
	}//end bestList() best 리스트
	
	@RequestMapping("list_p.do")
	public ModelAndView list_p(ModelAndView mav) {
		mav.setViewName("shop/product_list");
		mav.addObject("list", productService.list_pProduct());
		return mav;
	}//end list_Ap 사료 가격순  정렬

	@RequestMapping("list_p2.do")
	public ModelAndView list_p2(ModelAndView mav) {
		mav.setViewName("shop/product_list");
		mav.addObject("list", productService.list_p2Product());
		return mav;
	}//end list_Ap 사료 가격순  정렬

	@RequestMapping("list_c.do")
	public ModelAndView list_c(ModelAndView mav) {
		mav.setViewName("shop/product_list");
		mav.addObject("list", productService.list_cProduct());
		return mav;
	}//end list_Ap company 사료 정렬

	@RequestMapping("list_n.do")
	public ModelAndView list_n(ModelAndView mav) {
		mav.setViewName("shop/product_list");
		mav.addObject("list", productService.list_nProduct());
		return mav;
	}
	
	@RequestMapping("list_A.do")
	public ModelAndView list_A(ModelAndView mav) {
		mav.setViewName("shop/product_listA");
		mav.addObject("list", productService.list_AProduct());
		return mav;
	}//end list_A() 사료 리스트
	@RequestMapping("list_Ap.do")
	public ModelAndView list_Ap(ModelAndView mav) {
		mav.setViewName("shop/product_listA");
		mav.addObject("list", productService.list_ApProduct());
		return mav;
	}//end list_Ap 사료 가격순  정렬

	@RequestMapping("list_Ap2.do")
	public ModelAndView list_Ap2(ModelAndView mav) {
		mav.setViewName("shop/product_listA");
		mav.addObject("list", productService.list_Ap2Product());
		return mav;
	}//end list_Ap 사료 가격순  정렬

	@RequestMapping("list_Ac.do")
	public ModelAndView list_Ac(ModelAndView mav) {
		mav.setViewName("shop/product_listA");
		mav.addObject("list", productService.list_AcProduct());
		return mav;
	}//end list_Ap company 사료 정렬

	@RequestMapping("list_An.do")
	public ModelAndView list_An(ModelAndView mav) {
		mav.setViewName("shop/product_listA");
		mav.addObject("list", productService.list_AnProduct());
		return mav;
	}//end list_Ap name순 사료 정렬
	/**********************************listA***************************************/
	@RequestMapping("list_B.do")
	public ModelAndView list_B(ModelAndView mav) {
		mav.setViewName("shop/product_listB");
		mav.addObject("list", productService.list_BProduct());
		return mav;
	}//end list_A() 사료 리스트

	@RequestMapping("list_Bp.do")
	public ModelAndView list_Bp(ModelAndView mav) {
		mav.setViewName("shop/product_listB");
		mav.addObject("list", productService.list_Bp2Product());
		return mav;
	}//end list_Ap 사료 높은 가격순  정렬

	@RequestMapping("list_Bp2.do")
	public ModelAndView list_Bp2(ModelAndView mav) {
		mav.setViewName("shop/product_listB");
		mav.addObject("list", productService.list_BpProduct());
		return mav;
	}//end list_Ap 사료 낮은 가격순  정렬

	@RequestMapping("list_Bc.do")
	public ModelAndView list_Bc(ModelAndView mav) {
		mav.setViewName("shop/product_listB");
		mav.addObject("list", productService.list_BcProduct());
		return mav;
	}//end list_Ap company 사료 정렬

	@RequestMapping("list_Bn.do")
	public ModelAndView list_Bn(ModelAndView mav) {
		mav.setViewName("shop/product_listB");
		mav.addObject("list", productService.list_BnProduct());
		return mav;
	}//end list_Ap name순 사료 정렬
	/**********************************listB***************************************/
	@RequestMapping("list_C.do")
	public ModelAndView list_C(ModelAndView mav) {
		mav.setViewName("shop/product_listC");
		mav.addObject("list", productService.list_CProduct());
		return mav;
	}//end list_A() 사료 리스트

	@RequestMapping("list_Cp.do")
	public ModelAndView list_Cp(ModelAndView mav) {
		mav.setViewName("shop/product_listC");
		mav.addObject("list", productService.list_Cp2Product());
		return mav;
	}//end list_Ap 사료 가격순  정렬

	@RequestMapping("list_Cp2.do")
	public ModelAndView list_Cp2(ModelAndView mav) {
		mav.setViewName("shop/product_listC");
		mav.addObject("list", productService.list_Cp2Product());
		return mav;
	}

	@RequestMapping("list_Cc.do")
	public ModelAndView list_Cc(ModelAndView mav) {
		mav.setViewName("shop/product_listC");
		mav.addObject("list", productService.list_CcProduct());
		return mav;
	}//end list_Ap company 사료 정렬

	@RequestMapping("list_Cn.do")
	public ModelAndView list_Cn(ModelAndView mav) {
		mav.setViewName("shop/product_listC");
		mav.addObject("list", productService.list_CnProduct());
		return mav;
	}//end list_Ap name순 사료 정렬
	/**********************************listC***************************************/	

	@RequestMapping("list_D.do")
	public ModelAndView list_D(ModelAndView mav) {
		mav.setViewName("shop/product_listD");
		mav.addObject("list", productService.list_DProduct());
		return mav;
	}//end list_A() 사료 리스트

	@RequestMapping("list_Dp.do")
	public ModelAndView list_Dp(ModelAndView mav) {
		mav.setViewName("shop/product_listD");
		mav.addObject("list", productService.list_DpProduct());
		return mav;
	}//end list_Ap 사료 가격순  정렬

	@RequestMapping("list_Dp2.do")
	public ModelAndView list_Dp2(ModelAndView mav) {
		mav.setViewName("shop/product_listD");
		mav.addObject("list", productService.list_Dp2Product());
		return mav;
	}

	@RequestMapping("list_Dc.do")
	public ModelAndView list_Dc(ModelAndView mav) {
		mav.setViewName("shop/product_listD");
		mav.addObject("list", productService.list_DcProduct());
		return mav;
	}//end list_Ap company 사료 정렬

	@RequestMapping("list_Dn.do")
	public ModelAndView list_Dn(ModelAndView mav) {
		mav.setViewName("shop/product_listD");
		mav.addObject("list", productService.list_DnProduct());
		return mav;
	}//end list_Ap name순 사료 정렬
	/**********************************listD***************************************/	

	@RequestMapping("list_E.do")
	public ModelAndView list_E(ModelAndView mav) {
		mav.setViewName("shop/product_listE");
		mav.addObject("list", productService.list_EProduct());
		return mav;
	}//end list_A() 사료 리스트

	@RequestMapping("list_Ep.do")
	public ModelAndView list_Ep(ModelAndView mav) {
		mav.setViewName("shop/product_listE");
		mav.addObject("list", productService.list_EpProduct());
		return mav;
	}//end list_Ap 사료 가격순  정렬

	@RequestMapping("list_Ep2.do")
	public ModelAndView list_Ep2(ModelAndView mav) {
		mav.setViewName("shop/product_listE");
		mav.addObject("list", productService.list_Ep2Product());
		return mav;
	}

	@RequestMapping("list_Ec.do")
	public ModelAndView list_Ec(ModelAndView mav) {
		mav.setViewName("shop/product_listE");
		mav.addObject("list", productService.list_EcProduct());
		return mav;
	}//end list_Ap company 사료 정렬

	@RequestMapping("list_En.do")
	public ModelAndView list_En(ModelAndView mav) {
		mav.setViewName("shop/product_listE");
		mav.addObject("list", productService.list_EnProduct());
		return mav;
	}//end list_Ap name순 사료 정렬
	/**********************************listE***************************************/

	@RequestMapping("list_F.do")
	public ModelAndView list_F(ModelAndView mav) {
		mav.setViewName("shop/product_listF");
		mav.addObject("list", productService.list_FProduct());
		return mav;
	}//end list_A() 사료 리스트

	@RequestMapping("list_Fp.do")
	public ModelAndView list_Fp(ModelAndView mav) {
		mav.setViewName("shop/product_listF");
		mav.addObject("list", productService.list_FpProduct());
		return mav;
	}//end list_Ap 사료 가격순  정렬

	@RequestMapping("list_Fp2.do")
	public ModelAndView list_Fp2(ModelAndView mav) {
		mav.setViewName("shop/product_listF");
		mav.addObject("list", productService.list_Fp2Product());
		return mav;
	}

	@RequestMapping("list_Fc.do")
	public ModelAndView list_Fc(ModelAndView mav) {
		mav.setViewName("shop/product_listF");
		mav.addObject("list", productService.list_FcProduct());
		return mav;
	}//end list_Ap company 사료 정렬

	@RequestMapping("list_Fn.do")
	public ModelAndView list_Fn(ModelAndView mav) {
		mav.setViewName("shop/product_listF");
		mav.addObject("list", productService.list_FnProduct());
		return mav;
	}//end list_Ap name순 사료 정렬
	/**********************************listF***************************************/

	@RequestMapping("list_G.do")
	public ModelAndView list_G(ModelAndView mav) {
		mav.setViewName("shop/product_listG");
		mav.addObject("list", productService.list_GProduct());
		return mav;
	}//end list_A() 사료 리스트

	@RequestMapping("list_Gp.do")
	public ModelAndView list_Gp(ModelAndView mav) {
		mav.setViewName("shop/product_listG");
		mav.addObject("list", productService.list_GpProduct());
		return mav;
	}//end list_Ap 사료 가격순  정렬

	@RequestMapping("list_Gp2.do")
	public ModelAndView list_Gp2(ModelAndView mav) {
		mav.setViewName("shop/product_listG");
		mav.addObject("list", productService.list_Gp2Product());
		return mav;
	}

	@RequestMapping("list_Gc.do")
	public ModelAndView list_Gc(ModelAndView mav) {
		mav.setViewName("shop/product_listG");
		mav.addObject("list", productService.list_GcProduct());
		return mav;
	}//end list_Ap company 사료 정렬

	@RequestMapping("list_Gn.do")
	public ModelAndView list_Gn(ModelAndView mav) {
		mav.setViewName("shop/product_listG");
		mav.addObject("list", productService.list_GnProduct());
		return mav;
	}//end list_Ap name순 사료 정렬
	/**********************************listG***************************************/

	@RequestMapping("list_H.do")
	public ModelAndView list_H(ModelAndView mav) {
		mav.setViewName("shop/product_listH");
		mav.addObject("list", productService.list_HProduct());
		return mav;
	}//end list_A() 사료 리스트

	@RequestMapping("list_Hp.do")
	public ModelAndView list_Hp(ModelAndView mav) {
		mav.setViewName("shop/product_listH");
		mav.addObject("list", productService.list_HpProduct());
		return mav;
	}//end list_Ap 사료 가격순  정렬

	@RequestMapping("list_Hp2.do")
	public ModelAndView list_Hp2(ModelAndView mav) {
		mav.setViewName("shop/product_listH");
		mav.addObject("list", productService.list_Hp2Product());
		return mav;
	}

	@RequestMapping("list_Hc.do")
	public ModelAndView list_Hc(ModelAndView mav) {
		mav.setViewName("shop/product_listH");
		mav.addObject("list", productService.list_HcProduct());
		return mav;
	}//end list_Ap company 사료 정렬

	@RequestMapping("list_Hn.do")
	public ModelAndView list_Hn(ModelAndView mav) {
		mav.setViewName("shop/product_listH");
		mav.addObject("list", productService.list_HnProduct());
		return mav;
	}//end list_Ap name순 사료 정렬
	/**********************************listH***************************************/

	@RequestMapping("detail/{product_id}")
	public ModelAndView detail(@PathVariable int product_id, 
			ModelAndView mav) {
		//포워딩할 뷰의 이름
		mav.setViewName("/shop/product_detail");
		//뷰에 전달할 데이터
		mav.addObject("dto", productService.detailProduct(product_id));
		return mav;
	}//detail()

	@RequestMapping("write.do")
	public String write() {
		return "shop/product_write";//product_write.jsp 로 이동
	}

	@RequestMapping("insert.do")
	public String insert(@ModelAttribute ProductDTO dto) {
		String mainImage="-";//초기값으로 "-"
		String subImage1="-";
		String subImage2="-";
		String subImage3="-";
		String detailImage="-";
		//첨부 파일이 있으면
		if(!dto.getFile1().isEmpty()) {
			//첨부 파일의 이름
			mainImage=dto.getFile1().getOriginalFilename();
			try {
				//배포 디렉토리 사용
				//단점 : 서버 clean을 하면 이미지가 지워짐
				//장점 : images폴더를 새로고침 안해도 이미지가 잘 나옴
				String path="C:\\Users\\이현희\\git\\teamproject\\project\\src\\main\\webapp\\WEB-INF\\views\\images\\product\\";
				//디렉토리가 존재하지 않으면 생성
				new File(path).mkdir();
				//임시 디렉토리에 저장됨 첨부파일을 이동
				dto.getFile1().transferTo(new File(path+mainImage));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}//if
		if(!dto.getFile2().isEmpty()) {
			//첨부 파일의 이름
			subImage1=dto.getFile2().getOriginalFilename();
			try {
				//배포 디렉토리 사용
				//단점 : 서버 clean을 하면 이미지가 지워짐
				//장점 : images폴더를 새로고침 안해도 이미지가 잘 나옴
				String path="C:\\Users\\이현희\\git\\teamproject\\project\\src\\main\\webapp\\WEB-INF\\views\\images\\product\\";
				//디렉토리가 존재하지 않으면 생성
				new File(path).mkdir();
				//임시 디렉토리에 저장됨 첨부파일을 이동
				dto.getFile2().transferTo(new File(path+subImage1));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}//if
		if(!dto.getFile3().isEmpty()) {
			//첨부 파일의 이름
			subImage2=dto.getFile3().getOriginalFilename();
			try {
				//배포 디렉토리 사용
				//단점 : 서버 clean을 하면 이미지가 지워짐
				//장점 : images폴더를 새로고침 안해도 이미지가 잘 나옴
				String path="C:\\Users\\이현희\\git\\teamproject\\project\\src\\main\\webapp\\WEB-INF\\views\\images\\product\\";
				//디렉토리가 존재하지 않으면 생성
				new File(path).mkdir();
				//임시 디렉토리에 저장됨 첨부파일을 이동
				dto.getFile3().transferTo(new File(path+subImage2));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}//if
		if(!dto.getFile4().isEmpty()) {
			//첨부 파일의 이름
			subImage3=dto.getFile4().getOriginalFilename();
			try {
				//배포 디렉토리 사용
				//단점 : 서버 clean을 하면 이미지가 지워짐
				//장점 : images폴더를 새로고침 안해도 이미지가 잘 나옴
				String path="C:\\Users\\이현희\\git\\teamproject\\project\\src\\main\\webapp\\WEB-INF\\views\\images\\product\\";
				//디렉토리가 존재하지 않으면 생성
				new File(path).mkdir();
				//임시 디렉토리에 저장됨 첨부파일을 이동
				dto.getFile4().transferTo(new File(path+subImage3));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}//if
		if(!dto.getFile5().isEmpty()) {
			//첨부 파일의 이름
			detailImage=dto.getFile5().getOriginalFilename();
			try {
				//배포 디렉토리 사용
				//단점 : 서버 clean을 하면 이미지가 지워짐
				//장점 : images폴더를 새로고침 안해도 이미지가 잘 나옴
				String path="C:\\Users\\이현희\\git\\teamproject\\project\\src\\main\\webapp\\WEB-INF\\views\\images\\product\\";
				//디렉토리가 존재하지 않으면 생성
				new File(path).mkdir();
				//임시 디렉토리에 저장됨 첨부파일을 이동
				dto.getFile5().transferTo(new File(path+detailImage));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}//if

		dto.setPicture_url(mainImage);
		dto.setPicture_url_sub1(subImage1);
		dto.setPicture_url_sub2(subImage2);
		dto.setPicture_url_sub3(subImage3);
		dto.setPicture_url_detail(detailImage);
		productService.insertProduct(dto);
		return "redirect:/shop/product/adminList.do";
	}//insert()

	//edit/6 => edit/{6} => 상품코드가 PathVariable에 저장됨
	@RequestMapping("edit/{product_id}")
	public ModelAndView edit(@PathVariable("product_id") 
	int product_id, ModelAndView mav) {
		//이동할 뷰의 이름
		mav.setViewName("shop/product_edit");//product_edit.jsp
		//뷰에 전달할 데이터 저장
		mav.addObject("dto", productService.detailProduct(product_id));
		return mav;
	}

	//상품정보 수정
	@RequestMapping("update.do")
	public String update(ProductDTO dto) {
		String mainImage="-";//초기값으로 "-"
		String subImage1="-";
		String subImage2="-";
		String subImage3="-";
		String detailImage="-";
		//첨부 파일이 있으면
		if(!dto.getFile1().isEmpty()) {
			//첨부 파일의 이름
			mainImage=dto.getFile1().getOriginalFilename();
			try {
				//배포 디렉토리 사용
				//단점 : 서버 clean을 하면 이미지가 지워짐
				//장점 : images폴더를 새로고침 안해도 이미지가 잘 나옴
				String path="C:\\Users\\이현희\\git\\teamproject\\project\\src\\main\\webapp\\WEB-INF\\views\\images\\product\\";
				//디렉토리가 존재하지 않으면 생성
				new File(path).mkdir();
				//임시 디렉토리에 저장됨 첨부파일을 이동
				dto.getFile1().transferTo(new File(path+mainImage));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}//if
		if(!dto.getFile2().isEmpty()) {
			//첨부 파일의 이름
			subImage1=dto.getFile2().getOriginalFilename();
			try {
				//배포 디렉토리 사용
				//단점 : 서버 clean을 하면 이미지가 지워짐
				//장점 : images폴더를 새로고침 안해도 이미지가 잘 나옴
				String path="C:\\Users\\이현희\\git\\teamproject\\project\\src\\main\\webapp\\WEB-INF\\views\\images\\product\\";
				//디렉토리가 존재하지 않으면 생성
				new File(path).mkdir();
				//임시 디렉토리에 저장됨 첨부파일을 이동
				dto.getFile2().transferTo(new File(path+subImage1));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}//if
		if(!dto.getFile3().isEmpty()) {
			//첨부 파일의 이름
			subImage2=dto.getFile3().getOriginalFilename();
			try {
				//배포 디렉토리 사용
				//단점 : 서버 clean을 하면 이미지가 지워짐
				//장점 : images폴더를 새로고침 안해도 이미지가 잘 나옴
				String path="C:\\Users\\이현희\\git\\teamproject\\project\\src\\main\\webapp\\WEB-INF\\views\\images\\product\\";
				//디렉토리가 존재하지 않으면 생성
				new File(path).mkdir();
				//임시 디렉토리에 저장됨 첨부파일을 이동
				dto.getFile3().transferTo(new File(path+subImage2));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}//if
		if(!dto.getFile4().isEmpty()) {
			//첨부 파일의 이름
			subImage3=dto.getFile4().getOriginalFilename();
			try {
				//배포 디렉토리 사용
				//단점 : 서버 clean을 하면 이미지가 지워짐
				//장점 : images폴더를 새로고침 안해도 이미지가 잘 나옴
				String path="C:\\Users\\이현희\\git\\teamproject\\project\\src\\main\\webapp\\WEB-INF\\views\\images\\product\\";
				//디렉토리가 존재하지 않으면 생성
				new File(path).mkdir();
				//임시 디렉토리에 저장됨 첨부파일을 이동
				dto.getFile4().transferTo(new File(path+subImage3));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}//if
		if(!dto.getFile5().isEmpty()) {
			//첨부 파일의 이름
			detailImage=dto.getFile5().getOriginalFilename();
			try {
				//배포 디렉토리 사용
				//단점 : 서버 clean을 하면 이미지가 지워짐
				//장점 : images폴더를 새로고침 안해도 이미지가 잘 나옴
				String path="C:\\Users\\이현희\\git\\teamproject\\project\\src\\main\\webapp\\WEB-INF\\views\\images\\product\\";
				//디렉토리가 존재하지 않으면 생성
				new File(path).mkdir();
				//임시 디렉토리에 저장됨 첨부파일을 이동
				dto.getFile5().transferTo(new File(path+detailImage));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}//if

		dto.setPicture_url(mainImage);
		dto.setPicture_url_sub1(subImage1);
		dto.setPicture_url_sub2(subImage2);
		dto.setPicture_url_sub3(subImage3);
		dto.setPicture_url_detail(detailImage);
		productService.updateProduct(dto);
		return "redirect:/shop/product/adminList.do";
	}//update()

	@RequestMapping("delete.do")
	public String delete(@RequestParam int product_id) {
		//첨부파일 삭제
		String filename=productService.fileInfo(product_id);
		System.out.println("첨부파일 이름:"+filename);
		if(filename != null && !filename.equals("-")) {//파일이 있으면
			String path="C:\\Users\\이현희\\git\\teamproject\\project\\src\\main\\webapp\\WEB-INF\\views\\images\\product\\";
			File f=new File(path+filename);
			System.out.println("파일존재여부:"+f.exists());
			if(f.exists()) {//파일이 존재하면
				f.delete(); //파일 목록 삭제
				System.out.println("삭제되었습니다.");
			}//inner if

		}//outer if
		//레코드 삭제
		productService.deleteProduct(product_id);
		//화면 이동
		return "redirect:/shop/product/adminList.do";

	}
}
