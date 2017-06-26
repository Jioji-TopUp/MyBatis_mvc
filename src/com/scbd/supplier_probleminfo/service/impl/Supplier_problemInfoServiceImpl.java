package com.scbd.supplier_probleminfo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.tag.PageIterator;
import com.scbd.supplier_probleminfo.dao.impl.Supplier_problemInfoDaoImpl;
import com.scbd.supplier_probleminfo.service.Supplier_problemInfoService;

@Service("supplier_problemInfoServiceImpl")
public class Supplier_problemInfoServiceImpl implements Supplier_problemInfoService {
	
	@Autowired
	Supplier_problemInfoDaoImpl supplier_problemInfoServiceImpl;

	@Override
	public PageIterator QuerySupplier_problemInfobycompanyId(int company_id,
			int start, int limit) {
		return supplier_problemInfoServiceImpl.QuerySupplier_problemInfobycompanyId(company_id, start, limit);
	}
}
