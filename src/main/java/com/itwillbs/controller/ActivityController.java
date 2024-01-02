package com.itwillbs.controller;

import com.itwillbs.dao.ActivityDAO;
import com.itwillbs.dao.CategoriesDAO;
import com.itwillbs.domain.*;
import com.itwillbs.service.ActImgService;
import com.itwillbs.service.ActivityService;
import com.itwillbs.service.WishListService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;
import java.util.UUID;

@Controller
public class ActivityController {
	
	@Inject
	private ActivityService activityService;
	
	@Inject
	private ActImgService actImgService;
	
	@Inject // 부모=자식 객체생성
	private ActivityDAO activityDao;
	
	@Inject // 부모=자식 객체생성
	private CategoriesDAO categoriesDao;
	
	@Inject
	private WishListService wishListService;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@Resource(name="uploadPath2")
	private String uploadPath2;
	
	@RequestMapping(value = "/activity/write", method = RequestMethod.GET)
	public String write(Model model) {
		
		List<CategoriesDTO> categoryList= categoriesDao.getCategoryList();
		
		model.addAttribute("categoryList", categoryList);
		return "activity/actWriteForm";
	}
	
//	List<MultipartFile> files = new ArrayList<MultipartFile>();
	ActImgDTO actImgDto=new ActImgDTO();
	UUID uuid=UUID.randomUUID();
	
	
	@RequestMapping(value = "/activity/writePro", method = RequestMethod.POST)
	public String writePro(ActivityDTO activityDto, MultipartHttpServletRequest req, HttpServletRequest request) throws Exception {
		
		if(activityDto.getActReservation() == null) {
			activityDto.setActReservation("N");
		}
		
		if(activityDto.getActParking() == null) {
			activityDto.setActParking("N");
		}
		
		String dayoff=activityDto.getActDayoff();
		String[] dayoffs=dayoff.split(",");
		String week="매월 ";
		String day="";
		if(dayoffs[0].equals("매주")) {
			activityDto.setActDayoff(dayoff.replaceFirst(","," "));
		} 
		if(!dayoffs[0].equals("연중무휴")&&!dayoffs[0].equals("매주")) {
			for(String str:dayoffs) {
				switch (str) {
				case "첫번째": case "두번째": case "세번째": case "네번째": 
					week+=str+",";  
					break;
				
				default: day+=str+","; break;
				}
			};
			activityDto.setActDayoff(week.substring(0,week.lastIndexOf(","))+" "+day.substring(1,day.lastIndexOf(",")));
		}
		
		if(dayoffs[0].equals("연중무휴")) {
			activityDto.setActDayoff("연중무휴");
		}
		
		
		String optime=activityDto.getActOperationTime();
		String[] optimes=optime.split(",");
		String opt="";
		String opt2="";
		for(int i=0; i<optimes.length; i++) {
			opt2=optimes[i];
			if(opt2.length()==1) {
				opt+=0;
			} 
			opt+=optimes[i];
			switch (i) {
			case 1: case 3: case 6: case 8:
				opt+=":"; 
				break;
			case 2: case 7: 
				opt+="~"; 
				break;
			case 0: case 4: case 5: 
				opt+=" "; 
				break;
			}
		};
		
		if(optime.substring(0,2).equals("24")) {
			activityDto.setActOperationTime("24시간영업");
		} else {
			activityDto.setActOperationTime(opt);
		}
		
		MultipartFile file;
		String fileName=null;
		
		int actNum=1;
		if(activityDao.getMaxNum()!=null) {
			actNum=(activityDao.getMaxNum()+1);
		}
		
		for(int i=1; i<=6; i++) {
			file=req.getFile("files"+i);
			fileName=file.getOriginalFilename();
			actImgDto.setImgNum(i);
			if(fileName!="") {
				uuid=UUID.randomUUID();
				actImgDto.setActNum(actNum);
				actImgDto.setImgName(fileName);
				
				fileName=uuid.toString()+"_"+file.getOriginalFilename();
				actImgDto.setImgNameKey(fileName);
				
				FileCopyUtils.copy(file.getBytes(),new File(uploadPath, fileName));
				FileCopyUtils.copy(file.getBytes(),new File(uploadPath2, fileName));
				actImgService.insertActImg(actImgDto);
				fileName="";
			}
		};
		
		activityService.insertActivity(activityDto);
		
		return "redirect:/activity/list";
	}
	
	@RequestMapping(value = "/activity/list", method = RequestMethod.GET)
	public String list(Model model, HttpServletRequest request) throws Exception {
		int pageSize=9;
		String pageNum=request.getParameter("pageNum");
		String scKeyword = request.getParameter("keyword");
		String scType = request.getParameter("scType");
		String sessionId = request.getParameter("sessionId");
//		String[] scCategory = request.getParameter("category").split(",");
//		String[] scLocation = request.getParameter("location").split(",");
		
		System.out.println("keyword= " + scKeyword);
//		
		if(scType=="1") {
			scType="ACT_TITLE";
		} else {
			scType="COMPANY_NAME";
		}
		
//		if(scCategory.length==0) {
//			scCategory=null;
//		}
//		if(scLocation.length==0) {
//			scLocation=null;
//		}
		if(pageNum==null) {
			pageNum="1";
		}
		int currentPage=Integer.parseInt(pageNum);

		ActPageDTO actPageDto=new ActPageDTO();
		actPageDto.setPageSize(pageSize);
		actPageDto.setPageNum(pageNum);
		actPageDto.setCurrentPage(currentPage);
		
		actPageDto.setScType(scType);
		actPageDto.setScKeyword(scKeyword);
		actPageDto.setSessionId(sessionId);
//		actPageDto.setScCategory(scCategory);
//		actPageDto.setScLocation(scLocation);
		
		List<ActivityDTO> activityList = activityService.getActivityList(actPageDto);
		
		int count=activityService.getActivityCount(actPageDto);
		int pageBlock=5;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount = count/pageSize+(count%pageSize==0? 0 : 1);
		
		if(endPage > pageCount) {
			endPage=pageCount;
		}
		
		actPageDto.setCount(pageCount);
		actPageDto.setPageBlock(pageBlock);
		actPageDto.setStartPage(startPage);
		actPageDto.setEndPage(endPage);
		actPageDto.setPageCount(pageCount);
		
		List<CategoriesDTO> categoryList= categoriesDao.getCategoryList();
		List<ActivityDTO> activityLocation = activityService.getActivityLocation();
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("activityList", activityList);
		model.addAttribute("actPageDto", actPageDto);
		model.addAttribute("activityLocation", activityLocation);
		return "activity/actList";
	}
	
	@RequestMapping(value = "/activity/actContent", method = RequestMethod.GET)
	public String content(HttpServletRequest request, Model model) {
		int actNum=Integer.parseInt(request.getParameter("actNum"));
		ActivityDTO activityDto = activityService.getActivity(actNum);
		List<ActImgDTO> actImgList=actImgService.getActImgList(actNum);
		
		model.addAttribute("actImgList", actImgList);
		model.addAttribute("activityDto", activityDto);
		
		return "activity/actContent";
	}
	
	@RequestMapping(value = "/activity/update", method = RequestMethod.GET)
	public String update(HttpServletRequest request, Model model) {
		int actNum=Integer.parseInt(request.getParameter("actNum"));
		ActivityDTO activityDto = activityService.getActivity(actNum);
		List<ActImgDTO> actImgList=actImgService.getActImgList(actNum);
		List<CategoriesDTO> categoryList= categoriesDao.getCategoryList();
		String[] dayoffs=activityDto.getActDayoff().replace(" ", ",").split(",");
		
		model.addAttribute("dayoffs", dayoffs);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("activityDto", activityDto);
		model.addAttribute("actImgList", actImgList);
		return "activity/actUpdateForm";
	}
	
	@RequestMapping(value = "/activity/updatePro", method = RequestMethod.POST)
	public String updatePro(ActivityDTO activityDto, MultipartHttpServletRequest req, HttpServletRequest request) throws Exception{
		
		if(activityDto.getActReservation() == null) {
			activityDto.setActReservation("N");
		}
		
		if(activityDto.getActParking() == null) {
			activityDto.setActParking("N");
		}
		
		String dayoff=activityDto.getActDayoff();
		String[] dayoffs=dayoff.split(",");
		String week="매월 ";
		String day="";
		if(dayoffs[0].equals("매주")) {
			activityDto.setActDayoff(dayoff.replaceFirst(","," "));
		} 
		if(!dayoffs[0].equals("연중무휴")&&!dayoffs[0].equals("매주")) {
			for(String str:dayoffs) {
				switch (str) {
				case "첫번째": case "두번째": case "세번째": case "네번째": 
					week+=str+",";  
					break;
				
				default: day+=str+","; break;
				}
			};
			activityDto.setActDayoff(week.substring(0,week.lastIndexOf(","))+" "+day.substring(1,day.lastIndexOf(",")));
		}
		
		if(dayoffs[0].equals("연중무휴")) {
			activityDto.setActDayoff("연중무휴");
		}
		
		String optime=activityDto.getActOperationTime();
		String[] optimes=optime.split(",");
		String opt="";
		String opt2="";
		for(int i=0; i<optimes.length; i++) {
			opt2=optimes[i];
			if(opt2.length()==1) {
				opt+=0;
			} 
			opt+=optimes[i];
			switch (i) {
			case 1: case 3: case 6: case 8:
				opt+=":"; 
				break;
			case 2: case 7: 
				opt+="~"; 
				break;
			case 0: case 4: case 5: 
				opt+=" "; 
				break;
			}
		};
		
		if(optime.substring(0,2).equals("24")) {
			activityDto.setActOperationTime("24시간영업");
		} else {
			activityDto.setActOperationTime(opt);
		}
		
		ActImgDTO actImgDto=new ActImgDTO();
		MultipartFile file;
		String fileName="";
		String fileNameKey="";
		String savedImgKey="";
		String lb = "";
		String ogName="";
		int savedImgNum=0;
		
		int actNum=activityDto.getActNum();
		
		List<ActImgDTO> actImgList=actImgService.getActImgList(actNum);
		actImgDto.setActNum(actNum);
		
		for(int i=1; i<=6; i++) {
			file=req.getFile("files"+i);
			fileName=file.getOriginalFilename();
			actImgDto.setImgNum(i);
			lb=request.getParameter("lb"+i);
			ogName=request.getParameter("ogName"+i);
			
			
			if(!ogName.equals(lb) && fileName !="" && ogName!="" && i <=actImgList.size()) {
				
				savedImgKey=actImgList.get(i-1).getImgNameKey();
				actImgDto.setImgNameKey(savedImgKey);
				File deleteFile= new File(uploadPath+"\\"+savedImgKey);
				deleteFile.delete();
				
				fileNameKey=uuid.toString()+"_"+fileName;
				actImgDto.setImgNameKey(fileNameKey);
				actImgDto.setImgName(fileName);
				for(int j=0; j<actImgList.size(); j++) {
					if(i-1==j) {
						savedImgNum=actImgList.get(j).getImgNum();
					}
				}
				actImgDto.setImgNum(savedImgNum);
				
				FileCopyUtils.copy(file.getBytes(),new File(uploadPath, fileNameKey));
				FileCopyUtils.copy(file.getBytes(),new File(uploadPath2, fileNameKey));
				
				actImgService.updateActImg(actImgDto);
			}
			
			if(ogName.equals("") && fileName!="") {
				actImgDto.setImgName(fileName);
				
				fileNameKey=uuid.toString()+"_"+fileName;
				actImgDto.setImgNameKey(fileNameKey);
				
				FileCopyUtils.copy(file.getBytes(),new File(uploadPath, fileNameKey));
				FileCopyUtils.copy(file.getBytes(),new File(uploadPath2, fileNameKey));
				
				actImgService.insertActImg(actImgDto);
				fileName="";
			}
		};
		
		activityService.updateActivity(activityDto);
		return "redirect:/activity/list";
		
	}
	
	@RequestMapping(value = "/activity/delete", method = RequestMethod.GET)
	public String deleteActivity(ActivityDTO activityDto) {
		ActImgDTO actImgDto=new ActImgDTO();
		WishListDTO wishListDto=new WishListDTO();
		
		int actNum=activityDto.getActNum();
		
		actImgDto.setActNum(actNum);
		actImgDto.setImgNameKey("");
		wishListDto.setActNum(actNum);
		wishListDto.setUserId("");
		
		actImgService.deleteActImg(actImgDto);
		wishListService.deleteWishList(wishListDto);
		activityService.deleteActivity(activityDto);
		return "redirect:/activity/list";
	}
	
}
