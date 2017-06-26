package com.scbd.oeminfo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.tag.PageIterator;
import com.scbd.oeminfo.dao.OemInfoDao;
import com.scbd.oeminfo.service.OemInfoService;



@Service("OemInfoServiceImpl")
public class OemInfoServiceImpl implements OemInfoService {

	
	@Autowired
	private OemInfoDao OemInfoDaoImpl;
	@Override
	public PageIterator QueryOemInfobycompanyId(int company_id, int start,
			int limit) {
		
		return OemInfoDaoImpl.QueryOemInfobycompanyId(company_id, start, limit);
	}

}
