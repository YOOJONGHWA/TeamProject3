package com.itwillbs.service;

import com.itwillbs.domain.InterestDTO;

public interface UserInterestService {

	public void userInterestMember(InterestDTO dto);
	public InterestDTO getUserInterest(String id);
	public void deleteUserInterest(InterestDTO dto);
}
