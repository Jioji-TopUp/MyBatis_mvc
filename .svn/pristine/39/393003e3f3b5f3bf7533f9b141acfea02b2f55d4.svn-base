package com.common.tag;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class NextTag extends TagSupport {

	private boolean disp = false;

	private String name = null;

	public String getName() {
		return name;
	}

	public void setName(String name) {
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

			String allCountStrs = (String) pageContext.getAttribute(PageTag.TOTALCOUNT);
			int allCount = Integer.parseInt(allCountStrs);

			boolean nextPage = false;
			String nextPageStrs = (String) pageContext.getAttribute(PageTag.NEXTPAGE);
			if ((nextPageStrs != null) && (!nextPageStrs.equals("")))
				nextPage = true;

			StringBuffer buf = new StringBuffer(100);

			int numPages = 0;
			if (allCount != count) {
				numPages = (int) Math.ceil((double) allCount / (double) count);
			} else {
				numPages = 1;
			}

			if ((allCount > (start + count)) && nextPage) {

				buf.append("<li><a href=\"");
				buf.append(url);
				buf.append("&start=");
				buf.append((start + count));
				buf.append("\">");
				buf.append("下一页>></a></li>");
				// --尾页
				buf.append("<li><a href=\"");
				buf.append(url);
				buf.append("&start=");
				buf.append((allCount - count));
				buf.append("\" >");
				buf.append("末页>></a></li>");
				// --
			} else {
				buf.append("");
			}

			buf.append(" <script> function gotoForm() { var gotovalue=(document.all.gotoValue.value-1)*"
					+ count
					+ ";  if((document.all.gotoValue.value<="
					+ numPages
					+ ")&&(document.all.gotoValue.value>0)){locat='"
					+ url
					+ "&start='+gotovalue+'';  location=locat; }else{ alert('超出范围,请输入正确的页码！'); return false;}} </script>");
			buf.append("<li><a href='#'><input type='text' name='gotoValue' size='3' value='' style='height:19px;line-height: 0px;'></a></li><li><a href=\"#\" onClick=\"javascript:gotoForm();\">GO</a></li>");

			buf.append("</div></div></ul>");
			HttpServletResponse response = (HttpServletResponse) pageContext.getResponse();
			JspWriter writer = pageContext.getOut();
			try {
				writer.print(response.encodeURL(buf.toString()));
			} catch (IOException e) {
				throw new JspException("NextTag error");
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
