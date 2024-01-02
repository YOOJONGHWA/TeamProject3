package com.itwillbs.dao;

import com.itwillbs.domain.CrewLikeDTO;

import java.util.Map;

public interface CrewLikeDAO {

	// 좋아요 체크 여부 확인
	public Map<String, Object> likeCheck(Map<String, Object> map);
	
	// 글 번호 가져오기
	public Integer getMaxNum();	

	// 좋아요 insert
	public void insertLike(CrewLikeDTO crewLikeDTO);

	// 좋아요 update
	public void updateLike(CrewLikeDTO crewLikeDTO);
	
	// 좋아요 취소 delete
	public void deleteLike(CrewLikeDTO crewLikeDTO);
	
}
