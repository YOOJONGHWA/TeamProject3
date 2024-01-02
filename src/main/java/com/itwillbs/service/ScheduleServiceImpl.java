package com.itwillbs.service;

import com.itwillbs.dao.ScheduleDAO;
import com.itwillbs.domain.DateDTO;
import com.itwillbs.domain.ScheduleDTO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class ScheduleServiceImpl implements ScheduleService{

	@Inject
	private ScheduleDAO scheduleDAO;
	
	
	@Override
	public int scheduleAdd(ScheduleDTO scheduleDTO) {
		
		return scheduleDAO.scheduleAdd(scheduleDTO);
	}

	@Override
	public int beforeScheduleAddSearch(ScheduleDTO scheduleDTO) {

		return scheduleDAO.beforeScheduleAddSearch(scheduleDTO);
	}

	@Override
	public List<ScheduleDTO> scheduleList(DateDTO dateDTO) {

		return scheduleDAO.scheduleList(dateDTO);
	}

}
