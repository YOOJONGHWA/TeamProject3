package com.itwillbs.service;


import com.itwillbs.dao.PhotoReplyDAO;
import com.itwillbs.domain.PhotoReplyDTO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.sql.Timestamp;
import java.util.List;

@Service
public class PhotoReplyServiceImpl implements PhotoReplyService{

	@Inject
	private PhotoReplyDAO photoReplyDAO;
	
	// 부모 댓글 작성
	@Override
	public void insertReply(PhotoReplyDTO photoReplyDTO) {	// 댓글
		
		if(photoReplyDAO.getMaxNum()==null) {
			photoReplyDTO.setPrNum(1);
		}else {
			photoReplyDTO.setPrNum(photoReplyDAO.getMaxNum()+1);
		}
		
		photoReplyDTO.setPrDate(new Timestamp(System.currentTimeMillis()));
		
		photoReplyDAO.insertReply(photoReplyDTO);
		
	}

	// 자식 댓글 작성(대댓글)
	@Override
	public void insertReReply(PhotoReplyDTO photoReplyDTO) {	// 대댓글

		if(photoReplyDAO.getMaxNum()==null) {
			photoReplyDTO.setPrNum(1);
		}else {
			photoReplyDTO.setPrNum(photoReplyDAO.getMaxNum()+1);
		}

		photoReplyDTO.setPrDate(new Timestamp(System.currentTimeMillis()));
	
		photoReplyDAO.updateAddOrder(photoReplyDTO.getPrParent());
		photoReplyDAO.insertReReply(photoReplyDTO);
	}
	
	// 댓글 리스트 불러오기(페이징) - 안씀
//	@Override
//	public List<CrewReplyDTO> getCrewReplyList(CrewPageDTO pageDTO) {
//		
//		// startRow 구하기
//		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
//		// endRow 구하기
//		int endRow=startRow+pageDTO.getPageSize()-1;
//		
//		pageDTO.setStartRow(startRow-1);
//		pageDTO.setEndRow(endRow);
//		
//		return crewReplyDAO.getCrewReplyList(pageDTO);
//	}

	// 댓글 개수 
	@Override
	public int getPhotoReplyCount(int num) {
		return photoReplyDAO.getPhotoReplyCount(num);
	}

	// 댓글 리스트 불러오기
	@Override
	public List<PhotoReplyDTO> getPhotoReplyList(int num) {
		
		return photoReplyDAO.getPhotoReplyList(num);
	}

	// 부모 댓글 삭제
	@Override
	public void deleteReply(PhotoReplyDTO photoReplyDTO) {

		System.out.println(photoReplyDTO.getPrOrder());
		
		// prOrder > 1 => 자식댓글이 있는 부모댓글
		if(photoReplyDTO.getPrOrder() > 1 && photoReplyDTO.getPrParent() == 0) {
			photoReplyDAO.tmpDeleteReply(photoReplyDTO);
		} else {

			// prOrder = 1 자식댓글이 없는 부모댓글
			photoReplyDAO.deleteReply(photoReplyDTO);

		}

	}

	// 자식 댓글 삭제
	@Override
	public void deleteReReply(PhotoReplyDTO photoReplyDTO) {
		
		// 자식 댓글 삭제하면서 부모 댓글의 prOrder - 1 작업
		int parentNum = photoReplyDTO.getPrParent();
		photoReplyDAO.updateSubOrder(parentNum);
		
		// 부모 댓글의 DTO 가져오기
		PhotoReplyDTO parentReplyDTO = photoReplyDAO.getReply(parentNum);

		int parentPrOrder = parentReplyDTO.getPrOrder();
		String parentPrContent = parentReplyDTO.getPrContent();
		
		// 부모댓글 prOrder < 1 (나혼자 자식글) 이면서 부모댓 prContent == ""(부모댓글 임시 삭제 처리된 상태), 부모 댓글과 자식 댓글 함께 삭제
		if(parentPrOrder < 2 && parentPrContent.equals("")) {
			photoReplyDAO.deleteReply(photoReplyDTO);
			photoReplyDAO.deleteReply(parentReplyDTO);
		} else {
			// 부모댓글 prOrder > 1 이면(나말고 자식댓글 있음), 자식 댓글만 삭제하면 됨
			photoReplyDAO.deleteReply(photoReplyDTO);
		}
		

		
	}
	
	// 댓글 수정
	@Override
	public void updateReply(PhotoReplyDTO photoReplyDTO) {
		photoReplyDAO.updateReply(photoReplyDTO);
	}





}
