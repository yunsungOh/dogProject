package com.example.project.service.qnaboard;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.project.model.qnaboard.dao.QnaReplyDAO;
import com.example.project.model.qnaboard.dto.QnaReplyDTO;

@Service //service bean
public class QnaReplyServiceImpl implements QnaReplyService {
	@Inject
	QnaReplyDAO replyDao;

	@Override
	public List<QnaReplyDTO> list(int bno) {
		return replyDao.list(bno);
	}

	@Override
	public int count(int bno) {
		// TODO Auto-generated method stub
		return 0;
	}

	//댓글 쓰기
	@Override
	public void create(QnaReplyDTO dto) {
		replyDao.create(dto);
	}

}
