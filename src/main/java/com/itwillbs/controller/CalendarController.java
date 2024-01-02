package com.itwillbs.controller;

import com.itwillbs.domain.DateDTO;
import com.itwillbs.domain.ScheduleDTO;
import com.itwillbs.service.ScheduleService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

@Controller
public class CalendarController {
	
	@Inject
 	private ScheduleService scheduleService;
	
	@RequestMapping(value = "/calendar/calendar", method = RequestMethod.GET)
	public String calendar(Model model, HttpServletRequest request, DateDTO dateDTO){

	Calendar cal = Calendar.getInstance();
	DateDTO calendarData;
	//검색 날짜
	if(dateDTO.getDate().equals("")&&dateDTO.getMonth().equals("")){
		dateDTO = new DateDTO(String.valueOf(cal.get(Calendar.YEAR)),String.valueOf(cal.get(Calendar.MONTH)),String.valueOf(cal.get(Calendar.DATE)),null,null);
	}

	Map<String, Integer> today_info =  dateDTO.today_info(dateDTO);
	List<DateDTO> dateList = new ArrayList<DateDTO>();

	//검색 날짜 end
//	ScheduleDao scheduleDao = sqlSession.getMapper(ScheduleDAO.class);
//	ArrayList<ScheduleDTO> Schedule_list =  scheduleDao.schedule_list(dateData);
	
	List<ScheduleDTO> ScheduleList = scheduleService.scheduleList(dateDTO);
	

	//달력데이터에 넣기 위한 배열 추가
	ScheduleDTO[][] scheduleDataArr = new ScheduleDTO[32][4];
	if(ScheduleList.isEmpty()!=true){
	int j = 0;
	for(int i=0; i<ScheduleList.size(); i++){
	int date = Integer.parseInt(String.valueOf(ScheduleList.get(i).getScheduleDate())
					  .substring(String.valueOf(ScheduleList.get(i).getScheduleDate())
					  .length()-2,String.valueOf(ScheduleList.get(i).getScheduleDate()).length()));
	if(i>0){
	int date_before = Integer.parseInt(String.valueOf(ScheduleList.get(i-1).getScheduleDate())
							 .substring(String.valueOf(ScheduleList.get(i-1).getScheduleDate())
							 .length()-2,String.valueOf(ScheduleList.get(i-1).getScheduleDate()).length()));
	if(date_before==date){
	j=j+1;
	scheduleDataArr[date][j] = ScheduleList.get(i);
	}else{
	j=0;
	scheduleDataArr[date][j] = ScheduleList.get(i);
	}
	}else{
	scheduleDataArr[date][j] = ScheduleList.get(i);
	}
	}
	}



	//실질적인 달력 데이터 리스트에 데이터 삽입 시작.
	//일단 시작 인덱스까지 아무것도 없는 데이터 삽입
	for(int i=1; i<today_info.get("start"); i++){
	calendarData= new DateDTO(null, null, null, null, null);
	dateList.add(calendarData);
	}

	//날짜 삽입
	for (int i = today_info.get("startDay"); i <= today_info.get("endDay"); i++) {
	ScheduleDTO[] schedule_data_arr3 = new ScheduleDTO[4];
	schedule_data_arr3 = scheduleDataArr[i];

	if(i==today_info.get("today")){
	calendarData= new DateDTO(String.valueOf(dateDTO.getYear()), String.valueOf(dateDTO.getMonth()), String.valueOf(i), "today", schedule_data_arr3);
	}else{
	calendarData= new DateDTO(String.valueOf(dateDTO.getYear()), String.valueOf(dateDTO.getMonth()), String.valueOf(i), "normal_date", schedule_data_arr3);
	}
	dateList.add(calendarData);

	}

	//달력 빈 곳 빈 데이터로 삽입
	int index = 7-dateList.size()%7;

	if(dateList.size()%7!=0){

	for (int i = 0; i < index; i++) {
	calendarData= new DateDTO(null, null, null, null, null);
	dateList.add(calendarData);
	}
	}


	//배열에 담음
	model.addAttribute("dateList", dateList); //날짜 데이터 배열
	model.addAttribute("today_info", today_info);
	return "calendar/calendar";
	}

	@RequestMapping(value = "/scheduleAdd", method = RequestMethod.GET)
	public String schedule_add(HttpServletRequest request, ScheduleDTO scheduleDTO, RedirectAttributes rttr){
//	ScheduleDAO scheduleDao = sqlSession.getMapper(ScheduleDAO.class);
//	int count = scheduleDao.beforeScheduleAddSearch(scheduleDTO);
		int count = scheduleService.beforeScheduleAddSearch(scheduleDTO);
		
	String message = "";
	String url = "redirect:calendar/calendar";

	if(count>=4){
	message="스케쥴은 최대 4개만 등록 가능합니다.";
	}else{
	scheduleService.scheduleAdd(scheduleDTO);
	message="스케쥴이 등록되었습니다";
	}

	rttr.addFlashAttribute("message", message);
	return url;
	}
}
