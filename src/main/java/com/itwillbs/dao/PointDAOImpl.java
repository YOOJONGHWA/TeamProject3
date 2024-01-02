package com.itwillbs.dao;

import com.itwillbs.domain.PointDTO;
import com.itwillbs.domain.PointPageDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository
public class PointDAOImpl implements PointDAO {
	
	@Inject
	private SqlSession sqlSession;

	private static final String namespace="com.itwillbs.mappers.pointMapper";
	
		//포인트 회원정보 가져오기
		@Override
		public PointDTO getMember(String userId) {
			return sqlSession.selectOne(namespace + ".getMember", userId);
		}
		//포인트(아이디) 수 조회
		@Override
		public int getPointCount(String userId) {
			return sqlSession.selectOne(namespace+".getPointCount", userId);
		}
		//포인트DB POINT_NUM 조회
		@Override
		public Integer getMaxNum() {
			return sqlSession.selectOne(namespace+".getMaxNum");
		}
		//포인트 DB 저장
		@Override
		public void insertMember(PointDTO pointDTO) {
			sqlSession.insert(namespace+".insertMember", pointDTO);
		}

		@Override
		public List<PointDTO> getPointCheckList(PointPageDTO pointPageDTO) {
			return sqlSession.selectList(namespace+".getPointCheckList", pointPageDTO);
		}
		
		//포인트 리스트 페이지
		@Override
		public int getptPageCount() {
			return sqlSession.selectOne(namespace+".getptPageCount");
		}
		
		
}
