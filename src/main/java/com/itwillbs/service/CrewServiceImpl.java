package com.itwillbs.service;

import com.itwillbs.dao.CrewDAO;
import com.itwillbs.domain.ActivityDTO;
import com.itwillbs.domain.CrewDTO;
import com.itwillbs.domain.CrewPageDTO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.sql.Timestamp;
import java.util.List;

@Service
public class CrewServiceImpl implements CrewService {
	
	@Inject
	private CrewDAO crewDAO;

	@Override
	public void insertCrew(CrewDTO crewDTO) {
		// name,subject,content
		// num,readcount,date
		// num = max(num) + 1
		if(crewDAO.getMaxNum()==null) {
			// 글이 없는 경우
			crewDTO.setCrewNum(1);
		}else {
			// 글이 있는 경우
			crewDTO.setCrewNum(crewDAO.getMaxNum()+1);
		}
		
		String crewStatus = "Y";
		
		crewDTO.setCrewStatus(crewStatus);
		crewDTO.setCrewReadcount(0);
		crewDTO.setCrewDate(new Timestamp(System.currentTimeMillis()));

		crewDAO.insertCrew(crewDTO);
		
	}

	@Override
	public List<CrewDTO> getCrewList(CrewPageDTO pageDTO) {
		// startRow 구하기
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		// endRow 구하기
		int endRow=startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setStartRow(startRow-1);
		pageDTO.setEndRow(endRow);

		
		return crewDAO.getCrewList(pageDTO);
	}

	@Override
	public CrewDTO getCrewPrevNum(int num) {
		return crewDAO.getCrewPrevNum(num);
	}
	
	@Override
	public CrewDTO getCrewNextNum(int num) {
		return crewDAO.getCrewNextNum(num);
	}
	
	
	@Override
	public int getCrewCount() {
		return crewDAO.getCrewCount();
	}

	@Override
	public CrewDTO getCrew(int num) {
		return crewDAO.getCrew(num);
	}

	@Override
	public void updateReadcount(int num) {
		crewDAO.updateReadcount(num);
	}

	@Override
	public void updateCrew(CrewDTO crewDTO) {
		crewDAO.updateCrew(crewDTO);
	}

	@Override
	public void deleteCrew(int num) {
		crewDAO.deleteCrew(num);
	}

	@Override
	public List<ActivityDTO> getActCategoryList(String actLocation) {
		return crewDAO.getActCategoryList(actLocation);
	}

	@Override
	public List<ActivityDTO> getActList(String actLocation) {
		return crewDAO.getActList(actLocation);
	}
	
	@Override
	public List<ActivityDTO> getActList(ActivityDTO activityDTO) {
		return crewDAO.getActList(activityDTO);
	}

	@Override
	public void updateStatus(CrewDTO crewDTO) {
		crewDAO.updateStatus(crewDTO);
		
	}
	

}
