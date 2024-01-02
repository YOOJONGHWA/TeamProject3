package com.itwillbs.service;

import com.itwillbs.domain.CommonAreaDTO;

import java.util.List;

public interface CommonAreaService {
	
	public void insertArea(String Area);
	public void deleteArea(String Area);
	public List<CommonAreaDTO> getAreaList();

}
