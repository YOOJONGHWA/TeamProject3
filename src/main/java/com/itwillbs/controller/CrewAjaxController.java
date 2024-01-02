package com.itwillbs.controller;

import com.itwillbs.domain.ActivityDTO;
import com.itwillbs.domain.CrewDTO;
import com.itwillbs.domain.CrewLikeDTO;
import com.itwillbs.domain.CrewReplyDTO;
import com.itwillbs.service.CrewLikeService;
import com.itwillbs.service.CrewReplyService;
import com.itwillbs.service.CrewService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
public class CrewAjaxController {
	
	@Inject
	private CrewService crewService;
	@Inject
	private CrewReplyService crewReplyService;
	@Inject
	private CrewLikeService crewLikeService;
	
	// http://localhost:8080/myweb/crew/$%7BpageContext.request.contextPath%7D/reply/delete 
	// http://localhost:8080/myweb/crew/reply/list
	
	
	// 글쓰기 카테고리 리스트 가져오기 1
	@RequestMapping(value = "/crew/categoryList", method = RequestMethod.GET)
	public ResponseEntity<List<ActivityDTO>> categorylist(@RequestParam String actLocation) {

		// 리스트 가져오기
		List<ActivityDTO> actLocationList = crewService.getActCategoryList(actLocation);

		// ResponseEntity에 출력 결과를 담아서 리턴
		ResponseEntity<List<ActivityDTO>> entity = new ResponseEntity<List<ActivityDTO>>(actLocationList, HttpStatus.OK);
		
		return entity;
	}
	
	
	// 글쓰기 체험 타이틀 가져오기
	@RequestMapping(value = "/crew/actList", method = RequestMethod.GET)
	public ResponseEntity<List<ActivityDTO>> actList(HttpServletRequest request) {

		String actLocation = request.getParameter("actLocation");
		String actCategory = request.getParameter("actCategory");
		
//		System.out.println(actLocation);
//		System.out.println(actCategory);
		
		ActivityDTO activityDTO = new ActivityDTO();
		activityDTO.setActCategory(actCategory);
		activityDTO.setActLocation(actLocation);
		
		// 리스트 가져오기
		List<ActivityDTO> actList = crewService.getActList(activityDTO);

		// ResponseEntity에 출력 결과를 담아서 리턴
		ResponseEntity<List<ActivityDTO>> entity = new ResponseEntity<List<ActivityDTO>>(actList, HttpStatus.OK);
		
		return entity;
	}
	
	
	// 모집중, 모집완료 변경
	@RequestMapping(value = "/crew/status", method = RequestMethod.GET)
	public void statusupdate(HttpServletRequest request) {

		String status = request.getParameter("status");
		int crewNum = Integer.parseInt(request.getParameter("crewNum"));
		
		String crewStatus = "";
		
		CrewDTO crewDTO = new CrewDTO();
		crewDTO.setCrewNum(crewNum);
		
//		System.out.println(status);
//		System.out.println(crewDTO.getCrewNum());
		
		if(status.equals("모집중")) {
//			System.out.println("넘어온 값: 모집중 -> Y으로 바꿈");
			
			crewStatus = "Y";
			crewDTO.setCrewStatus(crewStatus);
			crewService.updateStatus(crewDTO);
		}else {
//			System.out.println("넘어온 값: 모집완료 -> N으로 바꿈");
			crewStatus = "N";
			crewDTO.setCrewStatus(crewStatus);
			crewService.updateStatus(crewDTO);
		}
		
	
	} //
	
	
	// 댓글 리스트 가져오기
	@RequestMapping(value = "/crewreply/list", method = RequestMethod.GET)
	public ResponseEntity<List<CrewReplyDTO>> replylist(@RequestParam String crewNum, HttpServletRequest request) {
		
		int num = Integer.parseInt(crewNum);
		// 댓글 가져오기
		List<CrewReplyDTO> crewReplyList = crewReplyService.getCrewReplyList(num);


		// ResponseEntity에 출력 결과를 담아서 리턴
		ResponseEntity<List<CrewReplyDTO>> entity = new ResponseEntity<List<CrewReplyDTO>>(crewReplyList, HttpStatus.OK);
		
		
		return entity;
	}

	
	// 부모 댓글 작성
	@RequestMapping(value = "/crewreply/write", method = RequestMethod.POST)
	public void replywrite(@RequestBody CrewReplyDTO crewReplyDTO, HttpSession session) {
		
//		System.out.println("댓글쓰기" + crewReplyDTO);
		
		String userId = (String)session.getAttribute("userId");
		
		int crParent = 0;	
		int crdepth = 1;
		int crOrder = 1;
		
		crewReplyDTO.setCrParent(crParent);
		crewReplyDTO.setCrDepth(crdepth);
		crewReplyDTO.setCrOrder(crOrder);
		
		crewReplyDTO.setUserId(userId);

		crewReplyService.insertReply(crewReplyDTO);
	
	} //
	
	
	// 자식 댓글 작성 (대댓글)
	@RequestMapping(value = "/crewreply/rewrite", method = RequestMethod.POST)
	public void rereplywrite(@RequestBody CrewReplyDTO crewReplyDTO, HttpSession session) {

		String userId = (String)session.getAttribute("userId");
		
		// 부모 댓글 번호 받아오기
		
		int crParent = crewReplyDTO.getCrParent();	
		int crdepth = 2;
		int crOrder = 2;
		
		crewReplyDTO.setCrParent(crParent);
		crewReplyDTO.setCrDepth(crdepth);
		crewReplyDTO.setCrOrder(crOrder);
		
		crewReplyDTO.setUserId(userId);

		crewReplyService.insertReReply(crewReplyDTO);
	
	} //
	
	
	// 댓글 수정
	@RequestMapping(value = "/crewreply/update", method = RequestMethod.POST)
	public void replyupdate(@RequestBody CrewReplyDTO crewReplyDTO) {

		crewReplyService.updateReply(crewReplyDTO);
	
	} //
	
	
	// 부모 댓글 삭제 (dto) => 바꾼 이유. 부모댓, 자식댓 삭제하는 거 분리하기 위해서!
	//					 => 그냥 dto 객체 생성해서 넘기는 게 나았나?
	@RequestMapping(value = "/crewreply/delete", method = RequestMethod.POST)
	public void deleteReply(@RequestBody CrewReplyDTO crewReplyDTO) {
//		System.out.println(crewReplyDTO.getCrNum() +"번 부모 댓글 삭제하러 감다");
		int num = crewReplyDTO.getCrNum();

//		System.out.println(crewReplyDTO);
		crewReplyService.deleteReply(crewReplyDTO);

		
	}
	
	// 자식 댓글 삭제
	@RequestMapping(value = "/crewreply/redelete", method = RequestMethod.POST)
	public void deleteReReply(@RequestBody CrewReplyDTO crewReplyDTO) {
//		System.out.println(crewReplyDTO.getCrNum() +"번 자식 댓글 삭제하러 감다");
//		System.out.println(crewReplyDTO);
		
		crewReplyService.deleteReReply(crewReplyDTO);

		
	}


	// ~ ~ ~ 좋아요 ~ ~ ~	
	
	
	// 좋아요 insert (필요: 유저아이디, 게시글 번호)
	// db에 데이터가 들어있는지 확인하고 있으면 => clCheck+1 update
	//							없으면 => insert
	// 좋아요 
	@RequestMapping(value = "/crewlike/add", method = RequestMethod.POST)
	public void like(@RequestBody CrewLikeDTO crewLikeDTO, HttpSession session) {

		// 유저 아이디
		String userId = (String)session.getAttribute("userId");		
		crewLikeDTO.setUserId(userId);

		// 게시글 번호
//		System.out.println(crewLikeDTO.getCrewNum() +"번 게시글 좋아요 ♡");
				
		crewLikeService.insertLike(crewLikeDTO);
		
	} //
	
	
	
	// 좋아요 취소 update
	@RequestMapping(value = "/crewlike/sub", method = RequestMethod.POST)
	public void likecancle(@RequestBody CrewLikeDTO crewLikeDTO, HttpSession session) {
		
		// 유저 아이디
		String userId = (String)session.getAttribute("userId");		
		crewLikeDTO.setUserId(userId);
		
		// 게시글 번호
//		System.out.println(crewLikeDTO.getCrewNum() +"번 게시글 좋아요 취소!");

		crewLikeService.deleteLike(crewLikeDTO);

		
	}
	
	
}
