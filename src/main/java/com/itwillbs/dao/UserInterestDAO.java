package com.itwillbs.dao;

import com.itwillbs.domain.InterestDTO;

public interface UserInterestDAO {
	
	public void userInterestMember(InterestDTO dto);
	public InterestDTO getUserInterest(String id);
	public void deleteUserInterest(InterestDTO dto);

}
