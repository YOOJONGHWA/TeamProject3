package com.itwillbs.dao;

import com.itwillbs.domain.DateDTO;
import com.itwillbs.domain.ScheduleDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository
public class ScheduleDAOImpl implements ScheduleDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	
	private static final String namespace="com.itwillbs.mappers.scheduleMapper";

	@Override
	public int scheduleAdd(ScheduleDTO scheduleDTO) {
		
		
		return sqlSession.insert(namespace + ".scheduleAdd" , scheduleDTO );
	}

	@Override
	public int beforeScheduleAddSearch(ScheduleDTO scheduleDTO) {
		
		
		return sqlSession.selectOne(namespace +".beforeScheduleAddSearch" , scheduleDTO);
	}

	@Override
	public List<ScheduleDTO> scheduleList(DateDTO dateDTO) {
		
		return sqlSession.selectList(namespace + ".scheduleList",dateDTO);
	}
	
	
}
