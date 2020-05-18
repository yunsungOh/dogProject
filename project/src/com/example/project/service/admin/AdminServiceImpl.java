package com.example.project.service.admin;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.project.model.admin.AdminDAO;
import com.example.project.model.member.dto.MemberDTO;

@Service
public class AdminServiceImpl implements AdminService {
	@Inject
	AdminDAO dao;

	@Override
	public String loginCheck(MemberDTO dto) {
		return dao.loginCheck(dto);
	}

}
