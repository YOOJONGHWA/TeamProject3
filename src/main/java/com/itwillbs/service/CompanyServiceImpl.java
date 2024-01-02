package com.itwillbs.service;

import com.itwillbs.dao.CompanyDAO;
import com.itwillbs.domain.CompanyDTO;
import com.itwillbs.domain.PageDTO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class CompanyServiceImpl implements CompanyService{

	@Inject
	private CompanyDAO companyDAO;

	// company
	@Override
	public void companyInsertMember(CompanyDTO dto) {
		companyDAO.companyInsertMember(dto);
	}
	
	@Override
	public CompanyDTO companyUserCheck(CompanyDTO dto) {
		return companyDAO.companyUserCheck(dto);
	}

	@Override
	public CompanyDTO companyIdCheck(CompanyDTO dto) {
		return companyDAO.companyIdCheck(dto);
	}

	@Override
	public CompanyDTO companyGetMember(String id) {
		return companyDAO.companyGetMember(id);
	}

	@Override
	public CompanyDTO companyNumCheck(CompanyDTO dto) {
		return companyDAO.companyNumCheck(dto);
	}

	@Override
	public CompanyDTO companyGetMemberNum(String id) {
		return companyDAO.companyGetMemberNum(id);
	}

	@Override
	public List<CompanyDTO> getCompanyList(PageDTO dto) {
		// TODO Auto-generated method stub
		return companyDAO.getCompanyList(dto);
	}

	@Override
	public int getCompanyCount() {
		// TODO Auto-generated method stub
		return companyDAO.getCompanyCount();
	}

	@Override
	public void companyDeleteMember(CompanyDTO dto) {
		companyDAO.companyDeleteMember(dto);
	}
	
	
	
	
	
	
	
	
	// company

	
}
