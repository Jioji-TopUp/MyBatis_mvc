package com.scbd.supplier_probleminfo.dao.impl;

import org.springframework.stereotype.Repository;

import com.common.mybatis.Mybatis;
import com.common.tag.PageIterator;
import com.scbd.supplier_probleminfo.dao.Supplier_problemInfoDao;
import com.scbd.supplier_probleminfo.form.Supplier_problemInfoForm;

@Repository("supplier_problemInfoDaoImpl")
public class Supplier_problemInfoDaoImpl extends Mybatis<Supplier_problemInfoForm> implements Supplier_problemInfoDao{


	@Override
	public PageIterator QuerySupplier_problemInfobycompanyId(int company_id,int start, int limit) {
		System.out.println("Dao company_id, start, limit"+company_id+start+limit);

		return this.getPageListByLimit("Supplier_problemInfo.supplier_problemInfobycompanyId", company_id, start, limit);
	}
}
