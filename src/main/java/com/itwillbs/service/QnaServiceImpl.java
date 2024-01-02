package com.itwillbs.service;

import com.itwillbs.dao.QnaDAO;
import com.itwillbs.domain.QnaDTO;
import com.itwillbs.domain.QpPageDTO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.sql.Timestamp;
import java.util.List;

@Service
public class QnaServiceImpl implements QnaService {		//CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC

		//자동 객체생성 부모=자식
		@Inject
		private QnaDAO qnaDAO;
		
		//원래글 
		@Override
		public void qnaInsert(QnaDTO qnaDto) {	
			// name subject content
			// num readcount date
//			System.out.println(qnaDto);											//	8 ->18
			qnaDto.setQnaReadcount(0);
			qnaDto.setQnaDate(new Timestamp(System.currentTimeMillis()));
			//num 
			if(qnaDAO.getMaxNum() == null) {
				//글없음
				qnaDto.setQnaNum(1);
				// re_ref  일반글(기준글) = 그룹번호 일치
				qnaDto.setQnaRef(1);
//				System.out.println(qnaDto);											//		8 ->18
			}else {
				//글있음
				qnaDto.setQnaNum(qnaDAO.getMaxNum()+1);
				// re_ref  일반글(기준글) = 그룹번호 일치
				qnaDto.setQnaRef(qnaDAO.getMaxNum()+1);
			}
//			System.out.println(qnaDto);													//	8 ->18
//			일반글 => re_ref 일반글 번호 일치,  re_lev 0  re_seq 0
			qnaDto.setQnaLev(0);
			qnaDto.setQnaSeq(0);
			//메서드 호출
			qnaDAO.qnaInsert(qnaDto);
			
			
			//차쌤
//			int num = qnaDAO.getMaxNum();
//			dto.setQnaNum(num);
//			dto.setQnaRef(num);
//			dto.setQnaReadcount(0);
//			dto.setQnaDate(new Timestamp(System.currentTimeMillis()));
//			dto.setQnaLev(0);
//			dto.setQnaSeq(0);
//			System.out.println(dto);
//			qnaDAO.qnaInsert(dto);
		} //insertQna

		@Override
		public List<QnaDTO> getQnaList(QpPageDTO pageDto) {
			//startRow 구하기
			int qpStartRow = (pageDto.getQpCurrentPage() - 1) * pageDto.getQpPageSize() + 1;
			//endRow 구하기
			int qpEndRow = qpStartRow + pageDto.getQpPageSize() - 1;
			
			//startRow-1 
			pageDto.setQpStartRow(qpStartRow - 1);
			pageDto.setQpEndRow(qpEndRow);
			qnaDAO.getQnaList(pageDto);
			return qnaDAO.getQnaList(pageDto);		
		} //getQnaList

		
		@Override
		public int getQnaCount() {
			return qnaDAO.getQnaCount();
		}

		@Override 				//글번호 증가
		public void updateReadCount(int qnaNum) {
			qnaDAO.updateReadCount(qnaNum);
		}
		
		
		@Override
		public QnaDTO getQna(int qnaNum) {
			return qnaDAO.getQna(qnaNum);
		}
//		@Override
//		public QnaDTO getQna(PageDTO pageDto) {
//			return qnaDAO.getQna(pageDto);
//		}

		
		@Override		//추가함
		public QnaDTO getQnaName(String qnaName) {
			return qnaDAO.getQnaName(qnaName);
		}
		@Override		//추가함
		public QnaDTO getQnaName() {
			return qnaDAO.getQnaName();
		}

		
		@Override		//수정				GG
		public void qnaUpdate(QnaDTO QnaDto) {
			qnaDAO.qnaUpdate(QnaDto);
		}

		@Override		//삭제			    GG
		public void qnaDelete(int qnaNum) {
			qnaDAO.qnaDelete(qnaNum);
		}
		
		
		//답글 요청 ======================================================
		@Override
		public void ReQnaInsert(QnaDTO qnaDto) {
			//name subject content re_ref re_lev re_seq
			
			//답글 순서 재배치
			qnaDAO.ReQnaUpdateSeq(qnaDto);
			//num readcount date
			qnaDto.setQnaReadcount(0);
			qnaDto.setQnaDate(new Timestamp(System.currentTimeMillis()));
			//num 
			if(qnaDAO.getMaxNum() == null) {
				//글없음
				qnaDto.setQnaNum(1);
			}else {
				//글있음
				qnaDto.setQnaNum(qnaDAO.getMaxNum()+1);
			} 
//			일반글 => re_ref 그대로 사용,  re_lev 0  re_seq 0
			qnaDto.setQnaLev(qnaDto.getQnaLev() + 1);
			qnaDto.setQnaSeq(qnaDto.getQnaSeq() + 1);
			//메서드 호출
			qnaDAO.qnaInsert(qnaDto);
		} 		
//		@Override		
//		public void qnaInsert2(QnaDTO qnaDto) {					//by 차쌤
//			//name subject content re_ref re_lev re_seq
//			if(qnaDAO.getMaxNum() == null) {
//				//글이 없는 경우
//				qnaDto.setQnaNum(1);
//			}else {
//				qnaDto.setQnaNum(qnaDAO.getMaxNum() + 1);
//			}
//			qnaDto.setQnaReadcount(0);
//			qnaDto.setQnaDate(new Timestamp(System.currentTimeMillis()));
//			qnaDAO.ReQnaUpdate(qnaDto);
//			
//			qnaDto.setQnaLev(qnaDto.getQnaLev()+1);
//			qnaDto.setQnaSeq(qnaDto.getQnaSeq()+1);
//			//메서드 호출
//			qnaDAO.ReQnaUpdate(qnaDto);
//		}

//		@Override										//조회수 증가
//		public void updateHitCount(int qnaNum) {
//			qnaDAO.updateHitCount(qnaNum);
//		}

		
		
		
}		//CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
