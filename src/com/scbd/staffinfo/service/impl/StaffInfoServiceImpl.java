package com.scbd.staffinfo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.tag.PageIterator;
import com.scbd.staffinfo.dao.impl.StaffInfoDaoImpl;
import com.scbd.staffinfo.form.StaffInfoForm;
import com.scbd.staffinfo.service.StaffInfoService;

@Service("staffInfoService")
public class StaffInfoServiceImpl implements StaffInfoService {
	
	@Autowired
	StaffInfoDaoImpl staffInfoDaoImpl;
	
	@Override
	public PageIterator QueryStaffInfobycompanyId(int company_id,int start,int limit){
		
		return staffInfoDaoImpl.QueryStaffInfobycompanyId(company_id, start, limit);
	}

	@Override
	public PageIterator QueryStaffInfobystaffname(StaffInfoForm StaffInfo,
			int start, int limit) {
		return staffInfoDaoImpl.QueryStaffInfobystaffname(StaffInfo, start, limit);
	}
}
