package com.itwillbs.service;


import com.itwillbs.dao.CrewReplyDAO;
import com.itwillbs.domain.CrewPageDTO;
import com.itwillbs.domain.CrewReplyDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;

@Service
public class CrewReplyServiceImpl implements CrewReplyService{

	@Autowired
	private CrewReplyDAO crewReplyDAO;
	
	// 부모 댓글 작성
	@Override
	public void insertReply(CrewReplyDTO crewReplyDTO) {	// 댓글
		
		if(crewReplyDAO.getMaxNum()==null) {
			crewReplyDTO.setCrNum(1);
		}else {
			crewReplyDTO.setCrNum(crewReplyDAO.getMaxNum()+1);
		}
		
		crewReplyDTO.setCrDate(new Timestamp(System.currentTimeMillis()));
		
		crewReplyDAO.insertReply(crewReplyDTO);
		
	}

	// 자식 댓글 작성(대댓글)
	@Override
	public void insertReReply(CrewReplyDTO crewReplyDTO) {	// 대댓글

		if(crewReplyDAO.getMaxNum()==null) {
			crewReplyDTO.setCrNum(1);
		}else {
			crewReplyDTO.setCrNum(crewReplyDAO.getMaxNum()+1);
		}

		crewReplyDTO.setCrDate(new Timestamp(System.currentTimeMillis()));
	
		crewReplyDAO.updateAddOrder(crewReplyDTO.getCrParent());
		crewReplyDAO.insertReReply(crewReplyDTO);
	}
	
	// 댓글 리스트 불러오기(페이징) - 안씀
	@Override
	public List<CrewReplyDTO> getCrewReplyList(CrewPageDTO pageDTO) {
		
		// startRow 구하기
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		// endRow 구하기
		int endRow=startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setStartRow(startRow-1);
		pageDTO.setEndRow(endRow);
		
		return crewReplyDAO.getCrewReplyList(pageDTO);
	}

	// 댓글 개수 
	@Override
	public int getCrewReplyCount(int num) {
		return crewReplyDAO.getCrewReplyCount(num);
	}

	// 댓글 리스트 불러오기
	@Override
	public List<CrewReplyDTO> getCrewReplyList(int num) {
		
		return crewReplyDAO.getCrewReplyList(num);
	}

	// 부모 댓글 삭제
	@Override
	public void deleteReply(CrewReplyDTO crewReplyDTO) {

//		System.out.println(crewReplyDTO.getCrOrder());
		
		// crOrder > 1 => 자식댓글이 있는 부모댓글
		if(crewReplyDTO.getCrOrder() > 1 && crewReplyDTO.getCrParent() == 0) {
			crewReplyDAO.tmpDeleteReply(crewReplyDTO);
		} else {

			// crOrder = 1 자식댓글이 없는 부모댓글
			crewReplyDAO.deleteReply(crewReplyDTO);

		}

	}

	// 자식 댓글 삭제
	@Override
	public void deleteReReply(CrewReplyDTO crewReplyDTO) {
		
		// 자식 댓글 삭제하면서 부모 댓글의 crOrder - 1 작업
		int parentNum = crewReplyDTO.getCrParent();
		crewReplyDAO.updateSubOrder(parentNum);
		
		// 부모 댓글의 DTO 가져오기
		CrewReplyDTO parentReplyDTO = crewReplyDAO.getReply(parentNum);
		int parentCrOrder = parentReplyDTO.getCrOrder();
		String parentCrContent = parentReplyDTO.getCrContent();
		
		// 부모댓글 crOrder < 1 (나혼자 자식글) 이면서 부모댓 crContent == ""(부모댓글 임시 삭제 처리된 상태), 부모 댓글과 자식 댓글 함께 삭제
		if(parentCrOrder < 2 && parentCrContent.equals("")) {
			crewReplyDAO.deleteReply(crewReplyDTO);
			crewReplyDAO.deleteReply(parentReplyDTO);
		} else {
			// 부모댓글 crOrder > 1 이면(나말고 자식댓글 있음), 자식 댓글만 삭제하면 됨
			crewReplyDAO.deleteReply(crewReplyDTO);
		}
		

		
	}
	
	// 댓글 수정
	@Override
	public void updateReply(CrewReplyDTO crewReplyDTO) {
		crewReplyDAO.updateReply(crewReplyDTO);
	}





}
