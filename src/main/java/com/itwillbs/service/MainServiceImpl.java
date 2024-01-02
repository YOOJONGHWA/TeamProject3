package com.itwillbs.service;

import com.itwillbs.dao.MainDAO;
import com.itwillbs.domain.ActivityDTO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class MainServiceImpl implements MainService {

	@Inject
	private MainDAO mainDAO; 
	
	@Override
	public List<ActivityDTO> getMainContentList() {
		
		return mainDAO.getMainContentList();
	}

	@Override
	public List<ActivityDTO> getMainInterestList(String userId) {
		return mainDAO.getMainInterestList(userId);
	}

	@Override
	public List<ActivityDTO> getMainAreaList(String userId) {
		return mainDAO.getMainAreaList(userId);
	}

	
}
