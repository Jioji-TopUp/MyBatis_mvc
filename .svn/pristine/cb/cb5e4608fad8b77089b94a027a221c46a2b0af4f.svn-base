package com.scbd.oeminfo.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.common.mybatis.Mybatis;
import com.common.tag.PageIterator;
import com.scbd.oeminfo.dao.OemInfoDao;
import com.scbd.oeminfo.form.OemInfoForm;



@Repository("OemInfoDaoImpl")
public class OemInfoDaoImpl extends Mybatis<OemInfoForm> implements OemInfoDao {


	@Override
	public PageIterator QueryOemInfobycompanyId(int company_id,int start,int limit) {
		
		return this.getPageListByLimit("OemInfo.OemInfobycompanyId", company_id, start, limit);
	}

}
