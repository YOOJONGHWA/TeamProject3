package com.itwillbs.service;

import com.itwillbs.domain.CrewLikeDTO;

import java.util.Map;

public interface CrewLikeService {

	public Map<String, Object> likeCheck(Map<String, Object> map);
	
	// 좋아요 insert
	public void insertLike(CrewLikeDTO crewLikeDTO);
	
	// 좋아요 취소 delete(이지만 update)
	public void deleteLike(CrewLikeDTO crewLikeDTO);
}
