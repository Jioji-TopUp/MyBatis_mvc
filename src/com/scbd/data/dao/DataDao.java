/**
 * 
 */
package com.scbd.data.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;

import com.common.tag.PageIterator;
import com.scbd.data.form.DataForm;

/**
 * @author Administrator
 *
 */
//查询xml
@MapperScan
public interface DataDao {
	/**
	 * 根据name 和密码查询
	 * @param loginName
	 * @param passWord
	 * @return
	 */
	
	public List<DataForm>displayData();
	
	
	public DataForm getData(String loginName,String passWord );
	public int addData(String loginName,String passWord );
	public int deleteData(String loginName,String passWord );
	public int updateData(String loginName,String passWord );
	
	/**
	 * 翻页查询 
	 * @return
	 */
	public PageIterator getdisplayDataList(int start,int limit);
}
