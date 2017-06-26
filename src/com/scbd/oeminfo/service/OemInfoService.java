package com.scbd.oeminfo.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.common.tag.PageIterator;


@Transactional
public interface OemInfoService {
	
	public PageIterator QueryOemInfobycompanyId(int company_id,int start,int limit);

}
