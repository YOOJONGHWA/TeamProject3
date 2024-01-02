package com.itwillbs.dao;

import com.itwillbs.domain.ActivityDTO;
import com.itwillbs.domain.CrewDTO;
import com.itwillbs.domain.CrewPageDTO;

import java.util.List;

public interface CrewDAO {

	// 글 작성하기
	public void insertCrew(CrewDTO crewDTO);

	// 글 번호 가져오기
	public Integer getMaxNum();	
	
	// List<BoardDTO> 리턴할형 getCrewList(pageDTO dto);
	public List<CrewDTO> getCrewList(CrewPageDTO pageDTO);
	
	// 이전글
	public CrewDTO getCrewPrevNum(int num);
	
	// 다음글
	public CrewDTO getCrewNextNum(int num);
	
	// 총 글 개수 가져오기
	public int getCrewCount();	
	
	// 글 내용 가져오기
	public CrewDTO getCrew(int num);
	
	// 조회수 업데이트
	public void updateReadcount(int num);
	
	// 글 수정
	public void updateCrew(CrewDTO crewDTO);
	
	// 글 삭제
	public void deleteCrew(int num);

	// 글쓰기 액티비티 카테고리 가져오기
	public List<ActivityDTO> getActCategoryList(String actLocation);
	
	// 글쓰기 액티비티 가져오기
	public List<ActivityDTO> getActList(String actLocation);

	public List<ActivityDTO> getActList(ActivityDTO activityDTO);
	
	// 글 수정
	public void updateStatus(CrewDTO crewDTO);
	
}
