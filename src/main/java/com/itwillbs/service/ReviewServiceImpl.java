package com.itwillbs.service;

import com.itwillbs.dao.ReviewDAO;
import com.itwillbs.domain.RePageDTO;
import com.itwillbs.domain.ReplyDTO;
import com.itwillbs.domain.ReviewDTO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.sql.Timestamp;
import java.util.List;

@Service
public class ReviewServiceImpl implements ReviewService{
	//자동 객체생성 부모=자식
	@Inject
	private ReviewDAO reviewDAO;
	
	@Override
	public void insertReview(ReviewDTO dto) {
		// name,subject,content
		// num,readcount,date
		// num = max(num) + 1 
		
		if(reviewDAO.getMaxNum()==null) {
			//글이 없는 경우
//			dto.setReview_Num(1);
			dto.setReviewNum(1);
		}else {
			dto.setReviewNum(reviewDAO.getMaxNum()+1);
		}
		
		dto.setReviewDate(new Timestamp(System.currentTimeMillis()));
		
		//메서드 호출
		reviewDAO.insertReview(dto);
	}

	@Override
	public List<ReviewDTO> getReviewList(RePageDTO dto) {
		int review_Num = dto.getReview_Num();
		// startRow 구하기
		int startRow=(dto.getCurrentPage()-1)*dto.getPageSize()+1;
		// endRow 구하기
		int endRow=startRow+dto.getPageSize()-1;
		
		// 디비 limit startRow-1 
		dto.setStartRow(startRow-1);
		dto.setEndRow(endRow);
		dto.setReview_Num(review_Num);
		return reviewDAO.getReviewList(dto);
	}

	@Override
	public int getReviewCount() {
		return reviewDAO.getReviewCount();
	}

	@Override
	public void updateReadcount(int num) {
		reviewDAO.updateReadcount(num);
		
	}

	@Override
	public ReviewDTO getReview(int num) {
		return reviewDAO.getReview(num);
	}

	@Override
	public void updateReview(ReviewDTO dto) {
		reviewDAO.updateReview(dto);
	}

	@Override
	public void deleteReview(int num) {
		reviewDAO.deleteReview(num);
	}

	//댓글
	@Override
	public void insertBoard(ReplyDTO replyDTO) {
		System.out.println("insertBoard");
		System.out.println(replyDTO.toString()); 
		// name subject content
		// num readcount date
		replyDTO.setReadcount(0);
		replyDTO.setReplyDate(new Timestamp(System.currentTimeMillis()));
		//num 
		if(reviewDAO.regetMaxNum()==null) {
			//글없음
			replyDTO.setReplyNum(1);
			// re_ref  일반글(기준글) = 그룹번호 일치
			replyDTO.setReplyReRef(1);
		}else {
			//글있음
			replyDTO.setReplyNum(reviewDAO.regetMaxNum()+1);
			// re_ref  일반글(기준글) = 그룹번호 일치
			replyDTO.setReplyReRef(reviewDAO.regetMaxNum()+1);
		}
		
//		일반글 => re_ref 일반글 번호 일치,  re_lev 0  re_seq 0
		replyDTO.setReplyReLev(0);
		replyDTO.setReplyReSeq(0);
		
		//메서드 호출
		reviewDAO.insertBoard(replyDTO);
	}

	@Override
	public List<ReplyDTO> getBoardList(RePageDTO pageDTO) {
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow=startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setStartRow(startRow-1);
		pageDTO.setEndRow(endRow);
		
		return reviewDAO.getBoardList(pageDTO);
	}

	@Override
	public int getBoardCount() {
		return reviewDAO.getBoardCount();
	}

	@Override
	public ReplyDTO getBoard(int num) {
		
		return reviewDAO.getBoard(num);
	}

	@Override
	public void updateBoard(ReplyDTO replyDTO) {
		reviewDAO.updateBoard(replyDTO);
		
	}

	@Override
	public void deleteBoard(ReplyDTO replyDTO) {
		reviewDAO.deleteBoard(replyDTO);
	}
	
	@Override
	public void reinsertBoard(ReplyDTO replyDTO) {
		System.out.println("reinsertBoard");
		System.out.println(replyDTO.toString());
		// name subject content re_ref re_lev re_seq
		// 답글 순서 재배치
		reviewDAO.updateReSeq(replyDTO);		
		
		// num readcount date
		replyDTO.setReplyDate(new Timestamp(System.currentTimeMillis()));
		//num 
		if(reviewDAO.regetMaxNum()==null) {
			//글없음
			replyDTO.setReplyNum(1);
		}else {
			//글있음
			replyDTO.setReplyNum(reviewDAO.regetMaxNum()+1);
		}
		
//		답글 => re_ref 그대로 사용,  re_lev +1  re_seq +1
		replyDTO.setReplyReLev(replyDTO.getReplyReLev()+1);
		replyDTO.setReplyReSeq(replyDTO.getReplyReSeq()+1);
		
		//메서드 호출
		reviewDAO.insertBoard(replyDTO);
	}

}
