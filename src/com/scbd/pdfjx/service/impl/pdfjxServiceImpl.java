package com.scbd.pdfjx.service.impl;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.scbd.pdfjx.dao.pdfjxDao;
import com.scbd.pdfjx.form.pdfjxForm;
import com.scbd.pdfjx.service.pdfjxService;



@Service("pdfjxServiceImpl")
public class pdfjxServiceImpl implements pdfjxService {
	
	
	@Autowired
	private pdfjxDao pdfjxImpl;

	@Override
	public pdfjxForm QuerypdfjxBytime(String time) {
		
		return pdfjxImpl.QuerypdfjxBytime(time);
	}

	
	


	
}
