package com.scbd.staffinfo.dao.impl;

import org.springframework.stereotype.Repository;

import com.common.mybatis.Mybatis;
import com.common.tag.PageIterator;
import com.scbd.staffinfo.dao.StaffInfoDao;
import com.scbd.staffinfo.form.StaffInfoForm;

@Repository("staffInfoDaoImpl")
public class StaffInfoDaoImpl extends Mybatis<StaffInfoForm> implements StaffInfoDao{

	@Override
	public PageIterator QueryStaffInfobycompanyId(int company_id, int start,int limit) {
		
		return this.getPageListByLimit("StaffInfo.StaffInfobycompanyId", company_id, start, limit);
	}

	@Override
	public PageIterator QueryStaffInfobystaffname(StaffInfoForm StaffInfo,
			int start, int limit) {
		return this.getPageListByLimit("StaffInfo.QueryStaffInfobystaffname", StaffInfo, start, limit);
	}


}
