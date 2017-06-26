package com.scbd.pythonconfig.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.common.mybatis.Mybatis;
import com.common.tag.PageIterator;
import com.scbd.pythonconfig.dao.Python_ConditionDao;
import com.scbd.pythonconfig.form.Python_ConditionForm;

@Repository("python_ConditionDaoImpl")
public class Python_ConditionDaoImpl extends Mybatis<Python_ConditionForm> implements Python_ConditionDao {




	@Override
	public List<Python_ConditionForm> getPython_CondithionAll() {
		
		return this.queryList("Python_Condition.getPython_ConditionAll",null);

	}

}
