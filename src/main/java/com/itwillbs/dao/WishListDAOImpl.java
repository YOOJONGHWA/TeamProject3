package com.itwillbs.dao;

import com.itwillbs.domain.WishListDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;


@Repository
public class WishListDAOImpl implements WishListDAO{
	
	@Inject
	private SqlSession sqlSession;

	
	private static final String namespace="com.itwillbs.mappers.wishListMapper";
	

	@Override
	public void insertWishList(WishListDTO wishListDto) {
		sqlSession.insert(namespace+".insertWishList",wishListDto);
	}

	@Override
	public void deleteWishList(WishListDTO wishListDto) {
		sqlSession.delete(namespace+".deleteWishList",wishListDto);
	}

	@Override
	public String checkWishList(WishListDTO wishListDto) {
		return sqlSession.selectOne(namespace+".checkWishList",wishListDto);
	}
	
}
