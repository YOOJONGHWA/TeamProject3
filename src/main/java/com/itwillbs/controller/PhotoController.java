package com.itwillbs.controller;

import com.itwillbs.domain.PhotoDTO;
import com.itwillbs.domain.PhotoPageDTO;
import com.itwillbs.service.PhotoLikeService;
import com.itwillbs.service.PhotoService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.*;

@Controller
public class PhotoController {
	
	@Inject
	private PhotoService photoService;
	@Inject
	private PhotoLikeService photoLikeService;

	// xml 업로드 경로 (자원 이름) => 변수 저장
	@Resource(name="uploadPath3")
	private String uploadPath3;

	// 글 리스트 불러오기
	@RequestMapping(value = "/photo/list", method = RequestMethod.GET)
	public String photo(Model model, HttpServletRequest request) {

		// 한 화면에 보여줄 글 개수 설정(10개 설정)
		int pageSize = 9;
		String pageNum=request.getParameter("pageNum");
		String photoLocation = request.getParameter("loc");
		
		// pageNum이 없을 때 1로 설정
		if(pageNum==null) pageNum="1";

		// 현 페이지 번호 파라미터값 가져오기
		// pageNum => 정수형 currentPage
		int currentPage=Integer.parseInt(pageNum);
		
		// pageDTO 객체생성
		PhotoPageDTO pageDTO=new PhotoPageDTO();
		
		// set 메서드호출
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		
		// 액티비티 카테고리
		pageDTO.setPhotoLocation(photoLocation);
		
		// 디비작업 메서드 호출
		List<PhotoDTO> photoList = photoService.getPhotoList(pageDTO);
		
		// 페이징 작업
		int count = photoService.getPhotoCount();
		int pageBlock = 10;
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+pageBlock-1;
		int pageCount = count/pageSize + (count%pageSize==0 ? 0 : 1);
		if(endPage > pageCount) endPage = pageCount;
		
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		// 체험 지역
		List<String> cityList = new ArrayList<String>();
		cityList.add("북구"); cityList.add("사상구"); cityList.add("진구"); cityList.add("동래구");
		cityList.add("연제구"); cityList.add("수영구"); cityList.add("해운대구"); cityList.add("기장군");

		// 담기
		model.addAttribute("cityList", cityList);
		
		// model 담아서 감
		model.addAttribute("photoList", photoList);
		model.addAttribute("pageDTO", pageDTO);

		// 기본 이동방식: 주소변경 없이 이동
		return "photo/photoList";
	}
	
	// 글쓰기 페이지로
	@RequestMapping(value = "/photo/write", method = RequestMethod.GET)
	public String write(Locale locale, Model model) {
		
		// 체험 지역
		List<String> cityList = new ArrayList<String>();
		cityList.add("북구"); cityList.add("사상구"); cityList.add("진구"); cityList.add("동래구");
		cityList.add("연제구"); cityList.add("수영구"); cityList.add("해운대구"); cityList.add("기장군");

		// 담기
		model.addAttribute("cityList", cityList);
		
		// 기본 이동방식: 주소변경 없이 이동
		return "photo/photoWrite";
	}
	
	
	// 글쓰기 작업
	@RequestMapping(value = "/photo/writePro", method = RequestMethod.POST)
	public String writePro(HttpServletRequest request, MultipartFile file) throws Exception {

		UUID uuid = UUID.randomUUID();
		String filename=uuid.toString() + "_" + file.getOriginalFilename();

		FileCopyUtils.copy(file.getBytes(), new File(uploadPath3, filename));

		// 글쓰기 메서드 호출()
		PhotoDTO photoDTO = new PhotoDTO();
		photoDTO.setPhotoLocation(request.getParameter("photoLocation"));
		photoDTO.setUserId(request.getParameter("userId"));
		photoDTO.setPhotoContent(request.getParameter("photoContent"));
		photoDTO.setPhotoImage(filename);
		
		photoService.insertPhoto(photoDTO);
		
		// 이동방식: 주소변경 하면서 이동
		return "redirect:/photo/list";
	} 

	
	// 글 내용 보기
	@RequestMapping(value = "/photo/content", method = RequestMethod.GET)
	public String content(HttpServletRequest request, Model model, HttpSession session) {
		
		// photo/content?num=2
		int photoNum=Integer.parseInt(request.getParameter("num"));
		
		// 세션 아이디
		String userId = (String)session.getAttribute("userId");
		
		Map<String, Object> photoMap = new HashMap<>();
		photoMap.put("photoNum", photoNum);
		photoMap.put("userId", userId);
		
		try {
			Map<String, Object> likeCheckMap = photoLikeService.likeCheck(photoMap);
			
			if(likeCheckMap == null) {
				model.addAttribute("plCheck", 0);
			}else {
				model.addAttribute("plCheck", likeCheckMap.get("plCheck"));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		
		// 조회수 증가
		photoService.updateReadcount(photoNum);
		
		// 글 가져오기 메서드 호출
		PhotoDTO photoDTO = photoService.getPhoto(photoNum);
		
		// model 데이터 담기
		model.addAttribute("photoDTO", photoDTO);
		
		// 기본 이동방식: 주소변경 없이 이동
		return "photo/photoContent";
	} // content()
	
	// 글 수정하기
	@RequestMapping(value = "/photo/update", method = RequestMethod.GET)
	public String update(HttpServletRequest request, Model model) {
		
		// 세션값 id에 대한 정보를 디비 조회
		int num=Integer.parseInt(request.getParameter("num"));
		
		// 체험 지역
		List<String> cityList = new ArrayList<String>();
		cityList.add("북구"); cityList.add("사상구"); cityList.add("진구"); cityList.add("동래구");
		cityList.add("연제구"); cityList.add("수영구"); cityList.add("해운대구"); cityList.add("기장군");
			
		// 담기
		model.addAttribute("cityList", cityList);
		
		PhotoDTO dto = photoService.getPhoto(num);
		model.addAttribute("dto", dto);
		
		// 기본 이동방식: 주소변경 없이 이동
		return "photo/photoUpdate";
	} // String update()
	
	@RequestMapping(value = "/photo/updatePro", method = RequestMethod.POST)
	public String updatePro(PhotoDTO photoDTO, MultipartFile file) throws Exception {

		UUID uuid = UUID.randomUUID();
		String filename=uuid.toString() + "_" + file.getOriginalFilename();

		FileCopyUtils.copy(file.getBytes(), new File(uploadPath3, filename));

		// 글쓰기 메서드 호출()
		photoDTO.setPhotoImage(filename);
		
		photoService.updatePhoto(photoDTO);
		
		// 이동방식: 주소변경 하면서 이동
		// response.sendRedirect() 이동
		return "redirect:/photo/list";
	} // String updatePro()
	
	// 글 삭제
	@RequestMapping(value = "/photo/delete", method = RequestMethod.GET)
	public String delete(HttpServletRequest request) {
		
		// 세션값 id에 대한 정보를 디비 조회
		int num = Integer.parseInt(request.getParameter("num"));
		photoService.deletePhoto(num);
	
		// 이동방식: 주소변경 하면서 이동
		// response.sendRedirect() 이동
		return "redirect:/photo/list";
	} // String delete()

}
