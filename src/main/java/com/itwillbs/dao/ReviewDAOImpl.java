package com.itwillbs.dao;

import com.itwillbs.domain.RePageDTO;
import com.itwillbs.domain.ReplyDTO;
import com.itwillbs.domain.ReviewDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository
public class ReviewDAOImpl implements ReviewDAO{
	//마이바티스 자동 객체생성
	@Inject
	private SqlSession sqlSession;
	//sql구문이름
	private static final String namespace="com.itwillbs.mappers.ReviewMapper";
	
	@Override
	public void insertReview(ReviewDTO dto) {
		sqlSession.insert(namespace+".insertReview", dto);
	}

	@Override
	public Integer getMaxNum() {
		return sqlSession.selectOne(namespace+".getMaxNum");
	}

	@Override
	public List<ReviewDTO> getReviewList(RePageDTO dto) {
		return sqlSession.selectList(namespace+".getReviewList",dto);
	}

	@Override
	public int getReviewCount() {
		
		return sqlSession.selectOne(namespace+".getReviewCount");
	}

	@Override
	public void updateReadcount(int num) {
		sqlSession.update(namespace+".updateReadcount", num);
		
	}

	@Override
	public ReviewDTO getReview(int num) {
		return sqlSession.selectOne(namespace+".getReview", num);
	}

	@Override
	public void updateReview(ReviewDTO dto) {
		sqlSession.update(namespace + ".updateReview", dto);
	}
	
	@Override
	public void deleteReview(int num) {
		sqlSession.delete(namespace + ".deleteReview", num);
		
	}
	
	// 댓글
	@Override
	public void insertBoard(ReplyDTO replyDTO) {
		sqlSession.insert(namespace+".insertBoard", replyDTO);
	}

	@Override
	public Integer regetMaxNum() {
		return sqlSession.selectOne(namespace+".regetMaxNum");
	}

	@Override
	public List<ReplyDTO> getBoardList(RePageDTO pageDTO) {
		return sqlSession.selectList(namespace+".getBoardList", pageDTO);
	}

	@Override
	public int getBoardCount() {
		return sqlSession.selectOne(namespace+".getBoardCount");
	}

	@Override
	public ReplyDTO getBoard(int num) {
		
		return sqlSession.selectOne(namespace+".getBoard", num);
	}

	@Override
	public void updateBoard(ReplyDTO replyDTO) {
		sqlSession.update(namespace+".updateBoard", replyDTO);
	}

	@Override
	public void deleteBoard(ReplyDTO replyDTO) {
		sqlSession.delete(namespace+".deleteBoard", replyDTO);
	}

	@Override
	public void updateReSeq(ReplyDTO replyDTO) {
		sqlSession.update(namespace+".updateReSeq", replyDTO);
	}
	
}
