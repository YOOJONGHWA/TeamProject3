package com.itwillbs.service;

import com.itwillbs.domain.PhotoReplyDTO;

import java.util.List;

public interface PhotoReplyService {

	// 댓글 쓰기
	public void insertReply(PhotoReplyDTO photoReplyDTO);
	
	// 대댓글 쓰기
	public void insertReReply(PhotoReplyDTO photoReplyDTO);

	// List<PhotoReplyDTO> 리턴할형 getPhotoReplyList(PhotopageDTO pageDTO);
//	public List<PhotoReplyDTO> getPhotoReplyList(PhotoPageDTO pageDTO);
	
	public List<PhotoReplyDTO> getPhotoReplyList(int num);
	
	// 댓글수
	public int getPhotoReplyCount(int num);	
	
	// 부모 댓글 삭제
	public void deleteReply(PhotoReplyDTO photoReplyDTO);

	// 자식 댓글 삭제
	public void deleteReReply(PhotoReplyDTO photoReplyDTO);
	
	// 글 수정
	public void updateReply(PhotoReplyDTO photoReplyDTO);
	

}
