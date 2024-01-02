package com.itwillbs.dao;

import com.itwillbs.domain.ActPageDTO;
import com.itwillbs.domain.ActivityDTO;

import java.util.List;

public interface ActivityDAO {
	public void insertActivity(ActivityDTO activityDto);
	public Integer getMaxNum();
	public List<ActivityDTO> getActivityList(ActPageDTO actPageDto);
	public ActivityDTO getActivity(int actNum);
	public Integer getActivityCount(ActPageDTO actPageDto);
	public void updateActivity(ActivityDTO activityDto);
	public void deleteActivity(ActivityDTO activityDto);
	public String getCompanyName(String companyId);
	public List<ActivityDTO> getActivityLocation();
	public List<String> getCompanyMember();
}
