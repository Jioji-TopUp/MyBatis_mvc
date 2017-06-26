package com.scbd.boardinfo.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.common.mybatis.Mybatis;
import com.common.tag.PageIterator;
import com.scbd.boardinfo.dao.BoardInfoDao;
import com.scbd.boardinfo.form.BoardInfoForm;



@Repository("BoardInfoDaoImpl")
public class BoardInfoDaoImpl extends Mybatis<BoardInfoForm> implements BoardInfoDao {


	
	@Override
	public PageIterator QueryBoardInfobycompanyId(int company_id,int start,int limit) {
		
		return this.getPageListByLimit("BoardInfo.BoardInfobycompanyId", company_id, start, limit);
	}

	@Override
	public PageIterator QueryBoardInfobyboardname(BoardInfoForm BoardInfo, int start,
			int limit) {
		return this.getPageListByLimit("BoardInfo.QueryBoardInfobyboardname", BoardInfo, start, limit);
	}



}
