package com.scbd.boardinfo.dao;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.common.tag.PageIterator;
import com.scbd.boardinfo.form.BoardInfoForm;




@MapperScan
public interface BoardInfoDao {
	
	public PageIterator QueryBoardInfobycompanyId(int company_id,int start,int limit) ;
	

	public PageIterator QueryBoardInfobyboardname(BoardInfoForm BoardInfo,int start,int limit);
}
