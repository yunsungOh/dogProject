package com.example.project.model.qnaboard.dao;

import java.util.List;

import com.example.project.model.qnaboard.dto.QnaBoardDTO;

public interface QnaBoardDAO {
	public void deleteFile(String fullName); //첨부파일 삭제
	public List<String> getAttach(int bno); //첨부파일 정보
	public void addAttach(String fullName); //첨부파일 저장
	public void updateAttach(String fullName, int bno);//첨부파일 수정
	public void create(QnaBoardDTO dto) throws Exception; //글쓰기 
	public void update(QnaBoardDTO dto) throws Exception; //글수정
	public void delete(int bno) throws Exception; //글삭제
	public List<QnaBoardDTO> listAll(String search_option, String keyword, int start, int end) throws Exception;//목록
	public void increateViewcnt(int bno) throws Exception;//조회수 증가 처리
	public int countArticle(String search_option, String keyword) throws Exception;//레코드 갯수 계산
	public QnaBoardDTO read(int bno) throws Exception;//레코드 조회
}
