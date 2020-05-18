package com.example.project.service.qnaboard;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.example.project.model.qnaboard.dto.QnaBoardDTO;

public interface QnaBoardService {
	public void deleteFile(String fullName); //첨부파일 삭제v
	public List<String> getAttach(int bno); //첨부파일 정보v
	public void create(QnaBoardDTO dto) throws Exception; //글쓰기v 
	public void update(QnaBoardDTO dto) throws Exception; //글수정v
	public void delete(int bno) throws Exception; //글삭제v
	public List<QnaBoardDTO> listAll(String search_option, String keyword, int start, int end) throws Exception;//목록v
	public void increateViewcnt(int bno, HttpSession session) throws Exception;//조회수 증가 처리v
	public int countArticle(String search_option, String keyword) throws Exception;//레코드 갯수 계산v
	public QnaBoardDTO read(int bno) throws Exception;//레코드 조회v

} 
