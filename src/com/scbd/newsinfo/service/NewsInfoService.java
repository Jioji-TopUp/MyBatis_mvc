package com.scbd.newsinfo.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.common.tag.PageIterator;


@Transactional
public interface NewsInfoService {
	
	public PageIterator QueryNewsInfobycompanyId(int company_id,int start,int limit);

}
