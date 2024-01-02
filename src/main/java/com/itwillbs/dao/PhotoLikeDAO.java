package com.itwillbs.dao;

import com.itwillbs.domain.PhotoLikeDTO;

import java.util.Map;

public interface PhotoLikeDAO {

	// 좋아요 체크 여부 확인
	public Map<String, Object> likeCheck(Map<String, Object> map);
	
	// 글 번호 가져오기
	public Integer getMaxNum();	

	// 좋아요 insert
	public void insertLike(PhotoLikeDTO photoLikeDTO);

	// 좋아요 update
	public void updateLike(PhotoLikeDTO photoLikeDTO);
	
	// 좋아요 취소 delete
	public void deleteLike(PhotoLikeDTO photoLikeDTO);
	
}
