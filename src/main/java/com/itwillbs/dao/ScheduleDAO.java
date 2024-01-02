package com.itwillbs.dao;

import com.itwillbs.domain.DateDTO;
import com.itwillbs.domain.ScheduleDTO;

import java.util.List;

public interface ScheduleDAO {

	public int scheduleAdd(ScheduleDTO scheduleDTO);
	public int beforeScheduleAddSearch(ScheduleDTO scheduleDTO);
	public List<ScheduleDTO> scheduleList(DateDTO dateDTO);
}
