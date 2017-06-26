package com.scbd.pythonconfig.dao.impl;




import java.util.List;
import java.util.regex.Pattern;

import org.springframework.data.mongodb.core.aggregation.TypedAggregation;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

import com.common.mongo.Mongo;
import com.common.tag.PageIterator;




import com.scbd.pythonconfig.dao.PythonConfigDao;
import com.scbd.pythonconfig.form.PythonConfigForm;


@Repository("PythonConfigDaoImpl")
public  class PythonConfigDaoImpl extends Mongo<PythonConfigForm> implements PythonConfigDao {

	
	





	@Override
	public PythonConfigForm QueryPythonConfigById(String _id) {
		Query query = new Query();
		query.addCriteria(Criteria.where("_id").is(_id));
		return this.findOne(query, PythonConfigForm.class);
	}
	
	@Override
	public PageIterator QueryPythonConfigByremarks(String remarks,int start, int limit) {
		Query query = new Query();
		query.addCriteria(Criteria.where("pseudodeletion").is(0).andOperator(Criteria.where("pythonremarks").regex(remarks)));
		return  this.queryListPage(query, start,limit, PythonConfigForm.class);
	}

	@Override
	public PageIterator PythonConfigPagination(int start, int limit) {
		Query query = new Query();
		query.addCriteria(Criteria.where("pseudodeletion").is(0));
		return  this.queryListPage(query, start,limit, PythonConfigForm.class);
	}

	@Override
	public void AddPythonConfig(PythonConfigForm PythonConfig) {
		this.insert(PythonConfig);
		
	}

	@Override
	public void UpdatePythonConfig(PythonConfigForm PythonConfig) {
		Query query = new Query();
		query.addCriteria(Criteria.where("_id").is(PythonConfig.get_id()));
		Update u = new Update();
		u.set("pythonurl", PythonConfig.getPythonurl());
		u.set("pythoncompanyname", PythonConfig.getPythoncompanyname());
		u.set("pythoncompanyid", PythonConfig.getPythoncompanyid());
		u.set("pythonremarks", PythonConfig.getPythonremarks());
		u.set("pythonkey", PythonConfig.getPythonkey());

		this.update(query, u, PythonConfigForm.class);
		
	}

	@Override
	public void DeletePythonConfig(String _id) {
		Query query = new Query();
		query.addCriteria(Criteria.where("_id").is(_id));
		Update u = new Update();
		u.set("pseudodeletion", 100);
		u.set("pythonstate", 0);
		this.update(query, u, PythonConfigForm.class);
		
	}

	@Override
	public void SuspendPythonConfig(String _id,int pythonstate) {
		int ss;
		if(pythonstate==0)
		{
			ss=1;}
		else{
			ss=0;}
		Query query = new Query();
		query.addCriteria(Criteria.where("_id").is(_id));
		Update u = new Update();
		u.set("pythonstate", ss);
		this.update(query, u, PythonConfigForm.class);
		
	}


}
