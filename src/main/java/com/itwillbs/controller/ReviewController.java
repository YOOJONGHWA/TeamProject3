package com.itwillbs.controller;

import com.google.gson.JsonObject;
import com.itwillbs.domain.RePageDTO;
import com.itwillbs.domain.ReplyDTO;
import com.itwillbs.domain.ReviewDTO;
import com.itwillbs.service.ReviewService;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;





@Controller
public class ReviewController {
	//자동으로 객체생성  부모=자식
	@Inject
	private ReviewService reviewService;
	
	
	// xml 업로드 경로 (자원이름)=> 변수 저장
		@Resource(name = "uploadPath4")
		private String uploadPath4;
	
		
	@RequestMapping(value = "/review/write", method = RequestMethod.GET)	
	public String write(HttpSession session, Model model) {
		//메서드 호출
		// dto  Model model(request) 담기
		// 기본 이동방식 : 주소변경 없이 이동 
		return "review/writeForm";
	}//
	
	
	@RequestMapping(value = "/review/writePro", method = RequestMethod.POST)	
	public String writePro(ReviewDTO dto, HttpServletRequest request, MultipartFile file) throws Exception {
		UUID uuid = UUID.randomUUID();
//		String filename = uuid.toString() + "_" + file.getOriginalFilename();
		System.out.println(dto.toString());
		// 원본 파일 복사 => upload 복사
//		FileCopyUtils.copy(원본, 복사해서 새롭게 파일 만들기);
//		FileCopyUtils.copy(file.getBytes(), new File(경로, 파일이름));
//		FileCopyUtils.copy(file.getBytes(), new File(uploadPath4, filename));
		
		// BoardDTO 객체생성 <= 저장
		ReviewDTO reviewDTO = new ReviewDTO();
		reviewDTO.setUserId(request.getParameter("userId"));
		reviewDTO.setReviewScore(Double.parseDouble(request.getParameter("reviewScore")));
		reviewDTO.setReviewTitle(request.getParameter("reviewTitle"));
		reviewDTO.setReviewContext(request.getParameter("reviewContext"));
//		reviewDTO.setReviewFile(filename);
		reviewDTO.setActNum(Integer.parseInt(request.getParameter("actNum")));
		reviewDTO.setActCategory(request.getParameter("actCategory"));
		
		
		
		// insertBoard(boardDTO) 메서드 호출
		reviewService.insertReview(reviewDTO);
		return "redirect:/review/list";
	}//
	
	@RequestMapping(value = "/review/list", method = RequestMethod.GET)	
	public String list(Model model, HttpServletRequest request, HttpSession session) {
		// http://localhost:8080/myweb/board/list
		// http://localhost:8080/myweb/board/list?pageNum=2
		// 한 화면에 보여줄 글 개수 설정 (10개 설정)
		
		String an=request.getParameter("actNum");
		if(an == null) {
			an="0";
		}
		int actNum=Integer.parseInt(an);
		int pageSize=5;
		// 현 페이지 번호 파라미터값 가져오기
		String pageNum=request.getParameter("pageNum");
		// 페이지 번호가 없으면 => "1" 설정
		if(pageNum==null){
		 	pageNum="1";
		}
		// pageNum => 정수형 currentPage
		int currentPage=Integer.parseInt(pageNum);
		// PageDTO 객체생성
		RePageDTO dto=new RePageDTO();
		// set 메서드 호출
		dto.setPageSize(pageSize);
		dto.setPageNum(pageNum);
		dto.setCurrentPage(currentPage);
		dto.setActNum(actNum);
		// 디비작업 메서드 호출
		// List<BoardDTO> 리턴할형 getBoardList(PageDTO dto) 메서드 정의
		// List<BoardDTO> boardList =dao.getBoardList(dto);
		List<ReviewDTO> reviewList=reviewService.getReviewList(dto);
		//페이징 작업
		// 전체 게시판 글의 개수 가져오기
		// // select count(*) from board
		int count = reviewService.getReviewCount();
	      int pageBlock=5; 
	      int startPage=(currentPage-1)/pageBlock*pageBlock+1;
	      int endPage=startPage+pageBlock-1;
	      int pageCount = count/pageSize
	                +(count%pageSize==0 ? 0 : 1);
	      if(endPage > pageCount){
	         endPage=pageCount;
	      }
	      
	      dto.setCount(count);
	      dto.setPageBlock(pageBlock);
	      dto.setStartPage(startPage);
	      dto.setEndPage(endPage);
	      dto.setPageCount(pageCount);
	      
//	      for(int i=0; i<reviewList.size(); i++) {
//	    	  System.out.println(reviewList.get(i).getUserId());
//	      }
	      
	      model.addAttribute("reviewList", reviewList);
	      model.addAttribute("RePageDTO", dto);
	      return "review/list";
	      
	      
	}//

	
	@RequestMapping(value = "/review/content", method = RequestMethod.GET)	
	public String content(HttpServletRequest request,Model model) throws Exception {
		ReplyDTO boardDTO = new ReplyDTO();
		System.out.println(boardDTO.toString()); 
		
		// /board/content?num2
		int review_Num = Integer.parseInt(request.getParameter("review_Num"));
		// 조회수 증가
		reviewService.updateReadcount(review_Num);
		// 글가져오기 메서드 호출
		ReviewDTO ReviewDTO = reviewService.getReview(review_Num);
		//model 데이터 담기
		model.addAttribute("ReviewDTO", ReviewDTO);
		
		// 조회수 증가
		
		int pageSize=15;
		//페이지 번호 가져오기
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		int currentPage=Integer.parseInt(pageNum);
		RePageDTO pageDTO=new RePageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setReview_Num(review_Num);
		
		List<ReplyDTO> boardList=reviewService.getBoardList(pageDTO);
		
		int count=reviewService.getBoardCount();
		
		int pageBlock=10; 
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount = count/pageSize+(count%pageSize==0 ? 0 : 1);
		if(endPage > pageCount){
	 	   endPage=pageCount;
	    }
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		pageDTO.setReview_Num(review_Num);
		
		//데이터 담기
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageDTO", pageDTO);
		// 기본 이동방식 : 주소변경 없이 이동 
//		return "redirect:/review/content";
		return "review/content";
		
	}//
	
	@RequestMapping(value = "/review/update", method = RequestMethod.GET)
	public String update(HttpServletRequest request, Model model) {
		int num = Integer.parseInt(request.getParameter("num"));
		ReviewDTO dto = reviewService.getReview(num);
		System.out.println(dto.toString());

		model.addAttribute("dto", dto);
		return "review/updateForm";
	}
	
	@RequestMapping(value = "/review/updatePro", method = RequestMethod.POST)
	public String updatePro(ReviewDTO dto) {
		reviewService.updateReview(dto);
		
		return "redirect:/review/list";
	}
	
	@RequestMapping(value = "/review/delete", method = RequestMethod.GET)
	public String delete(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		reviewService.deleteReview(num);
		
		return "redirect:/review/list";
	}
	
	@RequestMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		JsonObject jsonObject = new JsonObject();
		
      
//		String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.		 
		
		// 내부경로로 저장
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot = contextRoot+"resources/fileupload/";
		
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/summernote/resources/fileupload/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
	}
	
	@RequestMapping(value = "/review/mypage", method = RequestMethod.GET)	
	public String mypage(HttpSession session, Model model) {
		//메서드 호출
		// dto  Model model(request) 담기
		// 기본 이동방식 : 주소변경 없이 이동 
		return "review/mypage";
	}//
	
	
	@RequestMapping(value = "/board/rewritePro", method = RequestMethod.POST)	
	public String rewritePro(ReplyDTO replyDTO, HttpServletRequest request, Model model) {
		System.out.println("/board/rewritePro");
		System.out.println(replyDTO.toString()); 	
		// /board/content?num2
//		int num = Integer.parseInt(request.getParameter("num"));
//		replyDTO = reviewService.getBoard(num);
//		//model 데이터 담기
//		model.addAttribute("replyDTO", replyDTO);
		
		int review_Num = Integer.parseInt(request.getParameter("review_Num"));
		ReviewDTO ReviewDTO = reviewService.getReview(review_Num);
		//model 데이터 담기
		model.addAttribute("ReviewDTO", ReviewDTO);
		reviewService.insertBoard(replyDTO);
		
		//화면에 보여줄 글개수 
		int pageSize=15;
		//페이지 번호 가져오기
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		int currentPage=Integer.parseInt(pageNum);
		RePageDTO pageDTO=new RePageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setReview_Num(review_Num);
		
		List<ReplyDTO> boardList=reviewService.getBoardList(pageDTO);
		
		int count=reviewService.getBoardCount();
		
		int pageBlock=10; 
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount = count/pageSize+(count%pageSize==0 ? 0 : 1);
		if(endPage > pageCount){
	 	   endPage=pageCount;
	    }
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		pageDTO.setReview_Num(review_Num);
		
		//데이터 담기
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageDTO", pageDTO);
		// 기본 이동방식 : 주소변경 없이 이동 
//		return "redirect:/review/content";
		return "review/content";
	}//
	
	@RequestMapping(value = "/board/relist", method = RequestMethod.GET)	
	public String relist(HttpServletRequest request,Model model) {
		//화면에 보여줄 글개수 
		int pageSize=5;
		//페이지 번호 가져오기
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		int currentPage=Integer.parseInt(pageNum);
		RePageDTO pageDTO=new RePageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		
		
		List<ReplyDTO> boardList=reviewService.getBoardList(pageDTO);
		
		int count=reviewService.getBoardCount();
		
		int pageBlock=10; 
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount = count/pageSize+(count%pageSize==0 ? 0 : 1);
		if(endPage > pageCount){
	 	   endPage=pageCount;
	    }
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		//데이터 담기
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageDTO", pageDTO);
		
		// 기본 이동방식 : 주소변경 없이 이동 
		return "center/notice";
	}//
	
	
	@RequestMapping(value = "/board/recontent", method = RequestMethod.GET)	
	public String recontent(HttpServletRequest request,Model model) {
		int num=Integer.parseInt(request.getParameter("replyNum"));
		
		ReplyDTO dto=reviewService.getBoard(num);
		
		model.addAttribute("dto", dto);
		
		// 기본 이동방식 : 주소변경 없이 이동 
		return "center/content";
	}//
	
	
	@RequestMapping(value = "/board/reupdate", method = RequestMethod.GET)	
	public String reupdate(HttpServletRequest request,Model model) {
		
//		int review_Num = Integer.parseInt(request.getParameter("review_Num"));
////		// 조회수 증가
//////		reviewService.updateReadcount(review_Num);
////		// 글가져오기 메서드 호출
//		ReviewDTO dto = reviewService.getReview(review_Num);
////		//model 데이터 담기
//		model.addAttribute("dto", dto);
		
		int num=Integer.parseInt(request.getParameter("num"));
		
		ReplyDTO dto=reviewService.getBoard(num);
		
		model.addAttribute("dto", dto);
		
		// 기본 이동방식 : 주소변경 없이 이동 
		return "review/replyupdate";
	}//
	
	@RequestMapping(value = "/board/reupdatePro", method = RequestMethod.POST)	
	public String reupdatePro(ReplyDTO replyDTO, HttpServletRequest request,Model model) {
	
	int review_Num = Integer.parseInt(request.getParameter("review_Num"));
	ReviewDTO ReviewDTO = reviewService.getReview(review_Num);
	model.addAttribute("ReviewDTO", ReviewDTO);
	reviewService.updateBoard(replyDTO);
		
		int pageSize=15;
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		int currentPage=Integer.parseInt(pageNum);
		RePageDTO pageDTO=new RePageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setReview_Num(review_Num);
		
		List<ReplyDTO> boardList=reviewService.getBoardList(pageDTO);
		
		int count=reviewService.getBoardCount();
		
		int pageBlock=10; 
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount = count/pageSize+(count%pageSize==0 ? 0 : 1);
		if(endPage > pageCount){
	 	   endPage=pageCount;
	    }
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		pageDTO.setReview_Num(review_Num);
		
		//데이터 담기
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageDTO", pageDTO);
		return "review/content";
	}//
	
	@RequestMapping(value = "/board/redelete", method = RequestMethod.GET)	
	public String redelete(HttpServletRequest request, Model model) {
		
		int review_Num = Integer.parseInt(request.getParameter("review_Num"));
		ReviewDTO ReviewDTO = reviewService.getReview(review_Num);
		model.addAttribute("ReviewDTO", ReviewDTO);
		
		
		ReplyDTO replyDTO = new ReplyDTO();
		replyDTO.setReviewNum(Integer.parseInt(request.getParameter("review_Num")));
		replyDTO.setReplyNum(Integer.parseInt(request.getParameter("num")));
		
		reviewService.deleteBoard(replyDTO);
		
		
		int pageSize=5;
		//페이지 번호 가져오기
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		int currentPage=Integer.parseInt(pageNum);
		RePageDTO pageDTO=new RePageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setReview_Num(review_Num);
		
		List<ReplyDTO> boardList=reviewService.getBoardList(pageDTO);
		
		int count=reviewService.getBoardCount();
		
		int pageBlock=10; 
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount = count/pageSize+(count%pageSize==0 ? 0 : 1);
		if(endPage > pageCount){
	 	   endPage=pageCount;
	    }
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		//데이터 담기
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageDTO", pageDTO);
		
		
		return "review/content";
	}//
	
	@RequestMapping(value = "/board/rerewrite", method = RequestMethod.GET)	
	public String rerewrite(ReplyDTO replyDTO, Model model, HttpServletRequest request) {
		int review_Num = Integer.parseInt(request.getParameter("review_Num"));
		ReviewDTO ReviewDTO = reviewService.getReview(review_Num);
		model.addAttribute("ReviewDTO", ReviewDTO);
		
		System.out.println("rerewrite");
		System.out.println(replyDTO.getReplyNum());
		replyDTO=reviewService.getBoard(replyDTO.getReplyNum());
		model.addAttribute("replyDTO", replyDTO);
		
		// 기본 이동방식 : 주소변경 없이 이동 
		return "review/rewriteForm";
	}//
	
	@RequestMapping(value = "/board/rerewritePro", method = RequestMethod.POST)	
	public String rerewritePro(ReplyDTO replyDTO,HttpServletRequest request, Model model) {
		System.out.println("/board/rerewritePro");
		System.out.println(replyDTO.toString());
	
		reviewService.reinsertBoard(replyDTO);

		
		int review_Num = Integer.parseInt(request.getParameter("review_Num"));
		ReviewDTO ReviewDTO = reviewService.getReview(review_Num);
		model.addAttribute("ReviewDTO", ReviewDTO);
		int pageSize=5;
		//페이지 번호 가져오기
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		int currentPage=Integer.parseInt(pageNum);
		RePageDTO pageDTO=new RePageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setReview_Num(review_Num);
		
		List<ReplyDTO> boardList=reviewService.getBoardList(pageDTO);
		
		int count=reviewService.getBoardCount();
		
		int pageBlock=10; 
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount = count/pageSize+(count%pageSize==0 ? 0 : 1);
		if(endPage > pageCount){
	 	   endPage=pageCount;
	    }
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		pageDTO.setReview_Num(review_Num);
		
		//데이터 담기
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageDTO", pageDTO);
		
				
				
		return "review/content";
//		return "redirect:/board/relist";
	}//
	
	
}//