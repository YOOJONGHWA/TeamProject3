package com.itwillbs.service;

import com.itwillbs.dao.UserInterestDAO;
import com.itwillbs.domain.InterestDTO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;

@Service
public class UserInterestServiceImpl implements UserInterestService{

	@Inject
	private UserInterestDAO userInterestDAO;
	
	@Override
	public void userInterestMember(InterestDTO dto) {
		userInterestDAO.userInterestMember(dto);
	}

	@Override
	public InterestDTO getUserInterest(String id) {
		return userInterestDAO.getUserInterest(id);
	}

	@Override
	public void deleteUserInterest(InterestDTO dto) {
		userInterestDAO.deleteUserInterest(dto);
	}
	
	

	
}
