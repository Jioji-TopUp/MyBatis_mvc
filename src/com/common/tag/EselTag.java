/**
 * 
 */
package com.common.tag;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.TagSupport;

/**
 * @author nick
 * 
 */
public class EselTag extends TagSupport {

	private PageContext pageContext = null;
	private String formName;
	private String page;
	private String cname;
	private String keyname;
	private String valuename;
	private String svalue;

	public String getSvalue() {
		return svalue;
	}

	public void setSvalue(String svalue) {
		this.svalue = svalue;
	}

	public String getValuename() {
		return valuename;
	}

	public void setValuename(String valuename) {
		this.valuename = valuename;
	}

	public String getKeyname() {
		return keyname;
	}

	public void setKeyname(String keyname) {
		this.keyname = keyname;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public String getFormName() {
		return formName;
	}

	public void setFormName(String formName) {
		this.formName = formName;
	}

	public PageContext getPageContext() {
		return pageContext;
	}

	@Override
	public void setPageContext(PageContext pageContext) {
		this.pageContext = pageContext;
	}

	public String getPage() {
		return page;
	}

	@Override
	public int doStartTag() throws JspException {
		List list = (List) pageContext.getRequest().getAttribute(formName);
		String tempstr = svalue;
		// String namex = (String)pageContext.getRequest().getAttribute(cname);
		JspWriter writer = pageContext.getOut();
		try {
			writer.print("<select width=1000px name=" + cname + ">");
			for (int i = 0; i < list.size(); i++) {
				HashMap hm = (HashMap) list.get(i);

				// Map.Entry entry = (Map.Entry) iter.next();
				// if (entry.getKey().toString().equals(keyname))
				if (!tempstr.equals(hm.get(keyname).toString())) {
					String tmpstr = "<option value=\"" + hm.get(keyname) + "\">" + hm.get(valuename) + "</option>";
					writer.print(tmpstr);
				} else {

					String tmpstr = "<option selected value=\"" + hm.get(keyname) + "\">" + hm.get(valuename)
							+ "</option>";
					writer.print(tmpstr);
				}

			}
			writer.print("</select>");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;

	}

}
