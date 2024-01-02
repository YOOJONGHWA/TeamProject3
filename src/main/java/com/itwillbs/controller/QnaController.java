package com.itwillbs.controller;


import com.itwillbs.domain.QnaDTO;
import com.itwillbs.domain.QpPageDTO;
import com.itwillbs.service.QnaService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

//class A {
//	public void methodA() {}
//}
//class Person extends A {
//	String name;
//	public void method() {
//		methodA();
//	}
//}

//클라이언트로부터 서버로 요청이 들어오면 서버에서는 HttpServletRequest를 생성하고
//요청정보에 있는 경로로 매핑된 서블릿에게 전달합니다.
//이렇게 전달받은 내용들을 파라미터로 GET, POST형식으로 클라이언트에게 전달하게 됩니다.
//JSP에서 URL주소에 파라미터값을 합치고 서버에 보낸다고 가정합니다.

//이클립스에 com.itwillbs.board.action패키지랑 중첩됨

//th:href는 <a href>, <link href> 와 동일함 
//@를 붙여서 특정 url로 이동 OR 서버내 특정 위치로 이동하는 URL을 제공함

//<div>
//문서의 특정 영역이나 구획을 나눠 정의할 때 사용
//웹페이지의 레이아웃을 설정하거나, 자바스크립트로 특정 작업을 수행하기 위한 컨테이너로 사용 됨

@Controller
public class QnaController {					//CCCCCCCCCCCCC

		//자동으로 객체생성  부모=자식
		@Inject
		private QnaService qnaService;
		
		
		//글쓰기 요청 ==========================================
		@RequestMapping(value = "/qna/write", method = RequestMethod.GET)	
		public String write() {
			return "qna/writeForm";
		} //write
		
		
		//글쓰기 요청처리 ==========================================
		@RequestMapping(value = "/qna/writePro", method = RequestMethod.POST)	
		public String writePro(QnaDTO qnaDto) {
			qnaService.qnaInsert(qnaDto);
			return "redirect:/qna/list";
		} //writePro
		
		
		//글목록 ========================================== 이클립스 BoardList.java 내용이랑 비슷함
		@RequestMapping(value = "/qna/list", method = RequestMethod.GET)	
		public String list(HttpServletRequest request, Model model) {
			QpPageDTO pageDto = new QpPageDTO();
			
			String qpKeyWord = request.getParameter("qpKeyWord");		//############# 키워드 추가
			if (qpKeyWord == null) {		//############################### 키워드 추가
				pageDto.setQpKeyWord(qpKeyWord);
			} else {
				pageDto.setQpKeyWord("%" + qpKeyWord + "%");
			}
			
			
			int qpPageSize = 10;		//화면에 보여줄 글개수
			String qpPageNum = request.getParameter("qpPageNum");
			//원하는 데이터를 꺼낼때는 HttpServletRequest 객체 안에있는 getParameter()메소드를 이용하면됨
			//	=> 페이지 번호 가져오기 (getParameter의 문자열 반환타입)
			if(qpPageNum == null) {
				qpPageNum = "1";
			}
			int qpCurrentPage = Integer.parseInt(qpPageNum);
			
			pageDto.setQpPageSize(qpPageSize);
			pageDto.setQpPageNum(qpPageNum);
			pageDto.setQpCurrentPage(qpCurrentPage);
			
			List<QnaDTO> qnaList = qnaService.getQnaList(pageDto);
			
			int qpCount = qnaService.getQnaCount();
			int qpPageBlock = 10;			//페이지가 100페이지 넘어가도 10개만보이게
			int qpStartPage = (qpCurrentPage - 1) / qpPageBlock * qpPageBlock + 1;
			int qpEndPage = qpStartPage + qpPageBlock - 1;
			int qpPageCount = qpCount / qpPageSize + (qpCount % qpPageSize == 0 ? 0 : 1);
			if (qpEndPage > qpPageCount) {
				qpEndPage = qpPageCount;
			}
			
			// 글목록, 페이지 정보 => pageDto에 저장	  				by 이클립스
			pageDto.setQpCount(qpCount);
			pageDto.setQpPageBlock(qpPageBlock);
			pageDto.setQpStartPage(qpStartPage);
			pageDto.setQpEndPage(qpEndPage);
			pageDto.setQpPageCount(qpPageCount);
			
			// 이동정보 저장 => ./center/notice.jsp  			 by 이클립스
			model.addAttribute("qnaList", qnaList);
			model.addAttribute("pageDto", pageDto);
			return "qna/list";
		} //list
		
		
		//글내용 ==========================================
		@RequestMapping(value = "/qna/content", method = RequestMethod.GET)	
		public String content(HttpServletRequest request, Model model) {
			int qnaNum = Integer.parseInt(request.getParameter("qnaNum").trim());		//ㅇㅇ 
			qnaService.updateReadCount(qnaNum);												//list에는 왜 영향을 미치지??
			QnaDTO qnaDto = qnaService.getQna(qnaNum);									//ㅇㅇ 
			model.addAttribute("qnaDto", qnaDto);												//ㅇㅇ										
			return "qna/content";
		} //content
		
		
		//글수정 요청 ==========================================
		@RequestMapping(value = "/qna/update", method = RequestMethod.GET)	
		public String update(HttpServletRequest request, Model model) {
			int qnaNum = Integer.parseInt(request.getParameter("qnaNum"));			//ㅇㅇ
			QnaDTO qnaDto = qnaService.getQna(qnaNum);								//ㅇㅇ 
			model.addAttribute("qnaDto", qnaDto);											//ㅇㅇ
			return "qna/updateForm";
		} //update
		
		
		//글수정 요청처리 ========================================
		@RequestMapping(value = "/qna/updatePro", method = RequestMethod.POST)	
		public String updatePro(QnaDTO qnaDto) {
			qnaService.qnaUpdate(qnaDto);
			return "redirect:/qna/list";
		} //updatePro
		
		
		//글삭제 ==========================================
		@RequestMapping(value = "/qna/delete", method = RequestMethod.GET)	
		public String delete(HttpServletRequest request) {
			int qnaNum = Integer.parseInt(request.getParameter("qnaNum"));		//ㅇㅇ 
			qnaService.qnaDelete(qnaNum);												//ㅇㅇ 
			return "redirect:/qna/list";
		} //delete
		
		
		//답글쓰기 요청 ========================================== 수업
		@RequestMapping(value = "/qna/reWrite", method = RequestMethod.GET)
		public String reWrite(QnaDTO qnaDto, Model model) {
			qnaDto = qnaService.getQna(qnaDto.getQnaNum());
			model.addAttribute("qnaDto", qnaDto);
			return "qna/reWriteForm";
		} //
		
		
		//답글쓰기 요청처리 ==========================================
		@RequestMapping(value = "/qna/reWritePro", method = RequestMethod.POST)
		public String reWritePro(QnaDTO qnaDto, HttpServletRequest request) {
			qnaDto.setQnaRef(qnaDto.getQnaNum()); 
			
//			int qnaSecret = Integer.parseInt(request.getParameter("qnaSecret").trim());				//비밀글 코드추가 뭐지??
//			System.out.println(qnaSecret);
			
			qnaService.ReQnaInsert(qnaDto);		//메서드 호출
			return "redirect:/qna/list";
		} //
		
		
//		//답글쓰기 요청 ==========================================		\ㅇ0ㅇ/
//		@RequestMapping(value = "/qna/reWrite", method = RequestMethod.GET)
//		public String reWrite(HttpServletRequest request, Model model) {
//			int qnaNum = Integer.parseInt(request.getParameter("qnaNum"));		//ㅇㅇ 
//			QnaDTO qnaDto = qnaService.getQna(qnaNum);							//ㅇㅇ 
//			model.addAttribute("qnaDto", qnaDto);										//ㅇㅇ 
//			return "qna/reWriteForm";
//		} //reWrite
//		//답글쓰기 처리요청 =====================================			\ㅇ0ㅇ/
//		@RequestMapping(value = "/qna/reWritePro", method = RequestMethod.POST)
//		public String reWritePro(QnaDTO qnaDto) {		
//			qnaService.qnaInsert2(qnaDto);			
//			return "redirect:/qna/list";
//		} //reWritePro
		
		
		
		
}				//CCCCCCCCCCCCCCCCC
