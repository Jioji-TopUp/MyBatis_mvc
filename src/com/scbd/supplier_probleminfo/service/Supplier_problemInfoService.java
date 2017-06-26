package com.scbd.supplier_probleminfo.service;

import org.springframework.transaction.annotation.Transactional;

import com.common.tag.PageIterator;

@Transactional
public interface Supplier_problemInfoService {

	public PageIterator QuerySupplier_problemInfobycompanyId(int company_id,int start, int limit);

}
