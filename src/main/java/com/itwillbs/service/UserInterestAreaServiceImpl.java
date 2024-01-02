package com.itwillbs.service;

import com.itwillbs.dao.UserInterestAreaDAO;
import com.itwillbs.domain.InterestAreaDTO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;

@Service
public class UserInterestAreaServiceImpl implements UserInterestAreaService{

	@Inject
	private UserInterestAreaDAO userInterestAreaDAO;

	@Override
	public void userInterestArea(InterestAreaDTO dto) {
		userInterestAreaDAO.userInterestArea(dto);
	}

	@Override
	public InterestAreaDTO getUserInterestArea(String id) {
		return userInterestAreaDAO.getUserInterestArea(id);
	}

	@Override
	public void deleteUserInterestArea(InterestAreaDTO dto) {
		userInterestAreaDAO.deleteUserInterestArea(dto);
	}

	
	

	
}
