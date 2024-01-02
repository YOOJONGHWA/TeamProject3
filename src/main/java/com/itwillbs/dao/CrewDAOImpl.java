package com.itwillbs.dao;

import com.itwillbs.domain.ActivityDTO;
import com.itwillbs.domain.CrewDTO;
import com.itwillbs.domain.CrewPageDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository
public class CrewDAOImpl implements CrewDAO {
	
	// 마이바티스 자동 객체 생성
	@Inject
	private SqlSession sqlSession;
	// sql 구문 이름
	private static final String namespace = "com.itwillbs.mappers.crewMapper";
	
	@Override
	public void insertCrew(CrewDTO crewDTO) {
		sqlSession.insert(namespace + ".insertCrew", crewDTO);
	}

	@Override
	public Integer getMaxNum() {
		return sqlSession.selectOne(namespace + ".getMaxNum");
	}

	@Override
	public List<CrewDTO> getCrewList(CrewPageDTO pageDTO) {
		
		return sqlSession.selectList(namespace + ".getCrewList", pageDTO);
	}

	@Override
	public CrewDTO getCrewPrevNum(int num) {
		
		return sqlSession.selectOne(namespace + ".getCrewPrevNum", num);
	}
	
	@Override
	public CrewDTO getCrewNextNum(int num) {
		
		return sqlSession.selectOne(namespace + ".getCrewNextNum", num);
	}
	
	@Override
	public int getCrewCount() {
		
		return sqlSession.selectOne(namespace + ".getCrewCount");
	}

	@Override
	public CrewDTO getCrew(int num) {
		return sqlSession.selectOne(namespace + ".getCrew", num);
	}

	@Override
	public void updateReadcount(int num) {
		sqlSession.update(namespace + ".updateReadcount", num);
	}

	@Override
	public void updateCrew(CrewDTO crewDTO) {
		sqlSession.update(namespace + ".updateCrew", crewDTO);
	}

	@Override
	public void deleteCrew(int num) {
		sqlSession.delete(namespace + ".deleteCrew", num);
	}

	@Override
	public List<ActivityDTO> getActCategoryList(String actLocation) {
		return sqlSession.selectList(namespace + ".getActCategoryList", actLocation);
	}

	@Override
	public List<ActivityDTO> getActList(String actLocation) {
		return sqlSession.selectList(namespace + ".getActList", actLocation);
	}

	@Override
	public List<ActivityDTO> getActList(ActivityDTO activityDTO) {
		return sqlSession.selectList(namespace + ".getActList", activityDTO);
	}

	@Override
	public void updateStatus(CrewDTO crewDTO) {
		sqlSession.update(namespace + ".updateStatus", crewDTO);
		
	}

	
	

}
