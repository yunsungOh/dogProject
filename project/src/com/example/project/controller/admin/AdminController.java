package com.example.project.controller.admin;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.member.dto.MemberDTO;
import com.example.project.service.admin.AdminService;


@Controller
@RequestMapping("admin/*")
public class AdminController {
	
	@Inject
	AdminService adminService;
	
	private static final Logger logger=
			LoggerFactory.getLogger(AdminController.class);
	@RequestMapping("main.do")
	public String main(Model model) {
		return "admin/admin";
	}
	
	@RequestMapping("login.do")
	public String login() {
		return "member/login";//login.jsp로이동
	}
	
	@RequestMapping("login_check.do")
	public ModelAndView login_check(MemberDTO dto, 
			HttpSession session, ModelAndView mav) {
		String name=adminService.loginCheck(dto);
		if(name != null) {
			session.setAttribute("admin_userid", dto.getUserid());
			session.setAttribute("admin_name", name);
			session.setAttribute("userid", dto.getUserid());
			session.setAttribute("username", name);
			mav.setViewName("admin/admin");
		}else {
			mav.setViewName("member/login");
			mav.addObject("message", "error");
		}
		return mav;
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();//세션초기화
		return "redirect:/admin/login.do";
	}

}