package com.itwillbs.service;

import com.itwillbs.domain.ActImgDTO;

import java.util.List;

public interface ActImgService {
	public void insertActImg(ActImgDTO actImgDto);
	public ActImgDTO getActImg(ActImgDTO actImgDto);
	public void updateActImg(ActImgDTO actImgDto);
	public void deleteActImg(ActImgDTO actImgDto);
	public List<ActImgDTO> getActImgList(int actNum);
	
}
