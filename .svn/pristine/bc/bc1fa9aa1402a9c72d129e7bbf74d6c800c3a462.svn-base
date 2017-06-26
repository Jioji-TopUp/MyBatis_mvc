package com.scbd.dataimport.dao;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.common.tag.PageIterator;
import com.scbd.dataimport.form.CompanyDataForm;
import com.scbd.dataimport.form.CompanyFilesForm;

@MapperScan
public interface CompanyDataDao {
	
	public List<CompanyDataForm> getCompanyData(String companyid);
	
	public List<CompanyDataForm> getCompanyDataByDate(String date) throws Exception;
	
	public List<CompanyDataForm> getAllCompanyDataGroupByDate() throws Exception;
	
	public List<CompanyDataForm> getAllCompanyDataGroupByCondition(String key,String value) throws Exception;
	
	public List<CompanyDataForm> getAllCompanyDataByCondition(String key,String value) throws Exception;
	
	public List<CompanyDataForm> getCompanyDataGroupByCompanyid() throws Exception;
	
	public List<CompanyDataForm> getCompanyDataByCompanyIdAndKeywords(String companyid,String keywords) throws Exception;
	
	public PageIterator getcompanybyurl(String url,int start,int count);
	
	public void DeleteCompanyData(String _id);
}
