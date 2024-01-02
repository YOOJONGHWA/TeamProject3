package com.itwillbs.service;

import com.itwillbs.domain.InterestAreaDTO;

public interface UserInterestAreaService {

	public void userInterestArea(InterestAreaDTO dto);
	public InterestAreaDTO getUserInterestArea(String id);
	public void deleteUserInterestArea(InterestAreaDTO dto);
}
