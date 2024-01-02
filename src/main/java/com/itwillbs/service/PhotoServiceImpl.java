package com.itwillbs.service;

import com.itwillbs.dao.PhotoDAO;
import com.itwillbs.domain.PhotoDTO;
import com.itwillbs.domain.PhotoPageDTO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.sql.Timestamp;
import java.util.List;

@Service
public class PhotoServiceImpl implements PhotoService {
	
	@Inject
	private PhotoDAO photoDAO;

	
	@Override
	public void insertPhoto(PhotoDTO photoDTO) {
		// name,subject,content
		// num,readcount,date
		// num = max(num) + 1
		if(photoDAO.getMaxNum()==null) {
			// 글이 없는 경우
			photoDTO.setPhotoNum(1);
		}else {
			// 글이 있는 경우
			photoDTO.setPhotoNum(photoDAO.getMaxNum()+1);
		}
		photoDTO.setPhotoReadcount(0);
		photoDTO.setPhotoDate(new Timestamp(System.currentTimeMillis()));

		photoDAO.insertPhoto(photoDTO);
		
	}

	@Override
	public List<PhotoDTO> getPhotoList(PhotoPageDTO pageDTO) {
		// startRow 구하기
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		// endRow 구하기
		int endRow=startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setStartRow(startRow-1);
		pageDTO.setEndRow(endRow);
		
		return photoDAO.getPhotoList(pageDTO);
	}

	@Override
	public int getPhotoCount() {
		return photoDAO.getPhotoCount();
	}

	@Override
	public PhotoDTO getPhoto(int num) {
		return photoDAO.getPhoto(num);
	}

	@Override
	public void updateReadcount(int num) {
		photoDAO.updateReadcount(num);		
	}

	@Override
	public void updatePhoto(PhotoDTO photoDTO) {
		photoDAO.updatePhoto(photoDTO);
		
	}

	@Override
	public void deletePhoto(int num) {
		photoDAO.deletePhoto(num);
		
	}

	
	
	

}
