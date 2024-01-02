package com.itwillbs.service;

import com.itwillbs.domain.DateDTO;
import com.itwillbs.domain.ScheduleDTO;

import java.util.List;

public interface ScheduleService {
	
	public int scheduleAdd(ScheduleDTO scheduleDTO);
	public int beforeScheduleAddSearch(ScheduleDTO scheduleDTO);
	public List<ScheduleDTO> scheduleList(DateDTO dateDTO);

}
