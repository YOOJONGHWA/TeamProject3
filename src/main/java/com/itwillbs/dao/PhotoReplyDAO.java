package com.itwillbs.dao;

import com.itwillbs.domain.PhotoReplyDTO;

import java.util.List;

public interface PhotoReplyDAO {
	
	public void insertReply(PhotoReplyDTO photoReplyDTO);
	
	public Integer getMaxNum();	
	
	// 대댓글 쓰기
	public void insertReReply(PhotoReplyDTO photoReplyDTO);
	
	// 리스트 불러오기
	public List<PhotoReplyDTO> getPhotoReplyList(int num);
	
	public int getPhotoReplyCount(int num);
	
	// 자식댓글 달렸을 때 부모댓글 crOrder + 1 
	public int updateAddOrder(int num);
	
	// 자식댓글 삭제됐을 때 부모댓글 crOrder - 1
	public int updateSubOrder(int num);
	
	// 댓글 가져오기
	public PhotoReplyDTO getReply(int num);
	
	// 댓글 삭제
	public void deleteReply(PhotoReplyDTO photoReplyDTO);
	
	// 부모 댓글 입시 삭제
	public void tmpDeleteReply(PhotoReplyDTO photoReplyDTO);
	
	// 글 수정
	public void updateReply(PhotoReplyDTO photoReplyDTO);

}
