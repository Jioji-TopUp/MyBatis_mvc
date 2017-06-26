package com.scbd.pdfjx.dao;





import org.mybatis.spring.annotation.MapperScan;

import com.scbd.pdfjx.form.pdfjxForm;





@MapperScan
public interface pdfjxDao {
	
	public pdfjxForm QuerypdfjxBytime(String time);
	
	
	
}
