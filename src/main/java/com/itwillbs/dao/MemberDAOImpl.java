package com.itwillbs.dao;


import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.itwillbs.mappers.memberMapper";
	
	// user
	/* 유저 영역*/
	@Override
	public void userInsertMember(MemberDTO dto) {
		sqlSession.insert(namespace + ".userInsertMember", dto);
	}

	@Override
	public MemberDTO userCheck(MemberDTO dto)  {
		return sqlSession.selectOne(namespace + ".userCheck", dto);
	}

	@Override
	public MemberDTO userIdCheck(MemberDTO dto) {
		return sqlSession.selectOne(namespace + ".userIdCheck", dto);
	}

	@Override
	public MemberDTO userGetMember(String id) {
		return sqlSession.selectOne(namespace + ".userGetMember", id);
	}

	@Override
	public MemberDTO userEmailCheck(MemberDTO dto) {
		return sqlSession.selectOne(namespace + ".userEmailCheck", dto);
	}

	@Override
	public MemberDTO userGetMemberEmail(String email) {
		return sqlSession.selectOne(namespace + ".userGetMemberEmail", email);
	}
	/* 유저 영역*/

	/* 어드민 영역*/
	@Override
	public List<MemberDTO> getMemberList(PageDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".getMemberList", dto);
	}

	@Override
	public int getMemberCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".getMemberCount");
	}
	
	@Override
	public void userDeleteMember(MemberDTO dto) {
		sqlSession.selectOne(namespace + ".userDeleteMember", dto);
		
	}
	/* 어드민 영역*/
	
	// user
	


	
}
