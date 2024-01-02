package com.itwillbs.dao;

import com.itwillbs.domain.WishListDTO;

public interface WishListDAO {
	public void insertWishList(WishListDTO wishListDto);
	public void deleteWishList(WishListDTO wishListDto);
	public String checkWishList(WishListDTO wishListDto);
}
