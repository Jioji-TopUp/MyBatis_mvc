package com.scbd.pdfjx.form;




import org.springframework.data.mongodb.core.mapping.Document;






@Document(collection = "mongo_pdf")
public class pdfjxForm  {
	
	String _id;
	public String get_id() {
		return _id;
	}
	public void set_id(String _id) {
		this._id = _id;
	}
	public String getTYPE() {
		return TYPE;
	}
	public void setTYPE(String tYPE) {
		TYPE = tYPE;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTIME() {
		return TIME;
	}
	public void setTIME(String tIME) {
		TIME = tIME;
	}
	String TYPE;
	String date;
	String TIME;
	
   
    
    

}
