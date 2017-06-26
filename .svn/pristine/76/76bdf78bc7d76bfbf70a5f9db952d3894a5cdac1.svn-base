package com.common.tag;

import java.io.IOException;

import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.JspTag;
import javax.servlet.jsp.tagext.SimpleTag;

/**
 * 显示星级
 * 
 * @author user
 * 
 */
public class StatusTag implements SimpleTag {

	private PageContext pageContext = null;
	private String status;

	@Override
	public void doTag() throws JspException, IOException {
		JspWriter out = pageContext.getOut();
		// 判断获得的值

		StringBuffer sb = new StringBuffer();
		if (status.equals("1")) {
			sb.append("启用");
		}
		if (status.equals("2")) {
			sb.append("禁用");
		}
		if (status.equals("0")) {
			sb.append("删除");
		}
		out.println(sb.toString());
	}

	@Override
	public JspTag getParent() {
		return null;
	}

	@Override
	public void setJspBody(JspFragment jspBody) {

	}

	@Override
	public void setJspContext(JspContext pc) {
		this.pageContext = (PageContext) pc;
	}

	@Override
	public void setParent(JspTag parent) {

	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
