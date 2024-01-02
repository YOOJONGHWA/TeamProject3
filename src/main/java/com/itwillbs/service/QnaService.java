package com.itwillbs.service;

import com.itwillbs.domain.QnaDTO;
import com.itwillbs.domain.QpPageDTO;

import java.util.List;

public interface QnaService {		//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII
//추상메서드 
		// 리턴할형 없음 insertBoard(BoardDTO 주소값 저장하는 변수) 메서드 정의
		public void qnaInsert(QnaDTO qnaDto);
		
		// List<BoardDTO> 리턴할형 getBoardList(PageDTO dto) 메서드 정의
		public List<QnaDTO> getQnaList(QpPageDTO pageDto);
		
//		public List<BoardDTO > getBoardCount(PageDTO dto);
		public int getQnaCount();
		
		//글번호 증가
		public void updateReadCount(int qnaNum);
		
		//글가져오기 메서드 호출				검색추가할때 컨트롤러만 바꾸면 되네
		public QnaDTO getQna(int qnaNum);
		
		//임마이거 좀삐리함
		public QnaDTO getQnaName(String qnaName);
		public QnaDTO getQnaName();
		
		//수정
		public void qnaUpdate(QnaDTO qnaDto);
		
		//삭제			   
		public void qnaDelete(int qnaNum);
		
		//답글 넣기
		public void ReQnaInsert(QnaDTO qnaDto);
		
		//조회수
//		public void updateHitCount(int qnaNum);
		
		
}		//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII
