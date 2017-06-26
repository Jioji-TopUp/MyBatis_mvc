package com.scbd.newsinfo.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.common.mybatis.Mybatis;
import com.common.tag.PageIterator;
import com.scbd.newsinfo.dao.NewsInfoDao;
import com.scbd.newsinfo.form.NewsInfoForm;


@Repository("NewsInfoDaoImpl")
public class NewsInfoDaoImpl extends Mybatis<NewsInfoForm> implements NewsInfoDao {


	@Override
	public PageIterator QueryNewsInfobycompanyId(int company_id,int start,int limit) {
		
		return this.getPageListByLimit("NewsInfo.NewsInfobycompanyId", company_id, start, limit);
	}

}
