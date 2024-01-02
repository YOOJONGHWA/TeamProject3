package com.itwillbs.dao;


import com.itwillbs.domain.CompanyDTO;
import com.itwillbs.domain.PageDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository
public class CompanyDAOImpl implements CompanyDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.itwillbs.mappers.companyMapper";
	
	// company
	@Override
	public void companyInsertMember(CompanyDTO dto) {
		sqlSession.insert(namespace + ".companyInsertMember", dto);
	}

	@Override
	public CompanyDTO companyUserCheck(CompanyDTO dto) {
		return sqlSession.selectOne(namespace + ".companyUserCheck", dto);
	}

	@Override
	public CompanyDTO companyIdCheck(CompanyDTO dto) {
		return sqlSession.selectOne(namespace + ".companyIdCheck", dto);
	}

	@Override
	public CompanyDTO companyGetMember(String id) {
		return sqlSession.selectOne(namespace + ".companyGetMember", id);
	}

	@Override
	public CompanyDTO companyNumCheck(CompanyDTO dto) {
		return sqlSession.selectOne(namespace + ".companyNumCheck", dto);
	}

	@Override
	public CompanyDTO companyGetMemberNum(String id) {
		return sqlSession.selectOne(namespace + ".companyGetMemberNum", id);
	}

	@Override
	public List<CompanyDTO> getCompanyList(PageDTO dto) {
		return sqlSession.selectList(namespace + ".getCompanyList", dto);
	}

	@Override
	public int getCompanyCount() {
		return sqlSession.selectOne(namespace + ".getCompanyCount");
	}

	@Override
	public void companyDeleteMember(CompanyDTO dto) {
		sqlSession.selectOne(namespace + ".companyDeleteMember", dto);
	}
	
	
	
	
	
	// company
	
}
