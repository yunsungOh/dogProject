package com.example.project.service.qnaboard;

import java.util.List;

import com.example.project.model.qnaboard.dto.QnaReplyDTO;

public interface QnaReplyService {
	public List<QnaReplyDTO> list(int bno);
	public int count(int bno);
	public void create(QnaReplyDTO dto);
}
