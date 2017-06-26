/**
 * 
 */
package com.scbd.data.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.tag.PageIterator;
import com.scbd.data.dao.DataDao;
import com.scbd.data.form.DataForm;
import com.scbd.data.service.DataService;

/**
 * @author Administrator
 *
 */
@Service("DataService")
public class DataServiceImpl implements DataService {

	@Autowired
	private DataDao DataDaoImpl;
	
	@Override
	public DataForm getData(String loginName, String passWord) {
		// TODO Auto-generated method stub
		return DataDaoImpl.getData(loginName, passWord);
	}

	@Override
	public int addData(String loginName, String passWord) {
		// TODO Auto-generated method stub
		return DataDaoImpl.addData(loginName, passWord);
	}

	@Override
	public int deleteData(String loginName, String passWord) {
		// TODO Auto-generated method stub
		return DataDaoImpl.deleteData(loginName, passWord);
	}

	@Override
	public List<DataForm> displayData(){
		// TODO Auto-generated method stub
		return DataDaoImpl.displayData();
	}

	@Override
	public int updateData(String loginName, String passWord) {
		// TODO Auto-generated method stub
		return DataDaoImpl.updateData(loginName, passWord);
	}

	@Override
	public PageIterator getdisplayDataList(int start,int limit) {
		
		return DataDaoImpl.getdisplayDataList(start,limit);
	}

}
