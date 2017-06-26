package com.scbd.companyinformation.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.common.tag.PageIterator;
import com.scbd.companyinformation.dao.CompanyInfoDao;
import com.scbd.companyinformation.form.CompanyInfoForm;
import com.scbd.companyinformation.service.CompanyInfoService;


@Service("companyInfoServiceImpl")
public class CompanyInfoServiceImpl implements CompanyInfoService {

	@Autowired
	private CompanyInfoDao companyInfoDaoImpl;
	
	@Override
	public void saveCompanyInfo(CompanyInfoForm a) throws Exception {
		companyInfoDaoImpl.saveCompanyInfo(a);
	}

	


	
}
