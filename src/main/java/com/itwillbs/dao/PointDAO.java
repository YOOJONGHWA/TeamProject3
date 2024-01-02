package com.itwillbs.dao;

import com.itwillbs.domain.PointDTO;
import com.itwillbs.domain.PointPageDTO;

import java.util.List;


public interface PointDAO {
	
		//포인트 회원정보 가져오기
		PointDTO getMember(String userId);

		//포인트(아이디) 잔고? 조회
		int getPointCount(String userId);

		//포인트DB POINT_NUM 조회
		Integer getMaxNum();

		//포인트 DB 저장
		void insertMember(PointDTO pointDTO);

		List<PointDTO> getPointCheckList(PointPageDTO pointPageDTO);

		public int getptPageCount();

}
