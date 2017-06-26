package com.scbd.dataimport.dao;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.scbd.dataimport.form.CompanyColumnsForm;

@MapperScan
public interface CompanyColumnsDao {

	public List<CompanyColumnsForm> getCompanyColumns();
	
	public CompanyColumnsForm getCompanyColumnsByCompanyid(String companyid);
}
