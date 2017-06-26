package com.scbd.newsinfo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.tag.PageIterator;
import com.scbd.newsinfo.dao.NewsInfoDao;
import com.scbd.newsinfo.service.NewsInfoService;


@Service("NewsInfoServiceImpl")
public class NewsInfoServiceImpl implements NewsInfoService {

	
	@Autowired
	private NewsInfoDao NewsInfoDaoImpl;
	@Override
	public PageIterator QueryNewsInfobycompanyId(int company_id, int start,
			int limit) {
		
		return NewsInfoDaoImpl.QueryNewsInfobycompanyId(company_id, start, limit);
	}

}
