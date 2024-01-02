package com.itwillbs.controller;

import com.itwillbs.dao.PointDAO;
import com.itwillbs.domain.PointDTO;
import com.itwillbs.domain.PointPageDTO;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.PointService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class PointController {
//	@ResponseBody
//	@RequestMapping(value = "/verify_iamport/{imp_uid}", method = RequestMethod.POST)
//	public IamportResponse<Payment> verifyIamportPOST(@PathVariable(value = "imp_uid") String imp_uid) throws IamportResponseException, IOException {
//	    return client.paymentByImpUid(imp_uid);
//	}

	@Inject
	private PointService pointService;

	private PointDAO pointDAO;

	@Inject
	private MemberService memberService;

//	public PointController() {
//	      // REST API 키와 REST API secret 입력
//	      this.api = new IamportClient("", "");
//	}

	@RequestMapping(value = "/point/list", method = RequestMethod.GET)	
	public String pointList(HttpServletRequest request, Model model) {
		
		// 화면에 보여줄 글의 개수
		int pageSize=10;
		// 페이지번호 가져오기
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		int currentPage = Integer.parseInt(pageNum);
		
		PointPageDTO ptPageDTO = new PointPageDTO();
		
		ptPageDTO.setPageSize(pageSize);
		ptPageDTO.setPageNum(pageNum);
		ptPageDTO.setCurrentPage(currentPage);
		
		List<PointDTO> ptList = pointService.getPointCheckList(ptPageDTO);
		
		int count = pointService.getptPageCount();
		
		int pageBlock=10; 
		int startPage=(currentPage-1)/pageBlock * pageBlock+1;
		int endPage=startPage + pageBlock-1;
		int pageCount = count/pageSize + (count % pageSize==0 ? 0 : 1);
		if(endPage > pageCount) {
	 	   endPage = pageCount;
	    }
		
		ptPageDTO.setCount(count);
		ptPageDTO.setPageBlock(pageBlock);
		ptPageDTO.setStartPage(startPage);
		ptPageDTO.setEndPage(endPage);
		ptPageDTO.setPageCount(pageCount);
		
		// 데이터 담기
		model.addAttribute("ptList", ptList);
		model.addAttribute("ptPageDTO", ptPageDTO);
		
		return "main/main";
	}
	
}