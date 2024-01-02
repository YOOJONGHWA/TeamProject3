package com.itwillbs.dao;

import com.itwillbs.domain.CompanyDTO;
import com.itwillbs.domain.PageDTO;

import java.util.List;

public interface CompanyDAO {
	
	// company
	/* 기업 */
	public void companyInsertMember(CompanyDTO dto);
	public CompanyDTO companyUserCheck(CompanyDTO dto);
	public CompanyDTO companyIdCheck(CompanyDTO dto);
	public CompanyDTO companyGetMember(String id);
	public CompanyDTO companyNumCheck(CompanyDTO dto);
	public CompanyDTO companyGetMemberNum(String id);
	/* 기업 */
	
	/* 관리자 */
	public List<CompanyDTO> getCompanyList(PageDTO dto);
	public int getCompanyCount();
	public void companyDeleteMember(CompanyDTO dto);
	/* 관리자 */
	// company
}
