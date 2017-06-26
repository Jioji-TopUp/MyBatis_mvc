package com.scbd.pythonconfig.dao;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.common.tag.PageIterator;
import com.scbd.pythonconfig.form.Python_ConditionForm;

@MapperScan
public interface Python_ConditionDao {


	public List<Python_ConditionForm> getPython_CondithionAll();

}
