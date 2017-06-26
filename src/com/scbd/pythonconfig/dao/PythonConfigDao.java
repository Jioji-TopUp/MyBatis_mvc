package com.scbd.pythonconfig.dao;





import org.mybatis.spring.annotation.MapperScan;

import com.common.tag.PageIterator;

import com.scbd.pythonconfig.form.PythonConfigForm;






@MapperScan
public interface PythonConfigDao {
	
	/*利用id查看爬虫配置*/
	public PythonConfigForm QueryPythonConfigById(String _id);
	/*利用备注查看爬虫配置*/
	public  PageIterator  QueryPythonConfigByremarks(String remarks,int start,int limit);
	/*爬虫配置分页*/
	public  PageIterator  PythonConfigPagination(int start,int limit);
	/*配置信息添加*/
	public void AddPythonConfig(PythonConfigForm PythonConfig);
	/*配置信息修改*/
	public void UpdatePythonConfig(PythonConfigForm PythonConfig);
	/*配置信息删除*/
	public void DeletePythonConfig(String _id);
	/*配置信息暂停*/
	public void SuspendPythonConfig(String _id,int pythonstate);


	
	
	
}
