/**
 * 
 */
package com.scbd.data.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.common.mybatis.Mybatis;
import com.common.tag.PageIterator;
import com.scbd.data.dao.DataDao;
import com.scbd.data.form.DataForm;
import com.scbd.login.form.LoginForm;

/**
 * @author Administrator
 *
 */
@Repository("dataDaoImpl")//数据持久化
public class DataDaoImpl extends Mybatis<DataForm> implements DataDao {

	@Override
	public DataForm getData(String loginName, String passWord) {
		
		DataForm d = new DataForm();
		d.setLogin_password(passWord);
		d.setLogin_username(loginName);
		
		return this.queryOne("data.getData",d);
	}
	@Override
	public int addData(String loginName, String passWord) {
		
		DataForm d = new DataForm();
		d.setLogin_password(passWord);
		d.setLogin_username(loginName);
		
		//return this.queryOne("data.addData",d);
		return this.save("data.addData",d);
		
	}
	@Override
	public int deleteData(String loginName, String passWord) {
		DataForm d = new DataForm();
		d.setLogin_password(passWord);
		d.setLogin_username(loginName);
		return this.remove("data.deleteData",d);
	}
	@Override
	public List<DataForm> displayData(){
		DataForm d = new DataForm();
		
		return this.queryList("data.displayData",d);
	}
	@Override
	public int updateData(String loginName, String passWord) {
		// TODO Auto-generated method stub
		DataForm d = new DataForm();
		d.setLogin_password(passWord);
		d.setLogin_username(loginName);
		return this.modify("data.updateData",d);
	}
	
	
	@Override
	public PageIterator getdisplayDataList(int start,int limit) {
		
		return this.getPageListByLimit("data.getdisplayDataList",null, start,limit);
	}
	

}
