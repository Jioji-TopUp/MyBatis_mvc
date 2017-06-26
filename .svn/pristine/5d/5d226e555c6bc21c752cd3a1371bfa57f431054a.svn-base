package com.scbd.dataimport.dao;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.scbd.dataimport.form.CompanyDataForm;
import com.scbd.dataimport.form.CompanyFilesForm;

@MapperScan
public interface CompanyFilesDao {
	
	public void addCompanyFiles(CompanyFilesForm companyFilesForm);
	
	public List<CompanyFilesForm> getCompanyFiles(String companyid);
	
	public List<CompanyFilesForm> getAllCompanyFiles() throws Exception;
	
	public List<CompanyFilesForm> getAllCompanyFilesGroupByDate() throws Exception;
	
	public List<CompanyFilesForm> getCompanyFilesList() throws Exception;
	
	public List<CompanyFilesForm> getCompanyFilesByDate(String date) throws Exception; 
	
	public List<CompanyFilesForm> getAllCompanyFilesGroupByCondition(String key,String value) throws Exception;
	
	public List<CompanyFilesForm> getAllCompanyFilesByCondition(String key,String value) throws Exception;
	
	public List<CompanyFilesForm> getCompanyFilesByCompanyIdAndKeywords(String companyid,String keywords) throws Exception;
	
}
