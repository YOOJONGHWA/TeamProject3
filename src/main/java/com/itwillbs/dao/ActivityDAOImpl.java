package com.itwillbs.dao;

import com.itwillbs.domain.ActPageDTO;
import com.itwillbs.domain.ActivityDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;


@Repository
public class ActivityDAOImpl implements ActivityDAO{
	
	@Inject
	private SqlSession sqlSession;

	
	private static final String namespace="com.itwillbs.mappers.activityMapper";
	
	@Override
	public void insertActivity(ActivityDTO activityDto) {
		sqlSession.insert(namespace + ".insertActivity", activityDto);
			
	}

	@Override
	public Integer getMaxNum() {
		return sqlSession.selectOne(namespace+".getMaxNum");
	}

	@Override
	public List<ActivityDTO> getActivityList(ActPageDTO actPageDto) {
		return sqlSession.selectList(namespace+".getActivityList",actPageDto);
	}

	@Override
	public ActivityDTO getActivity(int actNum) {
		return sqlSession.selectOne(namespace+".getActivity",actNum);
	}

	@Override
	public Integer getActivityCount(ActPageDTO actPageDto) {
		return sqlSession.selectOne(namespace+".getActivityCount", actPageDto);
	}

	@Override
	public void updateActivity(ActivityDTO activityDto) {
		
		sqlSession.update(namespace+".updateActivity",activityDto);
		
	}

	@Override
	public void deleteActivity(ActivityDTO activityDto) {
		sqlSession.delete(namespace+".deleteActivity",activityDto);
	}

	@Override
	public String getCompanyName(String companyId) {
		return sqlSession.selectOne(namespace+".getCompanyName",companyId);
	}

	@Override
	public List<ActivityDTO> getActivityLocation() {
		return sqlSession.selectList(namespace+".getActivityLocation");
	}

	@Override
	public List<String> getCompanyMember() {
		return sqlSession.selectList(namespace+".getCompanyMember");
	}
	
	
	
}
