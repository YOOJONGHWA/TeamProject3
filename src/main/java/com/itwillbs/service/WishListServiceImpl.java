package com.itwillbs.service;

import com.itwillbs.dao.WishListDAO;
import com.itwillbs.domain.WishListDTO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;

@Service
public class WishListServiceImpl implements WishListService{
	@Inject // 부모=자식 객체생성
	private WishListDAO wishListDao;
	
	@Override
	public void insertWishList(WishListDTO wishListDto) {
		wishListDao.insertWishList(wishListDto);
	}

	@Override
	public void deleteWishList(WishListDTO wishListDto) {
		wishListDao.deleteWishList(wishListDto);
	}

	@Override
	public String checkWishList(WishListDTO wishListDto) {
		
		return wishListDao.checkWishList(wishListDto);
	}

}
