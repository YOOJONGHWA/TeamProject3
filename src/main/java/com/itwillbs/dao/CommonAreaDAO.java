package com.itwillbs.dao;

import com.itwillbs.domain.CommonAreaDTO;

import java.util.List;

public interface CommonAreaDAO {
	
	public void insertArea(String Area);
	public void deleteArea(String Area);
	public List<CommonAreaDTO> getAreaList();
}
