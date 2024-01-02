package com.itwillbs.service;

import com.itwillbs.dao.CrewLikeDAO;
import com.itwillbs.domain.CrewLikeDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class CrewLikeServiceImpl implements CrewLikeService {

	@Autowired
	private CrewLikeDAO crewLikeDAO;

	@Override
	public Map<String, Object> likeCheck(Map<String, Object> map) {
		
		return crewLikeDAO.likeCheck(map);
	}

	@Override
	public void insertLike(CrewLikeDTO crewLikeDTO) {
		
		Map<String, Object> crewMap = new HashMap<>();
		crewMap.put("crewNum", crewLikeDTO.getCrewNum());
		crewMap.put("userId", crewLikeDTO.getUserId());
		
		try {
			
			Map<String, Object> likeCheckMap = crewLikeDAO.likeCheck(crewMap);

			if(likeCheckMap == null) {
				// 값이 없으면 insert
				if(crewLikeDAO.getMaxNum()==null) {
					// 글이 없는 경우
					crewLikeDTO.setClNum(1);
				}else {
					// 글이 있는 경우
					crewLikeDTO.setClNum(crewLikeDAO.getMaxNum()+1);
				}
				
				crewLikeDTO.setClCheck(1);
				crewLikeDAO.insertLike(crewLikeDTO);
				
			}else {
				// 체크여부 확인 getChecked? db에 저장된 값이 있으면 update
				crewLikeDAO.updateLike(crewLikeDTO);
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}
	
	@Override
	public void deleteLike(CrewLikeDTO crewLikeDTO) {
		crewLikeDAO.deleteLike(crewLikeDTO);
	}


	
	
}
