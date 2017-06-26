package com.scbd.newsinfo.dao;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.common.tag.PageIterator;




@MapperScan
public interface NewsInfoDao {
	
	public PageIterator QueryNewsInfobycompanyId(int company_id,int start,int limit);
	

}
