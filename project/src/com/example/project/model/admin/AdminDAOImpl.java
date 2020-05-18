package com.example.project.model.admin;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.project.model.member.dto.MemberDTO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Inject
	SqlSession sql;

	@Override
	public String loginCheck(MemberDTO dto) {
		return sql.selectOne("admin.check", dto);
	}

}
