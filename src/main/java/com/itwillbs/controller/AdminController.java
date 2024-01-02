package com.itwillbs.controller;

import com.itwillbs.domain.CompanyDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.CompanyService;
import com.itwillbs.service.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class AdminController {
	
	@Inject
	private MemberService memberService;
	
	@Inject
	private CompanyService companyService;

	
	// 어드민 마이
	@RequestMapping(value = "/main/adminMy", method = RequestMethod.GET)
	public String adminMy() {
		
		return "main/adminMy";
	}
	// 어드민 마이
	
	// 관리자 일반 회원 관리
	@RequestMapping(value = "/member/userinfo", method = RequestMethod.GET)
	public String userinfo(Model model, HttpServletRequest request) {
		// http://localhost:8080/myweb/board/list
		// http://localhost:8080/myweb/board/list?pageNum=2
		// 한 화면에 보여줄 글 개수 설정 (10개 설정)
		int pageSize = 10;
		// 현 페이지 번호 파라미터값 가져오기
		String pageNum = request.getParameter("pageNum");
		// 페이지 번호가 없으면 => "1" 설정
		if(pageNum == null){
		 	pageNum = "1";
		}
		// pageNum => 정수형 currentPage
		int currentPage = Integer.parseInt(pageNum);
		// PageDTO 객체생성
		PageDTO dto = new PageDTO();
		// set 메서드 호출
		dto.setPageSize(pageSize);
		dto.setPageNum(pageNum);
		dto.setCurrentPage(currentPage);
		
		// 디비작업 메서드 호출
		// List<BoardDTO> 리턴할형 getBoardList(PageDTO dto) 메서드 정의
		// List<BoardDTO> boardList =dao.getBoardList(dto);
		List<MemberDTO> memberList = memberService.getMemberList(dto);
		//페이징 작업
		// 전체 게시판 글의 개수 가져오기
		// select count(*) from board  
		int count = memberService.getMemberCount();
		int pageBlock = 10; 
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+pageBlock-1;
		int pageCount = count/pageSize+(count%pageSize==0 ? 0 : 1);
		if(endPage > pageCount){
	 	   endPage = pageCount;
	    }
		dto.setCount(count);
		dto.setPageBlock(pageBlock);
		dto.setStartPage(startPage);
		dto.setEndPage(endPage);
		dto.setPageCount(pageCount);
		
		// model 담아서 이동
		model.addAttribute("memberList", memberList);
		model.addAttribute("pageDto", dto);
		
		return "member/userinfo";
	}
	// 관리자 일반 회원 관리
	
//	 관리자 일반 회원 강제 탈퇴
	@RequestMapping(value = "/member/userdelete", method = RequestMethod.GET)	
	public String delete(MemberDTO dto) {
		
		memberService.userDeleteMember(dto);
		
		return "redirect:/member/userinfo";
	}
// 관리자 일반 회원 강제 탈퇴
	
	
	// 관리자 기업 회원 관리
	@RequestMapping(value = "/member/companyinfo", method = RequestMethod.GET)
	public String companyinfo(Model model, HttpServletRequest request) {
		
		// http://localhost:8080/myweb/board/list
		// http://localhost:8080/myweb/board/list?pageNum=2
		// 한 화면에 보여줄 글 개수 설정 (10개 설정)
		int pageSize = 10;
		// 현 페이지 번호 파라미터값 가져오기
		String pageNum = request.getParameter("pageNum");
		// 페이지 번호가 없으면 => "1" 설정
		if(pageNum == null){
		 	pageNum = "1";
		}
		// pageNum => 정수형 currentPage
		int currentPage = Integer.parseInt(pageNum);
		// PageDTO 객체생성
		PageDTO dto = new PageDTO();
		// set 메서드 호출
		dto.setPageSize(pageSize);
		dto.setPageNum(pageNum);
		dto.setCurrentPage(currentPage);
		// 디비작업 메서드 호출
		// List<BoardDTO> 리턴할형 getBoardList(PageDTO dto) 메서드 정의
		// List<BoardDTO> boardList =dao.getBoardList(dto);
		List<CompanyDTO> companyList = companyService.getCompanyList(dto);
		//페이징 작업
		// 전체 게시판 글의 개수 가져오기
		// select count(*) from board  
		int count = companyService.getCompanyCount();
		int pageBlock = 10; 
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+pageBlock-1;
		int pageCount = count/pageSize+(count%pageSize==0 ? 0 : 1);
		if(endPage > pageCount){
	 	   endPage = pageCount;
	    }
		dto.setCount(count);
		dto.setPageBlock(pageBlock);
		dto.setStartPage(startPage);
		dto.setEndPage(endPage);
		dto.setPageCount(pageCount);
		
		// model 담아서 이동
		model.addAttribute("companyList", companyList);
		model.addAttribute("pageDto", dto);
		
		return "member/companyinfo";
	}
	// 관리자 기업 회원 관리
	
//	 관리자 일반 회원 강제 탈퇴
	@RequestMapping(value = "/member/companydelete", method = RequestMethod.GET)	
	public String companydelete(CompanyDTO dto, HttpServletRequest request) {
		
		companyService.companyDeleteMember(dto);
		
		return "redirect:/member/companyinfo";
	}
//관리자 일반 회원 강제 탈퇴
	
	
	
}
