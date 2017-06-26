package com.scbd.dataimport.dao.impl;

import java.util.List;

import org.springframework.data.mongodb.core.aggregation.TypedAggregation;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import com.common.mongo.Mongo;
import com.scbd.dataimport.dao.CompanyDataDao;
import com.scbd.dataimport.dao.CompanyFilesDao;
import com.scbd.dataimport.form.CompanyColumnsForm;
import com.scbd.dataimport.form.CompanyDataForm;
import com.scbd.dataimport.form.CompanyFilesForm;

@Repository("companyFilesImpl")
public class CompanyFilesImpl extends Mongo<CompanyFilesForm> implements
		CompanyFilesDao {

	@Override
	public List<CompanyFilesForm> getCompanyFiles(String companyid) {
		Query query = new Query();
		query.addCriteria(Criteria.where("companyid").is(companyid));
		return this.find(query, CompanyFilesForm.class);
	}

	@Override
	public List<CompanyFilesForm> getAllCompanyFiles() throws Exception{
			TypedAggregation<CompanyFilesForm> agg = TypedAggregation.newAggregation(
					CompanyFilesForm.class,
					TypedAggregation.group("companyid")
							.count().as("totalfiles").last("companyname").as("companyname").max("posttime").as("posttime")
					);
			List<CompanyFilesForm> t=this.group(agg, CompanyFilesForm.class);
			return t;
		
	}

	@Override
	public List<CompanyFilesForm> getAllCompanyFilesGroupByDate()
			throws Exception {
		TypedAggregation<CompanyFilesForm> agg = TypedAggregation.newAggregation(
				CompanyFilesForm.class,
				TypedAggregation.project("companyname","posttime").and("posttime").project("substr", 0,10).as("posttime"),
				TypedAggregation.group("posttime")
						.count().as("totalfiles").last("posttime").as("posttime")
				);
		List<CompanyFilesForm> t=this.group(agg, CompanyFilesForm.class);
		return t;
	}

	@Override
	public List<CompanyFilesForm> getCompanyFilesList() throws Exception {
		TypedAggregation<CompanyFilesForm> agg = TypedAggregation.newAggregation(
				CompanyFilesForm.class,
				TypedAggregation.project("companyname","companyid").and("companyid"),
				TypedAggregation.match(Criteria.where("companyid").type(2)),
				TypedAggregation.group("companyid")
						.count().as("totalfiles").last("companyid").as("companyid")
						.last("companyname").as("companyname")
				);
		List<CompanyFilesForm> t=this.group(agg, CompanyFilesForm.class);
		return t;
	}

	@Override
	public List<CompanyFilesForm> getCompanyFilesByDate(String date) throws Exception {
		Query query = new Query();
		query.addCriteria(Criteria.where("posttime").regex(date+ ".*"));
		return this.find(query, CompanyFilesForm.class);
	}

	@Override
	public List<CompanyFilesForm> getAllCompanyFilesGroupByCondition(
			String key, String value) throws Exception {
		TypedAggregation<CompanyFilesForm> agg = TypedAggregation.newAggregation(
				CompanyFilesForm.class,
				TypedAggregation.project("companyname","companyid",key),
				TypedAggregation.group(key)
						.count().as("totalfiles").last("companyid").as("companyid")
						.last("companyname").as("companyname")
				);
		List<CompanyFilesForm> t=this.group(agg, CompanyFilesForm.class);
		return t;
	}

	@Override
	public List<CompanyFilesForm> getAllCompanyFilesByCondition(String key,
			String value) throws Exception {
		Query query = new Query();
		query.addCriteria(Criteria.where(key).is(value));
		return this.find(query, CompanyFilesForm.class);
	}

	@Override
	public List<CompanyFilesForm> getCompanyFilesByCompanyIdAndKeywords(
			String companyid, String keywords) throws Exception {
		Query query = new Query();
		query.addCriteria(Criteria.where("companyid").is(companyid));
		query.addCriteria(Criteria.where("mainkeywords").regex(".*"+keywords+ ".*"));
		return this.find(query, CompanyFilesForm.class);
	}

	@Override
	public void addCompanyFiles(CompanyFilesForm companyFilesForm) {
		this.insert(companyFilesForm);		
	}

}
