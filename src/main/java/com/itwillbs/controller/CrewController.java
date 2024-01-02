package com.itwillbs.controller;

import com.itwillbs.domain.CategoriesDTO;
import com.itwillbs.domain.CrewDTO;
import com.itwillbs.domain.CrewPageDTO;
import com.itwillbs.service.CategotiesService;
import com.itwillbs.service.CrewLikeService;
import com.itwillbs.service.CrewService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
public class CrewController {
	
	@Inject
	private CrewService crewService;
	@Inject
	private CrewLikeService crewLikeService;
	@Inject
	private CategotiesService categotiesService;

	// 글 리스트 불러오기
	@RequestMapping(value = "/crew/list", method = RequestMethod.GET)
	public String crew(Model model, HttpServletRequest request) {

		// 한 화면에 보여줄 글 개수 설정(10개 설정)
		int pageSize = 10;
		String pageNum = request.getParameter("pageNum");
		String actCategory = request.getParameter("act");
		
		// pageNum이 없을 때 1로 설정
		if(pageNum==null) pageNum="1";

		// 현 페이지 번호 파라미터값 가져오기
		// pageNum => 정수형 currentPage
		int currentPage=Integer.parseInt(pageNum);
		
		// pageDTO 객체생성
		CrewPageDTO pageDTO=new CrewPageDTO();
		
		// set 메서드호출
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		

		// 액티비티 카테고리
		pageDTO.setActCategory(actCategory);
		
		// 디비작업 메서드 호출
		List<CrewDTO> crewList = crewService.getCrewList(pageDTO);
		
		// 페이징 작업
		int count = crewService.getCrewCount();
		int pageBlock = 10;
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+pageBlock-1;
		int pageCount = count/pageSize + (count%pageSize==0 ? 0 : 1);
		if(endPage > pageCount) endPage = pageCount;
		
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);

		
		// 체험
		List<CategoriesDTO> categoryList = categotiesService.getCategoryList();
	
		// model 담아서 감
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("crewList", crewList);
		model.addAttribute("pageDTO", pageDTO);

		// 기본 이동방식: 주소변경 없이 이동
		return "crew/crewList";
	}
	
	// 글쓰기 페이지로
	@RequestMapping(value = "/crew/write", method = RequestMethod.GET)
	public String write(Locale locale, Model model) {
		
		// 체험 종목
		List<CategoriesDTO> categoryList = categotiesService.getCategoryList();
		
		// 체험 지역
		List<String> cityList = new ArrayList<String>();
		cityList.add("북구"); cityList.add("사상구"); cityList.add("진구"); cityList.add("동래구");
		cityList.add("연제구"); cityList.add("수영구"); cityList.add("해운대구"); cityList.add("기장군");

		// 담기
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("cityList", cityList);
		
		// 기본 이동방식: 주소변경 없이 이동
		return "crew/crewWrite";
	}
	
	
	// 글쓰기 작업
	@RequestMapping(value = "/crew/writePro", method = RequestMethod.POST)
	public String writePro(CrewDTO crewDTO) {
//		System.out.println("BoardController writePro()");
		// 글쓰기 메서드 호출()
		crewService.insertCrew(crewDTO);
		
		// 이동방식: 주소변경 하면서 이동
		return "redirect:/crew/list";
	} 
	
	
	// 글 내용 보기
	@RequestMapping(value = "/crew/content", method = RequestMethod.GET)
	public String content(HttpServletRequest request, Model model, HttpSession session) {
		// 게시글 번호
		int crewNum=Integer.parseInt(request.getParameter("num"));
		
		// 세션 아이디
		String userId = (String)session.getAttribute("userId");
		
		Map<String, Object> crewMap = new HashMap<>();
		crewMap.put("crewNum", crewNum);
		crewMap.put("userId", userId);
		
		try {
			Map<String, Object> likeCheckMap = crewLikeService.likeCheck(crewMap);
			
			if(likeCheckMap == null) {
				model.addAttribute("clCheck", 0);
			}else {
				model.addAttribute("clCheck", likeCheckMap.get("clCheck"));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		
		Map<String, String> statusMap = new HashMap<>();	
		statusMap.put("Y", "모집중"); statusMap.put("N", "모집완료");
		
		// 조회수 증가
		crewService.updateReadcount(crewNum);
		
		// 글 가져오기 메서드 호출
		CrewDTO crewDTO = crewService.getCrew(crewNum);

//		System.out.println(crewDTO);
		
		// model 데이터 담기
		model.addAttribute("crewDTO", crewDTO);
		model.addAttribute("statusMap", statusMap);
		
		// 기본 이동방식: 주소변경 없이 이동
		return "crew/crewContent";
	} // content()
	
	// 글 수정하기
	@RequestMapping(value = "/crew/update", method = RequestMethod.GET)
	public String update(HttpServletRequest request, Model model) {
		
		// 세션값 id에 대한 정보를 디비 조회
		int num=Integer.parseInt(request.getParameter("num"));
		CrewDTO dto = crewService.getCrew(num);
		model.addAttribute("dto", dto);
		
		// 체험 종목(?)
		List<CategoriesDTO> categoryList = categotiesService.getCategoryList();
		
		// 체험 지역
		List<String> cityList = new ArrayList<String>();
		cityList.add("북구"); cityList.add("사상구"); cityList.add("진구"); cityList.add("동래구");
		cityList.add("연제구"); cityList.add("수영구"); cityList.add("해운대구"); cityList.add("기장군");
			
		// 담기
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("cityList", cityList);
		
		// 기본 이동방식: 주소변경 없이 이동
		return "crew/crewUpdate";
	} // String update()
	
	@RequestMapping(value = "/crew/updatePro", method = RequestMethod.POST)
	public String updatePro(CrewDTO crewDTO) {

		crewService.updateCrew(crewDTO);
		
		// 이동방식: 주소변경 하면서 이동
		// response.sendRedirect() 이동
		return "redirect:/crew/list";
	} // String updatePro()
	
	// 글 삭제
	@RequestMapping(value = "/crew/delete", method = RequestMethod.GET)
	public String delete(HttpServletRequest request) {
		
		// 세션값 id에 대한 정보를 디비 조회
		int num = Integer.parseInt(request.getParameter("num"));
		crewService.deleteCrew(num);
	
		// 이동방식: 주소변경 하면서 이동
		// response.sendRedirect() 이동
		return "redirect:/crew/list";
	} // String delete()
	
}
