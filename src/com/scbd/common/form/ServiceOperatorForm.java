package com.scbd.common.form;

import java.util.List;

public class ServiceOperatorForm {

	String operator;
	List<DatabaseOperatorForm> DatabaseOperatorForms;
	
	public List<DatabaseOperatorForm> getDatabaseOperatorForms() {
		return DatabaseOperatorForms;
	}

	public void setDatabaseOperatorForms(
			List<DatabaseOperatorForm> databaseOperatorForms) {
		DatabaseOperatorForms = databaseOperatorForms;
	}

	public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	public String getObj() {
		return obj;
	}

	public void setObj(String obj) {
		this.obj = obj;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	String obj;
	String code;
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
