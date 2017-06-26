package com.common.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class PageTag extends TagSupport {
	public final static String URL = "URL";
	public final static String COUNT = "COUNT";
	public final static String START = "START";
	public final static String TOTALCOUNT = "TOTALCOUNT";
	public final static String NEXTPAGE = "NEXTPAGE";
	public final static String DISPLAY = "DISPLAY";

	private String formName;
	private String page;

	@Override
	public int doStartTag() throws JspException {
		StringBuffer url = new StringBuffer(page);
		if (page.indexOf("?") < 0) {
			url.append("?");
		} else {
			url.append("&");
		}

		PageIterator it = null;
		try {
			it = (PageIterator) pageContext.getRequest().getAttribute(formName);
			if (it == null) {
				throw new Exception();
			}
		} catch (Exception e) {
			throw new JspException(e);
		}

		int start = it.getStart();
		int totalCount = it.getAllCount();
		int count = it.getCount();
		url.append("count=").append(count);

		java.util.Map param = it.getParameterMap();
		if (param != null) {
			java.util.Iterator iter = param.keySet().iterator();
			while (iter.hasNext()) {
				String key = iter.next().toString();
				String value = (String) param.get(key);
				if (value != null && value.trim().length() > 0 && !key.equals("start") && !key.equals("count")) {
					url.append("&");
					url.append(key).append("=");
					// url.append(value);
					try {
						url.append(java.net.URLEncoder.encode(value, "UTF-8"));
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}

		String nextpage = "";
		if (it.isNextPageAvailable()) {
			nextpage = NEXTPAGE;
		}

		pageContext.setAttribute(URL, url.toString());
		pageContext.setAttribute(START, Integer.toString(start));
		pageContext.setAttribute(COUNT, Integer.toString(count));
		pageContext.setAttribute(TOTALCOUNT, Integer.toString(totalCount));
		pageContext.setAttribute(NEXTPAGE, nextpage);

		int currentPage = (start / count) + 1;
		if (totalCount <= 0 || ((currentPage == 1) && (!it.isNextPageAvailable()))) {
			pageContext.setAttribute(DISPLAY, "false");
		} else {
			pageContext.setAttribute(DISPLAY, "true");
		}

		return (EVAL_BODY_INCLUDE);
	}

	@Override
	public int doEndTag() throws JspException {
		return (EVAL_PAGE);
	}

	@Override
	public void release() {
		super.release();
	}

	public String getFormName() {
		return formName;
	}

	public void setFormName(String formName) {
		this.formName = formName;
	}

	public String getPage() {
		return this.page;
	}

	public void setPage(String page) {
		this.page = page;
	}
}