/**
 * 
 */
package com.scbd.data.service;

import java.util.List;

import com.common.tag.PageIterator;
import com.scbd.data.form.DataForm;

/**
 * @author Administrator
 *
 */
public interface DataService {
	
	public List<DataForm> displayData();
	
	public DataForm getData(String loginName,String passWord );
	public int addData(String loginName,String passWord );
	public int deleteData(String loginName, String passWord);
	public int updateData(String loginName, String passWord);
	
	public PageIterator getdisplayDataList(int start,int limit);
}
