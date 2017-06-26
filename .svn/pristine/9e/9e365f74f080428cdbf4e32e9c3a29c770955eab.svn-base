package com.scbd.pythonconfig.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scbd.pythonconfig.dao.impl.Python_ConditionDaoImpl;
import com.scbd.pythonconfig.form.Python_ConditionForm;
import com.scbd.pythonconfig.service.Python_ConditionService;


@Service("python_ConditionServiceImpl")
public class Python_ConditionServiceImpl implements Python_ConditionService {
	@Autowired
	private Python_ConditionDaoImpl python_ConditionDaoImpl;



	@Override
	public List<Python_ConditionForm> getPython_CondithionAll() {
		
		return python_ConditionDaoImpl.getPython_CondithionAll();
	}
}
