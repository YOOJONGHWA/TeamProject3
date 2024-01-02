package com.itwillbs.service;

import com.itwillbs.dao.ActImgDAO;
import com.itwillbs.domain.ActImgDTO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.inject.Inject;
import java.util.List;

@Service
public class ActImgServiceImpl implements ActImgService{
	@Inject // 부모=자식 객체생성
	private ActImgDAO actImgDao;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@Override
	public void insertActImg(ActImgDTO actImgDto) {
		actImgDao.insertActImg(actImgDto);
	}
	@Override
	public void deleteActImg(ActImgDTO actImgDto) {
		actImgDao.deleteActImg(actImgDto);
	}
	
	@Override
	public void updateActImg(ActImgDTO actImgDto) {
		
		actImgDao.updateActImg(actImgDto);
	}
	
	@Override
	public List<ActImgDTO> getActImgList(int actNum) {
		return actImgDao.getActImgList(actNum);
	}
	
	@Override
	public ActImgDTO getActImg(ActImgDTO actImgDto) {
		return actImgDao.getActImg(actImgDto);
	}

}
