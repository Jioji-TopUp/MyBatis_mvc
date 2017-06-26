package com.scbd.dataimport.form;

import java.util.List;

import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "mongo_CompanyData")
public class CompanyDataForm {

	String _id;
	public String get_id() {
		return _id;
	}


	public void set_id(String _id) {
		this._id = _id;
	}


	public List<DataColumnAndValueForm> getMcolumn() {
		return mcolumn;
	}


	public void setMcolumn(List<DataColumnAndValueForm> mcolumn) {
		this.mcolumn = mcolumn;
	}


	List<DataColumnAndValueForm> mcolumn;
	String companyname;
	public String getCompanyname() {
		return companyname;
	}


	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}


	String companyid;
	String posttime;
	String totalnum;
	
	public String getTotalnum() {
		return totalnum;
	}


	public void setTotalnum(String totalnum) {
		this.totalnum = totalnum;
	}


	public String getPosttime() {
		return posttime;
	}


	public void setPosttime(String posttime) {
		this.posttime = posttime;
	}


	public String getCompanyid() {
		return companyid;
	}


	public void setCompanyid(String companyid) {
		this.companyid = companyid;
	}

	String url;
	String mainkeywords;
	int pseudodeletion;

	public int getPseudodeletion() {
		return pseudodeletion;
	}


	public void setPseudodeletion(int pseudodeletion) {
		this.pseudodeletion = pseudodeletion;
	}


	public String getUrl() {
		return url;
	}


	public void setUrl(String url) {
		this.url = url;
	}


	public String getMainkeywords() {
		return mainkeywords;
	}


	public void setMainkeywords(String mainkeywords) {
		this.mainkeywords = mainkeywords;
	}


	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
