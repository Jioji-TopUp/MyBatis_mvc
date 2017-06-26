package com.common.tag;

import java.io.IOException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class PrevTag extends TagSupport {

	private boolean disp = false;

	private String name = null;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		// System.out.println("===PrevTag==setName==="+name);
		this.name = name;
	}

	@Override
	public int doStartTag() throws JspException {

		String display = (String) pageContext.getAttribute(PageTag.DISPLAY);
		if ((display != null) && (!display.equals("")) && (display.equals("true"))) {
			disp = true;
		} else {
			disp = false;
		}

		if (disp) {
			String startStrs = (String) pageContext.getAttribute(PageTag.START);
			int start = Integer.parseInt(startStrs);
			String url = (String) pageContext.getAttribute(PageTag.URL);
			String countStrs = (String) pageContext.getAttribute(PageTag.COUNT);
			int count = Integer.parseInt(countStrs);

			StringBuffer buf = new StringBuffer(100);
			// Print out a left arrow if necessary
			if (start > 0) {
				buf.append("<li><a class=\"disabled\" href=\"");
				buf.append(url);
				buf.append("&start=0");
				buf.append("\">");
				buf.append("<<首页</a> ");
				buf.append("<li><a href=\"");
				buf.append(url);
				buf.append("&start=");
				buf.append((start - count));
				buf.append("\">");
				buf.append("<<上一页</a></li>");

			}
			HttpServletResponse response = (HttpServletResponse) pageContext.getResponse();
			JspWriter writer = pageContext.getOut();
			try {
				writer.print(response.encodeURL(buf.toString()));
			} catch (IOException e) {
				throw new JspException("PreTag error");
			}
		}
		return (EVAL_BODY_INCLUDE);

	}

	/**
	 * Render the end of the hyperlink.
	 * 
	 * @exception JspException
	 *                if a JSP exception has occurred
	 */
	@Override
	public int doEndTag() throws JspException {
		return (EVAL_PAGE);
	}

	@Override
	public void release() {
		super.release();
		disp = false;
	}
}
