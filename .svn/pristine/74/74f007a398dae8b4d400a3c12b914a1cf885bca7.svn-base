package com.scbd.boardinfo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.common.tag.PageIterator;
import com.scbd.boardinfo.dao.BoardInfoDao;
import com.scbd.boardinfo.form.BoardInfoForm;
import com.scbd.boardinfo.service.BoardInfoService;



@Service("BoardInfoServiceImpl")
public class BoardInfoServiceImpl implements BoardInfoService {

	
	@Autowired
	private BoardInfoDao BoardInfoDaoImpl;
	@Override
	public PageIterator QueryBoardInfobycompanyId(int company_id, int start,
			int limit) {
		
		return BoardInfoDaoImpl.QueryBoardInfobycompanyId(company_id, start, limit);
	}
	@Override
	public PageIterator QueryBoardInfobyboardname(BoardInfoForm BoardInfo, int start,
			int limit) {
		return BoardInfoDaoImpl.QueryBoardInfobyboardname(BoardInfo, start, limit);
	}

}
