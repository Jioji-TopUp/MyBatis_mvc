package com.scbd.oeminfo.form;

import org.apache.ibatis.type.Alias;

@Alias(value = "OemInfo")
public class OemInfoForm {
	
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCompany_id() {
		return company_id;
	}
	public void setCompany_id(int company_id) {
		this.company_id = company_id;
	}
	public String getOem_company() {
		return oem_company;
	}
	public void setOem_company(String oem_company) {
		this.oem_company = oem_company;
	}
	public String getOem_name() {
		return oem_name;
	}
	public void setOem_name(String oem_name) {
		this.oem_name = oem_name;
	}
	public String getOem_time() {
		return oem_time;
	}
	public void setOem_time(String oem_time) {
		this.oem_time = oem_time;
	}
	public String getOem_type() {
		return oem_type;
	}
	public void setOem_type(String oem_type) {
		this.oem_type = oem_type;
	}
	int id;
	int company_id;
	String oem_company;
	String oem_name;
	String oem_time;
	String oem_type;
	

}
