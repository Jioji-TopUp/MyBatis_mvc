package com.scbd.pythonconfig.service.impl;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.common.tag.PageIterator;
import com.scbd.pythonconfig.dao.PythonConfigDao;
import com.scbd.pythonconfig.form.PythonConfigForm;
import com.scbd.pythonconfig.service.PythonConfigService;


@Service("PythonConfigServiceImpl")
public class PythonConfigServiceImpl implements PythonConfigService {
	
	
	@Autowired
	private PythonConfigDao PythonConfigDaoImpl;

	

	@Override
	public PythonConfigForm QueryPythonConfigById(String _id) {
		
		return PythonConfigDaoImpl.QueryPythonConfigById(_id);
	}
	
	@Override
	public PageIterator QueryPythonConfigByremarks(String remarks, int start,
			int limit) {
		
		return PythonConfigDaoImpl.QueryPythonConfigByremarks(remarks, start, limit);
	}

	@Override
	public PageIterator PythonConfigPagination(int start, int limit) {
	
		return PythonConfigDaoImpl.PythonConfigPagination(start, limit);
	}

	@Override
	public void AddPythonConfig(PythonConfigForm PythonConfig) {
		PythonConfigDaoImpl.AddPythonConfig(PythonConfig);
		
	}

	@Override
	public void UpdatePythonConfig(PythonConfigForm PythonConfig) {
		PythonConfigDaoImpl.UpdatePythonConfig(PythonConfig);
		
	}

	@Override
	public void DeletePythonConfig(String _id) {
		PythonConfigDaoImpl.DeletePythonConfig(_id);
		
	}

	@Override
	public void SuspendPythonConfig(String _id, int pythonstate) {
		PythonConfigDaoImpl.SuspendPythonConfig(_id, pythonstate);
		
	}

	
	
	


	
}
