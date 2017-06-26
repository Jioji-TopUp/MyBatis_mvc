package com.scbd.pdfjx.dao.impl;





import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;

import org.springframework.stereotype.Repository;

import com.common.mongo.Mongo;





import com.scbd.pdfjx.dao.pdfjxDao;
import com.scbd.pdfjx.form.pdfjxForm;

@Repository("pdfjxImpl")
public  class pdfjxImpl extends Mongo<pdfjxForm> implements pdfjxDao {

	
	

	


	@Override
	public pdfjxForm QuerypdfjxBytime(String time) {
		Query query = new Query();
		query.addCriteria(Criteria.where("TIME").is(time));
		return this.findOne(query, pdfjxForm.class);
	}

	

}
