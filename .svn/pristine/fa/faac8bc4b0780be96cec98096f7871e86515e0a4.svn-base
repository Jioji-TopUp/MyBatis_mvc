package com.scbd.companyinformation.dao.impl;

import java.util.List;


import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

import com.common.mongo.Mongo;
import com.common.tag.PageIterator;
import com.scbd.companyinformation.dao.CompanyInfoDao;
import com.scbd.companyinformation.form.CompanyInfoForm;

@Repository("companyInfoDaoImpl")
public  class CompanyInfoDaoImpl extends Mongo<CompanyInfoForm> implements CompanyInfoDao {

	
	@Override
	public void saveCompanyInfo(CompanyInfoForm a) throws Exception {
		this.insert(a);
	}

}
