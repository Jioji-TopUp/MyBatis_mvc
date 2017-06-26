package com.scbd.staffinfo.dao;

import org.mybatis.spring.annotation.MapperScan;

import com.common.tag.PageIterator;
import com.scbd.staffinfo.form.StaffInfoForm;

@MapperScan
public interface StaffInfoDao {

	public PageIterator QueryStaffInfobycompanyId(int company_id,int start,int limit) ;

	public PageIterator QueryStaffInfobystaffname(StaffInfoForm StaffInfo,int start,int limit);
	
}

