package com.itwillbs.dao;

import com.itwillbs.domain.InterestAreaDTO;

public interface UserInterestAreaDAO {
	
	public void userInterestArea(InterestAreaDTO dto);
	public InterestAreaDTO getUserInterestArea(String id);
	public void deleteUserInterestArea(InterestAreaDTO dto);

}
