package com.itwillbs.service;

import com.itwillbs.dao.ActImgDAO;
import com.itwillbs.dao.ActivityDAO;
import com.itwillbs.domain.ActImgDTO;
import com.itwillbs.domain.ActPageDTO;
import com.itwillbs.domain.ActivityDTO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.inject.Inject;
import java.io.File;
import java.util.List;

@Service
public class ActivityServiceImpl implements ActivityService{
	@Inject // 부모=자식 객체생성
	private ActivityDAO activityDao;
	
	@Inject // 부모=자식 객체생성
	private ActImgDAO actImgDao;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@Override
	public void insertActivity(ActivityDTO activityDto) throws Exception {
		
		if(activityDao.getMaxNum()==null) {
			activityDto.setActNum(1);
		} else {
			activityDto.setActNum(activityDao.getMaxNum()+1);
		}
		
		activityDao.insertActivity(activityDto);
	}
	
	@Override
	public List<ActivityDTO> getActivityList(ActPageDTO actPageDto) {
		int startRow=(actPageDto.getCurrentPage()-1)*actPageDto.getPageSize()+1;
		int endRow=startRow+actPageDto.getPageSize()-1;
		
		actPageDto.setStartRow(startRow-1);
		actPageDto.setEndRow(endRow);
		
		return activityDao.getActivityList(actPageDto);
	}

	@Override
	public ActivityDTO getActivity(int actNum) {
		return activityDao.getActivity(actNum);
	}

	@Override
	public Integer getActivityCount(ActPageDTO pageDto) {
		return activityDao.getActivityCount(pageDto);
	}

	@Override
	public void updateActivity(ActivityDTO activityDto) {
		activityDao.updateActivity(activityDto);
	}

	@Override
	public void deleteActivity(ActivityDTO activityDto) {
		List<ActImgDTO> actImgs=actImgDao.getActImgList(activityDto.getActNum());
		File file =null;
		for(int i=0; i<actImgs.size(); i++) {
			file= new File(uploadPath+"\\"+actImgs.get(i).getImgNameKey());
			System.out.println(file);
			file.delete();
		}
		activityDao.deleteActivity(activityDto);
	}

	@Override
	public String getCompanyName(String companyId) {
		
		return activityDao.getCompanyName(companyId);
	}

	@Override
	public List<ActivityDTO> getActivityLocation() {
		
		return activityDao.getActivityLocation();
	}

	@Override
	public List<String> getCompanyMember() {
		
		return activityDao.getCompanyMember();
	}


}
