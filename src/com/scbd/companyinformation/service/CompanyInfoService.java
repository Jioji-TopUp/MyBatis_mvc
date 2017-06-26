package com.scbd.companyinformation.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.common.tag.PageIterator;
import com.scbd.companyinformation.form.CompanyInfoForm;

@Transactional
public interface CompanyInfoService {

	public void saveCompanyInfo(CompanyInfoForm a)
			throws Exception;

	

}
