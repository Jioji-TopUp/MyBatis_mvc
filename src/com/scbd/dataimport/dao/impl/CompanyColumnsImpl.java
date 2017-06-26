package com.scbd.dataimport.dao.impl;

import java.util.List;

import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import com.common.mongo.Mongo;
import com.scbd.dataimport.dao.CompanyColumnsDao;
import com.scbd.dataimport.form.CompanyColumnsForm;
import com.scbd.dataimport.form.CompanyDataForm;

@Repository("companyColumnsImpl")
public class CompanyColumnsImpl extends Mongo<CompanyColumnsForm> implements
		CompanyColumnsDao {

	@Override
	public List<CompanyColumnsForm> getCompanyColumns() {
		Query query = new Query();
		return this.find(query, CompanyColumnsForm.class);
	}

	@Override
	public CompanyColumnsForm getCompanyColumnsByCompanyid(
			String companyid) {
		Query query = new Query();
		query.addCriteria(Criteria.where("companyid").is(companyid));
		return this.findOne(query, CompanyColumnsForm.class);
	}

}
