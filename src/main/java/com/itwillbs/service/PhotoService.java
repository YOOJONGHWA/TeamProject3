package com.itwillbs.service;

import com.itwillbs.domain.PhotoDTO;
import com.itwillbs.domain.PhotoPageDTO;

import java.util.List;

public interface PhotoService {
	
	// 글 작성하기
	public void insertPhoto(PhotoDTO photoDTO);

	// List<BoardDTO> 리턴할형 getCrewList(pageDTO dto);
	public List<PhotoDTO> getPhotoList(PhotoPageDTO pageDTO);
	
	public int getPhotoCount();	
	
	// 글 내용 가져오기
	public PhotoDTO getPhoto(int num);
	
	// 조회수 업데이트
	public void updateReadcount(int num);
	
	// 글 수정
	public void updatePhoto(PhotoDTO photoDTO);
	
	// 글 삭제
	public void deletePhoto(int num);
	
}
