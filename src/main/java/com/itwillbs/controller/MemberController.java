package com.itwillbs.controller;

import com.itwillbs.domain.*;
import com.itwillbs.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MemberController {
	
	@Inject
	private MemberService memberService;
	
	@Inject
	private CategotiesService categotiesService;
	
	@Inject
	private CommonAreaService commonAreaService;
	
	@Inject
	private MainService mainService;
	
	@Inject
	private UserInterestService userInterestService;
	
	@Inject
	private UserInterestAreaService userInterestAreaService;
	

	// 유저 회원가입
	@RequestMapping(value = "/member/userinsert", method = RequestMethod.GET)
	public String userinsert(Model model) {
		
		//	카테고리 리스트
		List<CategoriesDTO> categoryList = categotiesService.getCategoryList();
		model.addAttribute("categoryList", categoryList);
		//	카테고리 리스트	
		
		// 지역 리스트
		List<CommonAreaDTO> commonAreaList = commonAreaService.getAreaList();
		model.addAttribute("commonAreaList", commonAreaList);
		// 지역 리스트
		
		return "member/userinsertForm";
	}
	
	@RequestMapping(value = "/member/userinsertPro", method = RequestMethod.POST)
	public String userinsertPro(MemberDTO dto, HttpServletRequest request ) {
		
		  String userSport = request.getParameter("userSport");
	      String userId = dto.getUserId();
	      
	      InterestDTO interestDTO = new InterestDTO();
	      interestDTO.setUserId(userId);
	      
	      String[] categories = userSport.split(" ");
	      
	      for(int i = 0; i < categories.length; i++) {
	    	  interestDTO.setCategory(categories[i]);
	    	  userInterestService.userInterestMember(interestDTO);
		  };
		  
		  String userArea = request.getParameter("userArea");
		  
	      InterestAreaDTO interestAreaDTO = new InterestAreaDTO();
	      interestAreaDTO.setUserId(userId);
	      
	      String[] Area = userArea.split(" ");
	      
	      for(int i = 0; i < Area.length; i++) {
	    	interestAreaDTO.setArea(Area[i]);
	    	userInterestAreaService.userInterestArea(interestAreaDTO);
	      };
	      
		memberService.userInsertMember(dto);
		
		return "redirect:/member/userlogin";
	}
	// 유저 회원가입 끝
	
	// 회원 로그인
	@RequestMapping(value = "/member/userlogin", method = RequestMethod.GET)
	public String userlogin() {
		
		return "member/userloginForm";
	}
	
	@RequestMapping(value = "/member/userloginPro", method = RequestMethod.POST)
	public String userloginPro(MemberDTO dto, HttpSession session) {
		MemberDTO memberdto = memberService.userCheck(dto);
		
		if(memberdto != null) {
			session.setAttribute("userId", memberdto.getUserId());
			session.setAttribute("loginGb", "U");
			return "redirect:/main/main";
			
		} else {
			return "member/msg";
		}
	}
	// 회원 로그인
	
	// 회원 로그아웃
	@RequestMapping(value = "/member/logout", method = RequestMethod.GET)	
	public String logout(HttpSession session) {
		// 세션값 전체 삭제
		session.invalidate();
		// 기본 이동방식 : 주소변경 없이 이동 
		return "redirect:/main/main";
	}
	// 회원 로그아웃
	
	// 개인이용약관
	@RequestMapping(value = "/member/usercheck", method = RequestMethod.GET)
	public String usercheck() {
		
		return "member/usercheckForm";
	}
	// 개인이용약관
	
	//----------------------------------------------------------------------------------------------------
	
	// 유저 비밀번호 찾기
	@RequestMapping(value = "/finding/userpassfind", method = RequestMethod.GET)
	public String userpassfind() {
		return "finding/userpassfindForm";
	}
	
	@RequestMapping(value = "/finding/userpassfindPro", method = RequestMethod.POST)
	public String userpassfindPro(HttpSession session, MemberDTO dto) {
		MemberDTO memberdto = memberService.userIdCheck(dto);
	
		if(memberdto != null) {
			session.setAttribute("userId", memberdto.getUserId());
			return "redirect:/finding/userpassfindclear";
		} else {
			return "member/msg";
		}
	}
	// 유저 비밀번호 찾기
	
	// 유저 비밀번호 확인
	@RequestMapping(value = "/finding/userpassfindclear", method = RequestMethod.GET)
	public String userpassfindclear(HttpSession session, Model model) {
		// 세션값 id에 대한 정보를 디비 조회
		String id=(String)session.getAttribute("userId");
		//메서드 호출
		MemberDTO dto = memberService.userGetMember(id);
		// dto  Model model(request) 담기
		model.addAttribute("dto", dto);
		session.invalidate();
		// 기본 이동방식 : 주소변경 없이 이동 
		
		return "finding/userpassfindclearForm";
	}
	// 유저 비밀번호 확인
	
	// 유저 아이디 찾기
	@RequestMapping(value = "/finding/useridfind", method = RequestMethod.GET)
	public String useridfind() {
		
		return "finding/useridfindForm";
	}
	
	@RequestMapping(value = "/finding/useridfindPro", method = RequestMethod.POST)
	public String useridfindPro(MemberDTO dto, HttpSession session) {
		MemberDTO memberdto = memberService.userEmailCheck(dto);
		
		if(memberdto != null) {
			session.setAttribute("userEmail", memberdto.getUserEmail());
			return "redirect:/finding/useridfindclear";
		} else {
			
			return "member/msg";
		}
	}
	// 유저 아이디 찾기
	
	// 유저 아이디 확인
	@RequestMapping(value = "/finding/useridfindclear", method = RequestMethod.GET)
	public String useridfindclear(HttpSession session, Model model) {
		// 세션값 id에 대한 정보를 디비 조회
		String email=(String)session.getAttribute("userEmail");
		//메서드 호출
		MemberDTO dto = memberService.userGetMemberEmail(email);
		// dto  Model model(request) 담기
		model.addAttribute("dto", dto);
		// 기본 이동방식 : 주소변경 없이 이동 
		
		return "finding/useridfindclearForm";
	}
	// 유저 아이디 확인
	
// 기타 -------------------------------------------------------------------------------------------------------------
	
	
	// 메인
	@RequestMapping(value = "/main/main", method = RequestMethod.GET)
	public String main2(HttpSession session, Model model) {
		String userId=(String)session.getAttribute("userId");
		
		List<ActivityDTO> areaList = mainService.getMainAreaList(userId);
		List<ActivityDTO> interestList = mainService.getMainInterestList(userId);
		List<ActivityDTO> bestList = mainService.getMainContentList();
		
		model.addAttribute("bestList", bestList);
		model.addAttribute("interestList", interestList);
		model.addAttribute("areaList", areaList);
		
		return "main/main";
	}
	// 메인
	
	// mypage(마이페이지 메인)
	@RequestMapping(value = "/member/mypage", method = RequestMethod.GET)
	public String main() {

		return "member/mypage";
	}

	

	// mypage(회원 정보 삭제)
	@RequestMapping(value = "/member/delete", method = RequestMethod.GET)
	public String delete() {
		return "member/deleteForm";

	}

	// mypage(회원 정보 삭제)
	@RequestMapping(value = "/member/deletePro", method = RequestMethod.POST)
	public String deletePro(MemberDTO dto, HttpSession session) {
		MemberDTO memberDTO = memberService.userCheck(dto);
		if (memberDTO != null) {
			memberService.userDeleteMember(memberDTO);

			session.invalidate();

			return "redirect:/member/mypage";
		} else {

			return "member/msg";
		}
	}


}
