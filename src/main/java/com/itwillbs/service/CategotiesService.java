package com.itwillbs.service;

import com.itwillbs.domain.CategoriesDTO;

import java.util.List;

public interface CategotiesService {
	
	public void insertCategory(String category);
	public void deleteCategory(String category);
	public List<CategoriesDTO> getCategoryList();

}
