package com.scbd.staffinfo.service;

import org.springframework.transaction.annotation.Transactional;

import com.common.tag.PageIterator;
import com.scbd.staffinfo.form.StaffInfoForm;

@Transactional
public interface StaffInfoService {
	public PageIterator QueryStaffInfobycompanyId(int company_id,int start,int limit);

	public PageIterator QueryStaffInfobystaffname(StaffInfoForm StaffInfo,int start,int limit);
}
