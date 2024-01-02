package com.itwillbs.dao;

import com.itwillbs.domain.CrewLikeDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.Map;

@Repository
public class CrewLikeDAOImpl implements CrewLikeDAO {

	// 마이바티스 자동 객체 생성
	@Inject
	private SqlSession sqlSession;
	// sql 구문 이름
	private static final String namespace = "com.itwillbs.mappers.crewLikeMapper";
	
	@Override
	public Map<String, Object> likeCheck(Map<String, Object> map) {
		return sqlSession.selectOne(namespace + ".likeCheck", map);
	}

	@Override
	public Integer getMaxNum() {
		return sqlSession.selectOne(namespace + ".getMaxNum");
	}
	
	// 처음 좋아요 클릭 정보 insert!!!
	@Override
	public void insertLike(CrewLikeDTO crewLikeDTO) {
		sqlSession.insert(namespace + ".insertLike", crewLikeDTO);
	}

	// 좋아요 취소했다가 다시 좋아요 클릭 +1
	@Override
	public void updateLike(CrewLikeDTO crewLikeDTO) {
		sqlSession.update(namespace + ".updateLike", crewLikeDTO);
		
	}
	
	// 좋아요 취소 -1
	@Override
	public void deleteLike(CrewLikeDTO crewLikeDTO) {
		sqlSession.update(namespace + ".deleteLike", crewLikeDTO);
	}




}
