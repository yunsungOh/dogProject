package com.example.project.controller.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.product.dto.CartDTO;
import com.example.project.service.product.PetCartService;

@Controller
@RequestMapping("shop/petcart/*")
public class PetCartController {
	@Inject
	PetCartService petService;

	@RequestMapping("petlist.do")
	public ModelAndView list_petCart(HttpSession session, ModelAndView mav) {
		Map<String,Object> map = new HashMap<>();
		String userid = (String)session.getAttribute("userid");
		if(userid != null) {
			List<CartDTO> list = petService.list_petCart(userid);
			//장바구니 합계 계산
			int pet_Money = petService.pet_Money(userid);
			//배송료 계산
			int fee = pet_Money >= 30000 ? 0 : 2500;
			map.put("pet_Money", pet_Money);
			map.put("fee", fee);
			map.put("sum", pet_Money+fee);

			map.put("list", list);
			map.put("count", list.size());
			mav.setViewName("shop/pet_cart_list");//jsp 페이지 이동
			mav.addObject("map", map);
			return mav;
		}else {
			return new ModelAndView("member/login","",null);
		}

	}

	@RequestMapping("petinsert.do")
	public String pet_insert(HttpSession session, @ModelAttribute CartDTO dto) {
		String userid = (String)session.getAttribute("userid");
		if(userid == null) {
			return "redirect:/member/login.do";
		}
		dto.setUserid(userid);
		petService.pet_insert(dto);
		return "redirect:/shop/petcart/petlist.do";
	}//insert()

	//장바구니 개별 상품 삭제
	@RequestMapping("petdelete.do")
	public String pet_delete(@RequestParam int cart_id, HttpSession session) {
		if(session.getAttribute("userid") != null)
			petService.pet_delete(cart_id);
		return "redirect:/shop/petcart/petlist.do";
	}

	//장바구니 상품전부삭제
	@RequestMapping("petdeleteAll.do")
	public String pet_deleteAll(HttpSession session) {
		String userid = (String)session.getAttribute("userid");
		if(userid !=null) {
			petService.pet_deleteAll(userid);
		}
		return "redirect:/";
	}
	//장바구니 상품 수량수정
	@RequestMapping("petupdate.do")
	public String pet_update(@RequestParam int[] amount, @RequestParam int[] cart_id, HttpSession session) {
		String userid = (String)session.getAttribute("userid");
		if(userid != null) {
			for(int i=0; i<cart_id.length; i++) {
				if(amount[i] == 0) {
					petService.pet_delete(cart_id[i]);
				}else {
					CartDTO dto = new CartDTO();
					dto.setUserid(userid);
					dto.setCart_id(cart_id[i]);
					dto.setAmount(amount[i]);
					petService.modify_petCart(dto);
				}
			}//for문
		}//if문
		return "redirect:/shop/petcart/petlist.do";
	}
	@RequestMapping("buy.do") //세부 url
	public String buy() {
		return "redirect:/shop/petcart/petdeleteAll.do";
	}
}
