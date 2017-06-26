package com.scbd.dataimport.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.common.tag.PageIterator;
import com.scbd.dataimport.form.CompanyColumnsForm;
import com.scbd.dataimport.form.CompanyDataForm;
import com.scbd.dataimport.form.CompanyFilesForm;



@Transactional
public interface CompanyDetailService {

	public void addCompanyFiles(CompanyFilesForm companyFilesForm);
	
	public List<CompanyColumnsForm> getCompanyColumns();
	
	public CompanyColumnsForm getCompanyColumnsByCompanyid(String companyid);
	
	public List<CompanyDataForm> getCompanyDataGroupByCompanyid() throws Exception;
	
	public List<CompanyDataForm> getCompanyData(String companyid);
	
	public List<CompanyDataForm> getCompanyDataByDate(String date) throws Exception;
	
	public List<CompanyDataForm> getAllCompanyDataGroupByDate() throws Exception;
	
	public List<CompanyFilesForm> getCompanyFilesList() throws Exception;
	
	public List<CompanyFilesForm> getCompanyFiles(String companyid);
	
	public List<CompanyFilesForm> getAllCompanyFiles() throws Exception;
	
	public List<CompanyFilesForm> getCompanyFilesByDate(String date) throws Exception;
	
	public List<CompanyFilesForm> getAllCompanyFilesGroupByDate() throws Exception;
	
	public List<CompanyFilesForm> getAllCompanyFilesGroupByCondition(String key,String value) throws Exception;
	
	public List<CompanyDataForm> getAllCompanyDataGroupByCondition(String key,String value) throws Exception;
	
	public List<CompanyFilesForm> getAllCompanyFilesByCondition(String key,String value) throws Exception;
	
	public List<CompanyDataForm> getAllCompanyDataByCondition(String key,String value) throws Exception;
	
	public List<CompanyDataForm> getCompanyDataByCompanyIdAndKeywords(String companyid,String keywords) throws Exception;
	
	public List<CompanyFilesForm> getCompanyFilesByCompanyIdAndKeywords(String companyid,String keywords) throws Exception;
	
	public PageIterator getcompanybyurl(String url,int start,int count) ;
	public void DeleteCompanyData(String _id);
}
