package com.itwillbs.controller;

import com.itwillbs.domain.CompanyDTO;
import com.itwillbs.service.CompanyService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

@Controller
public class CompanyController {
	
	@Inject
	private CompanyService companyService;

	// 기업 회원가입
	@RequestMapping(value = "/member/companyinsert", method = RequestMethod.GET)
	public String companyinsert() {
		
		return "member/companyinsertForm";
	}
	
	@RequestMapping(value = "/member/companyinsertPro", method = RequestMethod.POST)
	public String companyinsertPro(CompanyDTO dto) {
		companyService.companyInsertMember(dto);
		
		return "redirect:/member/companylogin";
	}
	// 기업 회원가입 끝
	
	// 기업 로그인
	@RequestMapping(value = "/member/companylogin", method = RequestMethod.GET)
	public String companylogin() {
		
		return "member/companyloginForm";
	}
	
	@RequestMapping(value = "/member/companyloginPro", method = RequestMethod.POST)
	public String companyloginPro(CompanyDTO dto, HttpSession session) {
		CompanyDTO companydto = companyService.companyUserCheck(dto);
		
		if(companydto != null) {
			session.setAttribute("userId", companydto.getCompanyId());
			session.setAttribute("loginGb", "C");
			return "redirect:/main/main";
		} else {
			return "member/msg";
		}
	}
	// 기업 로그인
	
	// 기업이용약관
	@RequestMapping(value = "/member/companycheck", method = RequestMethod.GET)
	public String companycheck() {
		
		return "member/companycheckForm";
	}
	// 기업이용약관
	
	//----------------------------------------------------------------------------------------------------
	
	
	// 기업 비밀번호 찾기
	@RequestMapping(value = "/finding/companypassfind", method = RequestMethod.GET)
	public String companypassfind() {
		
		return "finding/companypassfindForm";
	}
	
	@RequestMapping(value = "/finding/companypassfindPro", method = RequestMethod.POST)
	public String companypassfindPro(CompanyDTO dto, HttpSession session) {
		CompanyDTO companydto = companyService.companyIdCheck(dto);
		if(companydto != null) {
			session.setAttribute("companyId", companydto.getCompanyId());
			return "redirect:/finding/companypassfindclear";
		} else {
			return "member/msg";
		}
	}
	// 기업 비밀번호 찾기
	
	// 기업 비밀번호 확인
	@RequestMapping(value = "/finding/companypassfindclear", method = RequestMethod.GET)
	public String companypassfindclear(HttpSession session, Model model) {
		// 세션값 id에 대한 정보를 디비 조회
		
		String id=(String)session.getAttribute("companyId");
		//메서드 호출
		CompanyDTO dto = companyService.companyGetMember(id);
		// dto  Model model(request) 담기
		model.addAttribute("dto", dto);
		// 기본 이동방식 : 주소변경 없이 이동 
		
		return "finding/companypassfindclearForm";
	
	}
	// 기업 비밀번호 확인
	
	// 기업 아이디 찾기
	@RequestMapping(value = "/finding/companyidfind", method = RequestMethod.GET)
	public String companyidfind() {
		
		return "finding/companyidfindForm";
	}
	
	@RequestMapping(value = "/finding/companyidfindPro", method = RequestMethod.POST)
	public String companyidfindPro(CompanyDTO dto, HttpSession session) {
		CompanyDTO companydto = companyService.companyNumCheck(dto);
		
		if(companydto != null) {
			session.setAttribute("companyNum", companydto.getCompanyNum());
			return "redirect:/finding/companyidfindclear";
		} else {
			return "member/msg";
		}
	}
	// 기업 아이디 찾기
	
	// 기업 아이디 확인
	@RequestMapping(value = "/finding/companyidfindclear", method = RequestMethod.GET)
	public String companyidfindclear(HttpSession session, Model model) {
		// 세션값 id에 대한 정보를 디비 조회
		
		String id=(String)session.getAttribute("companyNum");
		//메서드 호출
		CompanyDTO dto = companyService.companyGetMemberNum(id);
		// dto  Model model(request) 담기
		model.addAttribute("dto", dto);
		// 기본 이동방식 : 주소변경 없이 이동 
		
		return "finding/companyidfindclearForm";
	}
	// 기업 아이디 확인
	
	


}
