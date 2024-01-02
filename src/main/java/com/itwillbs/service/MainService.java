package com.itwillbs.service;

import com.itwillbs.domain.ActivityDTO;

import java.util.List;

public interface MainService {
	
	public List<ActivityDTO> getMainContentList();
	public List<ActivityDTO> getMainInterestList(String userId);
	public List<ActivityDTO> getMainAreaList(String userId);
}
