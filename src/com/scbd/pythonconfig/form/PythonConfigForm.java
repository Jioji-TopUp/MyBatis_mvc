package com.scbd.pythonconfig.form;





import java.util.List;

import org.springframework.data.mongodb.core.mapping.Document;








@Document(collection = "mongo_PythonConfigForm")
public class PythonConfigForm  {
	

	public String get_id() {
		return _id;
	}
	public void set_id(String _id) {
		this._id = _id;
	}
	public String getPythonurl() {
		return pythonurl;
	}
	public void setPythonurl(String pythonurl) {
		this.pythonurl = pythonurl;
	}
	public String getPythoncompanyname() {
		return pythoncompanyname;
	}
	public void setPythoncompanyname(String pythoncompanyname) {
		this.pythoncompanyname = pythoncompanyname;
	}
	public String getPythoncompanyid() {
		return pythoncompanyid;
	}
	public void setPythoncompanyid(String pythoncompanyid) {
		this.pythoncompanyid = pythoncompanyid;
	}
	public String getPythonremarks() {
		return pythonremarks;
	}
	public void setPythonremarks(String pythonremarks) {
		this.pythonremarks = pythonremarks;
	}
	public String getPythontime() {
		return pythontime;
	}
	public void setPythontime(String pythontime) {
		this.pythontime = pythontime;
	}
	public List<KeyAndValueForm> getPythonkey() {
		return pythonkey;
	}
	public void setPythonkey(List<KeyAndValueForm> pythonkey) {
		this.pythonkey = pythonkey;
	}
	String _id;
	String pythonurl;
	String pythoncompanyname;
	String pythoncompanyid;
	String pythonremarks;
	String pythontime;
	List<KeyAndValueForm> pythonkey;
	int pythonstate;
	public int getPythonstate() {
		return pythonstate;
	}
	public void setPythonstate(int pythonstate) {
		this.pythonstate = pythonstate;
	}
	public int getPseudodeletion() {
		return pseudodeletion;
	}
	public void setPseudodeletion(int pseudodeletion) {
		this.pseudodeletion = pseudodeletion;
	}
	int pseudodeletion;

    
    

}
