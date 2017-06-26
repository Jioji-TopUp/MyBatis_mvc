package com.scbd.oeminfo.dao;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.common.tag.PageIterator;




@MapperScan
public interface OemInfoDao {
	
	public PageIterator QueryOemInfobycompanyId(int company_id,int start,int limit);
	

}
