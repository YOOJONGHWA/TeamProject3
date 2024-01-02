package com.itwillbs.dao;

import com.itwillbs.domain.InterestAreaDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;

@Repository
public class UserInterestAreaDAOImpl implements UserInterestAreaDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.itwillbs.mappers.userInterestAreaMapper";

	@Override
	public void userInterestArea(InterestAreaDTO dto) {
		sqlSession.insert(namespace + ".insertAreaActImg" , dto);
	}

	@Override
	public InterestAreaDTO getUserInterestArea(String id) {
		return sqlSession.selectOne(namespace + ".getUserInterestArea" , id);
	}

	@Override
	public void deleteUserInterestArea(InterestAreaDTO dto) {
		sqlSession.delete(namespace + ".deleteUserInterestArea" , dto);
	}
	
	
	
	

}
