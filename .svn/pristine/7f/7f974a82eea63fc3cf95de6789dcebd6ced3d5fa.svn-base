package com.common.tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class CurrentTag extends TagSupport {
	private boolean disp = false;

	@Override
	public int doStartTag() throws JspException {
		String startStrs = (String) pageContext.getAttribute(PageTag.START);
		int start = Integer.parseInt(startStrs);
		String countStrs = (String) pageContext.getAttribute(PageTag.COUNT);
		int count = Integer.parseInt(countStrs);
		String allCountStrs = (String) pageContext.getAttribute(PageTag.TOTALCOUNT);
		int allCount = Integer.parseInt(allCountStrs);
		if (allCount > 0) {
			disp = true;
		} else {
			disp = false;
		}
		int numPages = 0;
		if (allCount != count) {
			numPages = (int) Math.ceil((double) allCount / (double) count);
		} else {
			numPages = 1;
		}
		int currentPage = (start / count) + 1;
		StringBuffer buf = new StringBuffer(100);
		buf.append("<div class=\"row pageIterator\">");
		// buf.append("<div class=\"col-sm-5\">");
		// buf.append("<div id=\"sample-table-2_info\" class=\"dataTables_info\">");
		// buf.append("共<font color=blue>").append(allCountStrs).append("</font>条记录");
		// buf.append("<font color=red>").append(currentPage).append("</font>");
		// buf.append("/");
		// buf.append("<font color=blue>").append(numPages).append("</font>页");
		// buf.append("</div></div><div class=\"col-sm-7\"><div style=\"width:100%; text-align:right;\"><ul class=\"pagination\">");
		buf.append("<div class='col-sm-12'><ul class='pagination'>");
		JspWriter writer = pageContext.getOut();
		try {
			if (disp)
				writer.print(buf.toString());
			else {
			}
		} catch (IOException e) {
			throw new JspException("CurrentTag error");
		}

		return (EVAL_BODY_INCLUDE);

	}

	@Override
	public int doEndTag() throws JspException {

		return (EVAL_PAGE);

	}
}
