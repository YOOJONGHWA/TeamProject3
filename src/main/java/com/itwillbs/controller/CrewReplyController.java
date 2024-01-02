package com.itwillbs.controller;


import com.itwillbs.domain.CrewLikeDTO;
import com.itwillbs.domain.CrewReplyDTO;
import com.itwillbs.service.CrewLikeService;
import com.itwillbs.service.CrewReplyService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
public class CrewReplyController {
	
	@Inject
	private CrewReplyService crewReplyService;
	@Inject
	private CrewLikeService crewLikeService;
	
	// http://localhost:8080/myweb/crew/$%7BpageContext.request.contextPath%7D/reply/delete 
	// http://localhost:8080/myweb/crew/reply/list
	
	
	// 댓글 리스트 가져오기
	@RequestMapping(value = "/reply/list", method = RequestMethod.GET)
	public ResponseEntity<List<CrewReplyDTO>> replylist(@RequestParam String crewNum, HttpServletRequest request) {
		
		int num = Integer.parseInt(crewNum);
		// 댓글 가져오기
		List<CrewReplyDTO> crewReplyList = crewReplyService.getCrewReplyList(num);


		// ResponseEntity에 출력 결과를 담아서 리턴
		ResponseEntity<List<CrewReplyDTO>> entity = new ResponseEntity<List<CrewReplyDTO>>(crewReplyList, HttpStatus.OK);
		
		
		return entity;
	}

	
	// 부모 댓글 작성
	@RequestMapping(value = "/reply/write", method = RequestMethod.POST)
	public ResponseEntity<CrewReplyDTO> replywrite(@RequestBody CrewReplyDTO crewReplyDTO, HttpSession session) {
		
		System.out.println("댓글쓰기" + crewReplyDTO);
		
		String userId = (String)session.getAttribute("userId");
		
		int crParent = 0;	
		int crdepth = 1;
		int crOrder = 1;
		
		crewReplyDTO.setCrParent(crParent);
		crewReplyDTO.setCrDepth(crdepth);
		crewReplyDTO.setCrOrder(crOrder);
		
		crewReplyDTO.setUserId(userId);
		
		System.out.println("replywrite()");
		System.out.println(crewReplyDTO);
		
		crewReplyService.insertReply(crewReplyDTO);
	
		return null;
	} //
	
	
	// 자식 댓글 작성 (대댓글)
	@RequestMapping(value = "/reply/rewrite", method = RequestMethod.POST)
	public ResponseEntity<CrewReplyDTO> rereplywrite(@RequestBody CrewReplyDTO crewReplyDTO, HttpSession session) {
		
		System.out.println("대댓글쓰기" + crewReplyDTO);
		
		String userId = (String)session.getAttribute("userId");
		
		// 부모 댓글 번호 받아오기
		
		int crParent = crewReplyDTO.getCrParent();	
		int crdepth = 2;
		int crOrder = 2;
		
		crewReplyDTO.setCrParent(crParent);
		crewReplyDTO.setCrDepth(crdepth);
		crewReplyDTO.setCrOrder(crOrder);
		
		crewReplyDTO.setUserId(userId);
		
		System.out.println("replywrite()");
		System.out.println(crewReplyDTO);
		
		crewReplyService.insertReReply(crewReplyDTO);
	
		return null;
	} //
	
	
	// 댓글 수정
	@RequestMapping(value = "/reply/update", method = RequestMethod.POST)
	public ResponseEntity<CrewReplyDTO> replyupdate(@RequestBody CrewReplyDTO crewReplyDTO) {
		System.out.println("replyupdate()");
		System.out.println("댓글수정" + crewReplyDTO);
		

		crewReplyService.updateReply(crewReplyDTO);
	
		return null;
	} //
	
	
	// 부모 댓글 삭제 (dto) => 바꾼 이유. 부모댓, 자식댓 삭제하는 거 분리하기 위해서!
	//					 => 그냥 dto 객체 생성해서 넘기는 게 나았나?
	@RequestMapping(value = "/reply/delete", method = RequestMethod.POST)
	public ResponseEntity<CrewReplyDTO> deleteReply(@RequestBody CrewReplyDTO crewReplyDTO) {
		System.out.println(crewReplyDTO.getCrNum() +"번 부모 댓글 삭제하러 감다");
		int num = crewReplyDTO.getCrNum();

		System.out.println(crewReplyDTO);
		
		crewReplyService.deleteReply(crewReplyDTO);

		return null;
		
	}
	
	// 자식 댓글 삭제
	@RequestMapping(value = "/reply/redelete", method = RequestMethod.POST)
	public ResponseEntity<CrewReplyDTO> deleteReReply(@RequestBody CrewReplyDTO crewReplyDTO) {
		System.out.println(crewReplyDTO.getCrNum() +"번 자식 댓글 삭제하러 감다");
		System.out.println(crewReplyDTO);
		
		crewReplyService.deleteReReply(crewReplyDTO);

		return null;
		
	}


	// ~ ~ ~ 좋아요 ~ ~ ~	
	
	
	// 좋아요 insert (필요: 유저아이디, 게시글 번호)
	// db에 데이터가 들어있는지 확인하고 있으면 => clCheck+1 update
	//							 없으면 => insert
	// 좋아요 
	@RequestMapping(value = "/like/add", method = RequestMethod.POST)
	public ResponseEntity<CrewLikeDTO> like(@RequestBody CrewLikeDTO crewLikeDTO, HttpSession session) {
		
		System.out.println("like 좋아요 클릭" + crewLikeDTO);
		
		// 유저 아이디
		String userId = (String)session.getAttribute("userId");		
		crewLikeDTO.setUserId(userId);
		
		System.out.println("유저아이디" + userId);
		
		// 게시글 번호
		System.out.println(crewLikeDTO.getCrewNum() +"번 게시글 좋아요 ♡");
		int num = crewLikeDTO.getCrewNum();
				
		crewLikeService.insertLike(crewLikeDTO);
		
		return null;
	} //
	
	
	
	// 좋아요 취소 update
	@RequestMapping(value = "/like/sub", method = RequestMethod.POST)
	public ResponseEntity<CrewLikeDTO> likecancle(@RequestBody CrewLikeDTO crewLikeDTO, HttpSession session) {
		
		// 유저 아이디
		String userId = (String)session.getAttribute("userId");		
		crewLikeDTO.setUserId(userId);
		
		// 게시글 번호
		System.out.println(crewLikeDTO.getCrewNum() +"번 게시글 좋아요 취소!");
		int num = crewLikeDTO.getCrewNum();

		System.out.println("crewLikeDTO: " + crewLikeDTO);
		
		crewLikeService.deleteLike(crewLikeDTO);

		return null;
		
	}
	
	
}
