package com.itwillbs.controller;

import com.itwillbs.domain.PhotoLikeDTO;
import com.itwillbs.domain.PhotoReplyDTO;
import com.itwillbs.service.PhotoLikeService;
import com.itwillbs.service.PhotoReplyService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
public class PhotoAjaxController {
	
	@Inject
	private PhotoReplyService photoReplyService;
	@Inject
	private PhotoLikeService photoLikeService;
	
	// 댓글 리스트 가져오기
	@RequestMapping(value = "/photoreply/list", method = RequestMethod.GET)
	public ResponseEntity<List<PhotoReplyDTO>> replylist(@RequestParam String photoNum, HttpServletRequest request) {
		
		int num = Integer.parseInt(photoNum);
		// 댓글 가져오기
		List<PhotoReplyDTO> photoReplyList = photoReplyService.getPhotoReplyList(num);

		// ResponseEntity에 출력 결과를 담아서 리턴
		ResponseEntity<List<PhotoReplyDTO>> entity = new ResponseEntity<List<PhotoReplyDTO>>(photoReplyList, HttpStatus.OK);
		
		
		return entity;
	}

	
	// 부모 댓글 작성
	@RequestMapping(value = "/photoreply/write", method = RequestMethod.POST)
	public void replywrite(@RequestBody PhotoReplyDTO photoReplyDTO, HttpSession session) {
		
		String userId = (String)session.getAttribute("userId");
		
		int prParent = 0;	
		int prDepth = 1;
		int prOrder = 1;
		
		photoReplyDTO.setPrParent(prParent);
		photoReplyDTO.setPrDepth(prDepth);
		photoReplyDTO.setPrOrder(prOrder);
		
		photoReplyDTO.setUserId(userId);

		
		photoReplyService.insertReply(photoReplyDTO);
	} //
	
	
	// 자식 댓글 작성 (대댓글)
	@RequestMapping(value = "/photoreply/rewrite", method = RequestMethod.POST)
	public void rereplywrite(@RequestBody PhotoReplyDTO photoReplyDTO, HttpSession session) {
		
		String userId = (String)session.getAttribute("userId");
		
		// 부모 댓글 번호 받아오기
		
		int prParent = photoReplyDTO.getPrParent();	
		int prDepth = 2;
		int prOrder = 2;
		
		photoReplyDTO.setPrParent(prParent);
		photoReplyDTO.setPrDepth(prDepth);
		photoReplyDTO.setPrOrder(prOrder);
		
		photoReplyDTO.setUserId(userId);

		photoReplyService.insertReReply(photoReplyDTO);

	} //
	
	
	// 댓글 수정
	@RequestMapping(value = "/photoreply/update", method = RequestMethod.POST)
	public void replyupdate(@RequestBody PhotoReplyDTO photoReplyDTO) {

		photoReplyService.updateReply(photoReplyDTO);

	} //
	
	
	// 부모 댓글 삭제 (dto) => 바꾼 이유. 부모댓, 자식댓 삭제하는 거 분리하기 위해서!
	//					 => 그냥 dto 객체 생성해서 넘기는 게 나았나?
	@RequestMapping(value = "/photoreply/delete", method = RequestMethod.POST)
	public void deleteReply(@RequestBody PhotoReplyDTO photoReplyDTO) {

		photoReplyService.deleteReply(photoReplyDTO);
	}
	
	// 자식 댓글 삭제
	@RequestMapping(value = "/photoreply/redelete", method = RequestMethod.POST)
	public void deleteReReply(@RequestBody PhotoReplyDTO photoReplyDTO) {

		photoReplyService.deleteReReply(photoReplyDTO);

	}


	// ~ ~ ~ 좋아요 ~ ~ ~	
	
	
	// 좋아요 insert (필요: 유저아이디, 게시글 번호)
	// db에 데이터가 들어있는지 확인하고 있으면 => plCheck+1 update
	//							없으면 => insert
	// 좋아요 
	@RequestMapping(value = "/photolike/add", method = RequestMethod.POST)
	public void like(@RequestBody PhotoLikeDTO photoLikeDTO, HttpSession session) {

		// 유저 아이디
		String userId = (String)session.getAttribute("userId");		
		photoLikeDTO.setUserId(userId);

		photoLikeService.insertLike(photoLikeDTO);

	} //
	
	
	
	// 좋아요 취소 update
	@RequestMapping(value = "/photolike/sub", method = RequestMethod.POST)
	public void likecancle(@RequestBody PhotoLikeDTO photoLikeDTO, HttpSession session) {
		
		// 유저 아이디
		String userId = (String)session.getAttribute("userId");		
		photoLikeDTO.setUserId(userId);
		
		photoLikeService.deleteLike(photoLikeDTO);

		
	}
	
	
}
