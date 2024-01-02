package com.itwillbs.dao;

import com.itwillbs.domain.ActivityDTO;

import java.util.List;

public interface MainDAO {

	public List<ActivityDTO> getMainContentList();
	public List<ActivityDTO> getMainInterestList(String userId);
	public List<ActivityDTO> getMainAreaList(String userId);
}
