package com.itwillbs.dao;

import com.itwillbs.domain.PhotoReplyDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository
public class PhotoReplyDAOImpl implements PhotoReplyDAO {

	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "com.itwillbs.mappers.photoReplyMapper";
	
	@Override
	public void insertReply(PhotoReplyDTO photoReplyDTO) {
		sqlSession.insert(namespace + ".insertReply", photoReplyDTO);
	}

	@Override
	public Integer getMaxNum() {
		return sqlSession.selectOne(namespace + ".getMaxNum");
	}

	@Override
	public void insertReReply(PhotoReplyDTO photoReplyDTO) {
		sqlSession.insert(namespace + ".insertReply", photoReplyDTO);
	}

//	@Override
//	public List<PhotoReplyDTO> getPhotoReplyList(PhotoPageDTO pageDTO) {
//		
//		return sqlSession.selectList(namespace + ".getReplyList", pageDTO);
//	}

	@Override
	public int getPhotoReplyCount(int num) {
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
	public List<PhotoReplyDTO> getPhotoReplyList(int num) {
		return sqlSession.selectList(namespace + ".getReplyList", num);
	}

	// 댓글 삭제
	@Override
	public void deleteReply(PhotoReplyDTO photoReplyDTO) {
		sqlSession.delete(namespace + ".deleteReply", photoReplyDTO);
	}
	
	// 부모 댓글 임시 삭제
	@Override
	public void tmpDeleteReply(PhotoReplyDTO photoReplyDTO) {
		sqlSession.delete(namespace + ".tmpDeleteReply", photoReplyDTO);
	}
	
	// 댓글 가져오기
	@Override
	public PhotoReplyDTO getReply(int num) {
		return sqlSession.selectOne(namespace + ".getReply", num);
	}

	
	@Override
	public void updateReply(PhotoReplyDTO photoReplyDTO) {
		sqlSession.update(namespace + ".updateReply", photoReplyDTO);
		
	}

}
