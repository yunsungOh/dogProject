package com.example.project.model.qnaboard.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.project.model.qnaboard.dto.QnaReplyDTO;

@Repository //dao bean
public class QnaReplyDAOImpl implements QnaReplyDAO {
	@Inject
	SqlSession sqlSession;

	@Override
	public List<QnaReplyDTO> list(int bno) {
		return sqlSession.selectList("qnareply.listReply", bno);
	}

	@Override
	public int count(int bno) {
		// TODO Auto-generated method stub
		return 0;
	}

	//댓글 추가
	@Override
	public void create(QnaReplyDTO dto) {
		sqlSession.insert("qnareply.insertReply", dto);

	}

}
