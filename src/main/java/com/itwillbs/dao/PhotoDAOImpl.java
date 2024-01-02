package com.itwillbs.dao;

import com.itwillbs.domain.PhotoDTO;
import com.itwillbs.domain.PhotoPageDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;


@Repository
public class PhotoDAOImpl implements PhotoDAO {
	
	// 마이바티스 자동 객체 생성
	@Inject
	private SqlSession sqlSession;
	
	// sql 구문 이름
	private static final String namespace = "com.itwillbs.mappers.photoMapper";
	
	@Override
	public void insertPhoto(PhotoDTO photoDTO) {
		sqlSession.insert(namespace + ".insertPhoto", photoDTO);
		
	}
	@Override
	public Integer getMaxNum() {
		return sqlSession.selectOne(namespace + ".getMaxNum");

	}
	@Override
	public List<PhotoDTO> getPhotoList(PhotoPageDTO pageDTO) {
		return sqlSession.selectList(namespace + ".getPhotoList", pageDTO);
	}
	@Override
	public int getPhotoCount() {
		return sqlSession.selectOne(namespace + ".getPhotoCount");

	}
	@Override
	public PhotoDTO getPhoto(int num) {
		return sqlSession.selectOne(namespace + ".getPhoto", num);

	}
	@Override
	public void updateReadcount(int num) {
		sqlSession.update(namespace + ".updateReadcount", num);
		
	}
	@Override
	public void updatePhoto(PhotoDTO photoDTO) {
		sqlSession.update(namespace + ".updatePhoto", photoDTO);
		
	}
	@Override
	public void deletePhoto(int num) {
		sqlSession.delete(namespace + ".deletePhoto", num);
		
	}
	

	

}
