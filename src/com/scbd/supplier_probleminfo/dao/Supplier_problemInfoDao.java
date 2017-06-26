package com.scbd.supplier_probleminfo.dao;

import org.mybatis.spring.annotation.MapperScan;

import com.common.tag.PageIterator;

@MapperScan
public interface Supplier_problemInfoDao {
	
	public PageIterator QuerySupplier_problemInfobycompanyId(int company_id,int start,int limit);
}
