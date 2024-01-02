package com.itwillbs.service;

import com.itwillbs.domain.ActPageDTO;
import com.itwillbs.domain.ActivityDTO;

import java.util.List;

public interface ActivityService {
	public void insertActivity(ActivityDTO activityDto) throws Exception;
	public List<ActivityDTO> getActivityList(ActPageDTO actPagedto);
	public Integer getActivityCount(ActPageDTO pageDto);
	public ActivityDTO getActivity(int actNum);
	public void updateActivity(ActivityDTO activityDto);
	public void deleteActivity(ActivityDTO activityDto);
	public String getCompanyName(String companyId);
	public List<ActivityDTO> getActivityLocation();
	public List<String> getCompanyMember();
}
