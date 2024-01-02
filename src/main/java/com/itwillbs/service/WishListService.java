package com.itwillbs.service;

import com.itwillbs.domain.WishListDTO;

public interface WishListService {
	public void insertWishList(WishListDTO wishListDto);
	public void deleteWishList(WishListDTO wishListDto);
	public String checkWishList(WishListDTO wishListDto);
}
