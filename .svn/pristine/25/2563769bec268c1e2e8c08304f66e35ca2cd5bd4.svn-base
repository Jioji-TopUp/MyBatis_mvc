package com.scbd.companyinformation.form;

import java.util.ArrayList;

import javax.persistence.ElementCollection;

import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

@Document(collection = "mongo_CompanyInfoForm")
public class CompanyInfoForm {

	String companyname;
	
	@ElementCollection
	ArrayList<ReportForm> report;
	
	public String getCompanyname() {
		return companyname;
	}


	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}


	public ArrayList<ReportForm> getReport() {
		return report;
	}


	public void setReport(ArrayList<ReportForm> report) {
		this.report = report;
	}

	
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
