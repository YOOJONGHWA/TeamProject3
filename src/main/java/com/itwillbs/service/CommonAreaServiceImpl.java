package com.itwillbs.service;

import com.itwillbs.dao.CommonAreaDAO;
import com.itwillbs.domain.CommonAreaDTO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class CommonAreaServiceImpl implements CommonAreaService{

	@Inject
	private CommonAreaDAO commonAreaDAO;

	@Override
	public void insertArea(String Area) {
		commonAreaDAO.insertArea(Area);
	}

	@Override
	public void deleteArea(String Area) {
		commonAreaDAO.deleteArea(Area);
	}

	@Override
	public List<CommonAreaDTO> getAreaList() {
		return commonAreaDAO.getAreaList();
	}
	

	

}
