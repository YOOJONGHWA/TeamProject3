package com.itwillbs.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.itwillbs.domain.CompanyDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.service.CompanyService;
import com.itwillbs.service.MemberService;

@RestController
public class CompanyAjaxController {
	// MemberService 객체 생성
	
	@Inject
	private CompanyService companyService;
	
	@RequestMapping(value = "/member/companyidCheck", method = RequestMethod.GET)	
	public ResponseEntity<String> companyidCheck(HttpServletRequest request) {
		String result="";
		
		String id = request.getParameter("companyId");
		// MemberDTO dto = getMember()메서드 호출
		CompanyDTO dto = companyService.companyGetMember(id);
		if(dto != null) {
			// 아이디 있음 => 아이디 중복
			result = "iddup";
		}else {
			// 아이디 없음 => 아이디 사용가능
			result = "idok";
		}
		
		// ResponseEntity에 출력 결과를 담아서 리턴
		ResponseEntity<String> entity = new ResponseEntity<String>(result, HttpStatus.OK);
		return entity; // 결과 리턴
	}
}
