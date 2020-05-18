package com.example.project.model.qnaboard.dao;

import java.util.List;

import com.example.project.model.qnaboard.dto.QnaReplyDTO;

public interface QnaReplyDAO {
	public List<QnaReplyDTO> list(int bno);
	public int count(int bno);
	public void create(QnaReplyDTO dto);

}
