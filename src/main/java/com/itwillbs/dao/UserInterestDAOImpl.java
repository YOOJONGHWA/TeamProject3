package com.itwillbs.dao;

import com.itwillbs.domain.InterestDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;

@Repository
public class UserInterestDAOImpl implements UserInterestDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.itwillbs.mappers.userInterestMapper";
	
	@Override
	public void userInterestMember(InterestDTO dto) {
		sqlSession.insert(namespace + ".insertActImg", dto);
	}

	@Override
	public InterestDTO getUserInterest(String id) {
		return sqlSession.selectOne(namespace + ".getUserInterest" , id);
	}

	@Override
	public void deleteUserInterest(InterestDTO dto) {
		sqlSession.delete(namespace + ".deleteUserInterest" , dto);
	}
	
	
	
	
	
	

}
