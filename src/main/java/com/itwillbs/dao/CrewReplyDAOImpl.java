package com.itwillbs.dao;

import com.itwillbs.domain.CrewPageDTO;
import com.itwillbs.domain.CrewReplyDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CrewReplyDAOImpl implements CrewReplyDAO {

	@Autowired
	private SqlSession sqlSession;
	private static final String namespace = "com.itwillbs.mappers.crewReplyMapper";
	
	@Override
	public void insertReply(CrewReplyDTO crewReplyDTO) {
		sqlSession.insert(namespace + ".insertReply", crewReplyDTO);
	}

	@Override
	public Integer getMaxNum() {
		return sqlSession.selectOne(namespace + ".getMaxNum");
	}

	@Override
	public void insertReReply(CrewReplyDTO crewReplyDTO) {
		sqlSession.insert(namespace + ".insertReply", crewReplyDTO);
	}

	@Override
	public List<CrewReplyDTO> getCrewReplyList(CrewPageDTO pageDTO) {
		
		return sqlSession.selectList(namespace + ".getReplyList", pageDTO);
	}

	@Override
	public int getCrewReplyCount(int num) {
		return sqlSession.selectOne(namespace + ".getReplyCount", num);
	}

	// 자식댓글 달렸을 때 부모댓글 crOrder + 1 
	@Override
	public int updateAddOrder(int num) {
		return sqlSession.update(namespace + ".updateAddOrder", num);
	}
	
	// 자식댓글 삭제됐을 때 부모댓글 crOrder - 1;
	@Override
	public int updateSubOrder(int num) {
		return sqlSession.update(namespace + ".updateSubOrder", num);
	}

	@Override
	public List<CrewReplyDTO> getCrewReplyList(int num) {
		return sqlSession.selectList(namespace + ".getReplyList", num);
	}

	// 댓글 삭제
	@Override
	public void deleteReply(CrewReplyDTO crewReplyDTO) {
		sqlSession.delete(namespace + ".deleteReply", crewReplyDTO);
	}
	
	// 부모 댓글 임시 삭제
	@Override
	public void tmpDeleteReply(CrewReplyDTO crewReplyDTO) {
		sqlSession.delete(namespace + ".tmpDeleteReply", crewReplyDTO);
	}
	
	// 댓글 가져오기
	@Override
	public CrewReplyDTO getReply(int num) {
		return sqlSession.selectOne(namespace + ".getReply", num);
	}

	
	@Override
	public void updateReply(CrewReplyDTO crewReplyDTO) {
		sqlSession.update(namespace + ".updateReply", crewReplyDTO);
		
	}

}
