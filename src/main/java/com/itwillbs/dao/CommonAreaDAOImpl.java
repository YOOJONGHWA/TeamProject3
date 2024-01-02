package com.itwillbs.dao;

import com.itwillbs.domain.CommonAreaDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;


@Repository
public class CommonAreaDAOImpl implements CommonAreaDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.commonAreaMapper";

	@Override
	public void insertArea(String Area) {
		sqlSession.insert(namespace + ".insertArea" , Area);
	}

	@Override
	public void deleteArea(String Area) {
		sqlSession.delete(namespace + ".deleteArea" , Area);
	}

	@Override
	public List<CommonAreaDTO> getAreaList() {
		return sqlSession.selectList(namespace + ".getAreaList");
	}
	
	
}
