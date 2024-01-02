package com.itwillbs.service;

import com.itwillbs.domain.PhotoLikeDTO;

import java.util.Map;

public interface PhotoLikeService {

	public Map<String, Object> likeCheck(Map<String, Object> map);
	
	// 좋아요 insert
	public void insertLike(PhotoLikeDTO photoLikeDTO);
	
	// 좋아요 취소 delete(이지만 update)
	public void deleteLike(PhotoLikeDTO photoLikeDTO);
}
