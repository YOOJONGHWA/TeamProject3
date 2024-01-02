package com.itwillbs.service;

import com.itwillbs.dao.PointDAO;
import com.itwillbs.domain.PointDTO;
import com.itwillbs.domain.PointPageDTO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.sql.Timestamp;
import java.util.List;

@Service
public class PointServiceImpl implements PointService {
	
	@Inject
	private PointDAO pointDAO;
	
		//포인트 회원정보 가져오기
		@Override
		public PointDTO getMember(String userId) {
			
			return pointDAO.getMember(userId);
		}
		
		//포인트(아이디) 수 조회
		@Override
		public int getPointCount(String userId) {
			return pointDAO.getPointCount(userId);
		}
	
		//포인트 DB 저장
		@Override
		public void insertMember(PointDTO pointDTO) {
			
			pointDTO.setPointDate(new Timestamp(System.currentTimeMillis()));
	
			// max(num)+1
			if(pointDAO.getMaxNum()==null) {
				pointDTO.setPointNum(1);
			}else {
				pointDTO.setPointNum(pointDAO.getMaxNum()+1);
			}
	
			pointDAO.insertMember(pointDTO);
		}
		
		@Override
		public List<PointDTO> getPointCheckList(PointPageDTO pointPageDTO) {
			
			// pageSize  pageNum  currentPage
			int startRow=(pointPageDTO.getCurrentPage()-1)*pointPageDTO.getPageSize()+1;
			int endRow=startRow+pointPageDTO.getPageSize()-1;
	
			// sql => limit #{startRow -1}, #{pageSize}
			pointPageDTO.setStartRow(startRow-1);
			pointPageDTO.setEndRow(endRow);
			
			return pointDAO.getPointCheckList(pointPageDTO);
		}

		@Override
		public int getptPageCount() {
			return pointDAO.getptPageCount();
		}

}
