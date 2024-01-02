package com.itwillbs.dao;


import com.itwillbs.domain.QnaDTO;
import com.itwillbs.domain.QpPageDTO;

import java.util.List;

public interface QnaDAO {		//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII

		//추상메서드
		//리턴할형 없음 insertBoard(BoardDTO 주소값 저장하는 변수) 메서드 정의
		public void qnaInsert(QnaDTO qnaDto);
		// getMaxNum
		public Integer getMaxNum();
		
		// List<BoardDTO> 리턴할형 getBoardList(PageDTO dto) 메서드 정의
		public List<QnaDTO> getQnaList(QpPageDTO pageDto);
		
//		public int<BoardDTO> getBoardCount(PageDTO dto);
		public int getQnaCount();
		
		//글번호 증가
		public void updateReadCount(int qnaNum);
		
		//글가져오기 메서드 호출
		public QnaDTO getQna(int qnaNum);
	
		public QnaDTO getQnaName(String qnaName);
		public QnaDTO getQnaName();
		
		//수정				GG
		public void qnaUpdate(QnaDTO qnaDto);
		
		//삭제				GG
		public void qnaDelete(int qnaNum);
		
		//답글순서재배치				GG
		public void ReQnaUpdateSeq(QnaDTO qnaDto);
		
//		public void getReQnaList(QnaDTO qnaDto);
		
		//조회수 증가
//		public void updateHitCount(int qnaNum);
		
		
		
		
		
		
}		//interface QnaDAO
