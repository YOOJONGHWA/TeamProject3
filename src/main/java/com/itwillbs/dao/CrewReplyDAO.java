package com.itwillbs.dao;

import com.itwillbs.domain.CrewPageDTO;
import com.itwillbs.domain.CrewReplyDTO;

import java.util.List;

public interface CrewReplyDAO {
	
	public void insertReply(CrewReplyDTO crewReplyDTO);
	
	public Integer getMaxNum();	
	
	// 대댓글 쓰기
	public void insertReReply(CrewReplyDTO crewReplyDTO);
	
	// List<CrewReplyDTO> 리턴할형 getCrewReplyList(pageDTO pageDTO);
	public List<CrewReplyDTO> getCrewReplyList(CrewPageDTO pageDTO);
	public List<CrewReplyDTO> getCrewReplyList(int num);
	
	public int getCrewReplyCount(int num);
	
	// 자식댓글 달렸을 때 부모댓글 crOrder + 1 
	public int updateAddOrder(int num);
	
	// 자식댓글 삭제됐을 때 부모댓글 crOrder - 1
	public int updateSubOrder(int num);
	
	// 댓글 가져오기
	public CrewReplyDTO getReply(int num);
	
	// 댓글 삭제
	public void deleteReply(CrewReplyDTO crewReplyDTO);
	
	// 부모 댓글 입시 삭제
	public void tmpDeleteReply(CrewReplyDTO crewReplyDTO);
	
	// 글 수정
	public void updateReply(CrewReplyDTO crewReplyDTO);

}
