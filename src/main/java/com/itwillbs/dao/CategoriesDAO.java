package com.itwillbs.dao;

import com.itwillbs.domain.CategoriesDTO;

import java.util.List;

public interface CategoriesDAO {
	
	public void insertCategory(String category);
	public void deleteCategory(String category);
	public List<CategoriesDTO> getCategoryList();
}
