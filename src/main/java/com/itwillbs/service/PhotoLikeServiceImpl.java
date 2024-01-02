package com.itwillbs.service;

import com.itwillbs.dao.PhotoLikeDAO;
import com.itwillbs.domain.PhotoLikeDTO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.Map;


@Service
public class PhotoLikeServiceImpl implements PhotoLikeService {

	@Inject
	private PhotoLikeDAO photoLikeDAO;

	@Override
	public Map<String, Object> likeCheck(Map<String, Object> map) {
		
		return photoLikeDAO.likeCheck(map);
	}

	@Override
	public void insertLike(PhotoLikeDTO photoLikeDTO) {
		
		Map<String, Object> photoMap = new HashMap<>();
		photoMap.put("photoNum", photoLikeDTO.getPhotoNum());
		photoMap.put("userId", photoLikeDTO.getUserId());
		
		try {
			
			Map<String, Object> likeCheckMap = photoLikeDAO.likeCheck(photoMap);

			if(likeCheckMap == null) {
				// 값이 없으면 insert
				if(photoLikeDAO.getMaxNum()==null) {
					// 글이 없는 경우
					photoLikeDTO.setPlNum(1);
				}else {
					// 글이 있는 경우
					photoLikeDTO.setPlNum(photoLikeDAO.getMaxNum()+1);
				}
				
				photoLikeDTO.setPlCheck(1);
				photoLikeDAO.insertLike(photoLikeDTO);
				
			}else {
				// 체크여부 확인 getChecked? db에 저장된 값이 있으면 update
				photoLikeDAO.updateLike(photoLikeDTO);
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}
	
	@Override
	public void deleteLike(PhotoLikeDTO photoLikeDTO) {
		photoLikeDAO.deleteLike(photoLikeDTO);
	}


	
	
}
