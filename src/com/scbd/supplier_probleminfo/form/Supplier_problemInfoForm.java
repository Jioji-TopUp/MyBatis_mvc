package com.scbd.supplier_probleminfo.form;

import org.apache.ibatis.type.Alias;

@Alias("Supplier_problemInfo")
public class Supplier_problemInfoForm {
	
	int id;
	String supplier_sort;
	String supplier_product;
	String supplier_reason;
	String supplier_url;
	String supplier_title;
	int company_id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSupplier_sort() {
		return supplier_sort;
	}
	public void setSupplier_sort(String supplier_sort) {
		this.supplier_sort = supplier_sort;
	}
	public String getSupplier_product() {
		return supplier_product;
	}
	public void setSupplier_product(String supplier_product) {
		this.supplier_product = supplier_product;
	}
	public String getSupplier_reason() {
		return supplier_reason;
	}
	public void setSupplier_reason(String supplier_reason) {
		this.supplier_reason = supplier_reason;
	}
	public String getSupplier_url() {
		return supplier_url;
	}
	public void setSupplier_url(String supplier_url) {
		this.supplier_url = supplier_url;
	}
	public String getSupplier_title() {
		return supplier_title;
	}
	public void setSupplier_title(String supplier_title) {
		this.supplier_title = supplier_title;
	}
	public int getCompany_id() {
		return company_id;
	}
	public void setCompany_id(int company_id) {
		this.company_id = company_id;
	}
	
	

}
