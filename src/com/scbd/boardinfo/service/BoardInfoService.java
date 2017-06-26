package com.scbd.boardinfo.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.common.tag.PageIterator;
import com.scbd.boardinfo.form.BoardInfoForm;


@Transactional
public interface BoardInfoService {
	
	public PageIterator QueryBoardInfobycompanyId(int company_id,int start,int limit);
	
	public PageIterator QueryBoardInfobyboardname(BoardInfoForm BoardInfo,int start,int limit);

}
