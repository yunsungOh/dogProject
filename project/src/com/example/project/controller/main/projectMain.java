package com.example.project.controller.main;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.service.product.ProductService;

@Controller
public class projectMain {
	@Inject
	ProductService productService;
	
	private static final Logger logger=
			LoggerFactory.getLogger(projectMain.class);
	// http://localhost/spring01/ => MainController의 main()실행,
	// post/get모두 실행됨
	@RequestMapping("/")
	public ModelAndView main(ModelAndView mav) {
		//Model에 자료 저장(서블릿의 request 객체에 해당됨)
		mav.setViewName("main");
		mav.addObject("list", productService.bestListProduct());
		return mav;
		//main.jsp로 포워딩됨
		// /WEB-INF/views/main.jsp
		
	}
	
	

}
