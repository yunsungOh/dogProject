package com.example.project.model.board.dao;

import java.util.List;

import com.example.project.model.board.dto.ReplyDTO;

public interface ReplyDAO {
	public List<ReplyDTO> list(int bno);
	public int count(int bno);
	public void create(ReplyDTO dto);

}
