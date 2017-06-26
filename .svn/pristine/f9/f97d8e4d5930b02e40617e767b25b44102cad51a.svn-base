package com.scbd.dataimport.service.impl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.tag.PageIterator;
import com.scbd.dataimport.dao.CompanyColumnsDao;
import com.scbd.dataimport.dao.CompanyDataDao;
import com.scbd.dataimport.dao.CompanyFilesDao;
import com.scbd.dataimport.form.CompanyColumnsForm;
import com.scbd.dataimport.form.CompanyDataForm;
import com.scbd.dataimport.form.CompanyFilesForm;
import com.scbd.dataimport.service.CompanyDetailService;

@Service("companyDetailServiceImpl")
public class CompanyDetailServiceImpl implements CompanyDetailService {

	@Autowired
	private CompanyColumnsDao companyColumnsImpl;
	
	@Autowired
	private CompanyDataDao companyDataImpl;
	
	@Autowired
	private CompanyFilesDao companyFilesImpl;

	@Override
	public List<CompanyColumnsForm> getCompanyColumns() {
		return companyColumnsImpl.getCompanyColumns();
	}

	@Override
	public List<CompanyDataForm> getCompanyData(String companyid) {
		return companyDataImpl.getCompanyData(companyid);
	}

	@Override
	public CompanyColumnsForm getCompanyColumnsByCompanyid(
			String companyid) {
		return companyColumnsImpl.getCompanyColumnsByCompanyid(companyid);
	}

	@Override
	public List<CompanyFilesForm> getCompanyFiles(String companyid) {
		return companyFilesImpl.getCompanyFiles(companyid);
	}

	@Override
	public List<CompanyFilesForm> getAllCompanyFiles() throws Exception{
		return companyFilesImpl.getAllCompanyFiles();
	}

	@Override
	public List<CompanyFilesForm> getAllCompanyFilesGroupByDate()
			throws Exception {
		return companyFilesImpl.getAllCompanyFilesGroupByDate();
	}

	@Override
	public List<CompanyDataForm> getAllCompanyDataGroupByDate()
			throws Exception {		
		return companyDataImpl.getAllCompanyDataGroupByDate();
	}

	@Override
	public List<CompanyFilesForm> getCompanyFilesList() throws Exception {		
		return companyFilesImpl.getCompanyFilesList();
	}

	@Override
	public List<CompanyDataForm> getCompanyDataByDate(String date) throws Exception{
		return companyDataImpl.getCompanyDataByDate(date);
	}

	@Override
	public List<CompanyFilesForm> getCompanyFilesByDate(String date) throws Exception {
		return companyFilesImpl.getCompanyFilesByDate(date);
	}

	@Override
	public List<CompanyFilesForm> getAllCompanyFilesGroupByCondition(
			String key, String value) throws Exception {
		return companyFilesImpl.getAllCompanyFilesGroupByCondition(key, value);
	}

	@Override
	public List<CompanyDataForm> getAllCompanyDataGroupByCondition(String key,
			String value) throws Exception {
		return companyDataImpl.getAllCompanyDataGroupByCondition(key, value);
	}

	@Override
	public List<CompanyFilesForm> getAllCompanyFilesByCondition(String key,
			String value) throws Exception {
		return companyFilesImpl.getAllCompanyFilesByCondition(key, value);
	}

	@Override
	public List<CompanyDataForm> getAllCompanyDataByCondition(String key,
			String value) throws Exception {
		return companyDataImpl.getAllCompanyDataByCondition(key, value);
	}

	@Override
	public List<CompanyDataForm> getCompanyDataGroupByCompanyid()
			throws Exception {
		return companyDataImpl.getCompanyDataGroupByCompanyid();
	}

	@Override
	public List<CompanyDataForm> getCompanyDataByCompanyIdAndKeywords(
			String companyid,String keywords) throws Exception {
		return companyDataImpl.getCompanyDataByCompanyIdAndKeywords(companyid, keywords);
	}

	@Override
	public List<CompanyFilesForm> getCompanyFilesByCompanyIdAndKeywords(
			String companyid, String keywords) throws Exception {
		return companyFilesImpl.getCompanyFilesByCompanyIdAndKeywords(companyid, keywords);
	}

	@Override
	public PageIterator getcompanybyurl(String url, int start, int count) {
	
		return companyDataImpl.getcompanybyurl(url, start, count);
	}

	@Override
	public void DeleteCompanyData(String _id) {
		companyDataImpl.DeleteCompanyData(_id);
		
	}

	@Override
	public void addCompanyFiles(CompanyFilesForm companyFilesForm) {
		companyFilesImpl.addCompanyFiles(companyFilesForm);		
	}


	
}
