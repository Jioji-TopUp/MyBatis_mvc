package com.scbd.dataimport.dao.impl;

import java.util.List;

import org.springframework.data.mongodb.core.aggregation.TypedAggregation;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

import com.common.mongo.Mongo;
import com.common.tag.PageIterator;
import com.scbd.dataimport.dao.CompanyDataDao;
import com.scbd.dataimport.form.CompanyColumnsForm;
import com.scbd.dataimport.form.CompanyDataForm;
import com.scbd.dataimport.form.CompanyFilesForm;


@Repository("companyDataImpl")
public class CompanyDataImpl extends Mongo<CompanyDataForm> implements
		CompanyDataDao {

	@Override
	public List<CompanyDataForm> getCompanyData(String companyid) {
		Query query = new Query();
		query.addCriteria(Criteria.where("companyid").is(companyid));
		return this.find(query, CompanyDataForm.class);
	}

	@Override
	public List<CompanyDataForm> getAllCompanyDataGroupByDate() throws Exception {
		TypedAggregation<CompanyDataForm> agg = TypedAggregation.newAggregation(
				CompanyDataForm.class,
				TypedAggregation.project("companyid","posttime").and("posttime").project("substr", 0,10).as("posttime"),
				TypedAggregation.group("posttime")
						.count().as("totalnum").last("posttime").as("posttime")
				);
		List<CompanyDataForm> t=this.group(agg, CompanyDataForm.class);
		return t;
	}

	@Override
	public List<CompanyDataForm> getCompanyDataByDate(String date)
			throws Exception {
		Query query = new Query();
		query.addCriteria(Criteria.where("posttime").regex(date+ ".*"));
		return this.find(query, CompanyDataForm.class);
	}

	@Override
	public List<CompanyDataForm> getAllCompanyDataGroupByCondition(String key,
			String value) throws Exception {
		TypedAggregation<CompanyDataForm> agg = TypedAggregation.newAggregation(
				CompanyDataForm.class,
				TypedAggregation.project("companyid","companyname","posttime",key),
				TypedAggregation.group(key)
						.count().as("totalnum").last(key).as(key).last("companyname").as("companyname")
						.last("posttime").as("posttime")
						.last("companyid").as("companyid")
				);
		List<CompanyDataForm> t=this.group(agg, CompanyDataForm.class);
		return t;
	}

	@Override
	public List<CompanyDataForm> getAllCompanyDataByCondition(String key,
			String value) throws Exception {
		Query query = new Query();
		query.addCriteria(Criteria.where(key).is(value));
		return this.find(query, CompanyDataForm.class);
	}

	@Override
	public List<CompanyDataForm> getCompanyDataGroupByCompanyid()
			throws Exception {
		TypedAggregation<CompanyDataForm> agg = TypedAggregation.newAggregation(
				CompanyDataForm.class,
				TypedAggregation.project("companyid","companyname","posttime","mcolumn"),
				TypedAggregation.group("companyid")
						.count().as("totalnum").last("companyname").as("companyname")
						.last("posttime").as("posttime")
						.last("companyid").as("companyid")
						.last("mcolumn").as("mcolumn")
				);
		List<CompanyDataForm> t=this.group(agg, CompanyDataForm.class);
		return t;
	}

	@Override
	public List<CompanyDataForm> getCompanyDataByCompanyIdAndKeywords(
			String companyid,String keywords) throws Exception {
		Query query = new Query();
		query.addCriteria(Criteria.where("companyid").is(companyid));
		query.addCriteria(Criteria.where("mainkeywords").regex(".*"+keywords+ ".*"));
		return this.find(query, CompanyDataForm.class);
	}

	@Override
	public PageIterator getcompanybyurl(String url, int start, int count) {
		Query query = new Query();
		query.addCriteria(Criteria.where("url").is(url).andOperator(Criteria.where("pseudodeletion").is(0)));
		return this.queryListPage(query, start, count, CompanyDataForm.class);
	}

	@Override
	public void DeleteCompanyData(String _id) {
		Query query = new Query();
		query.addCriteria(Criteria.where("_id").is(_id));
		Update u = new Update();
		u.set("pseudodeletion", 100);
		this.update(query, u, CompanyDataForm.class);
		
	}

}
