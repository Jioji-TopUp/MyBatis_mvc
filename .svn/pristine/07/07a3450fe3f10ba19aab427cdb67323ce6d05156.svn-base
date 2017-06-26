package com.common.tag;

import java.io.IOException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class IndexTag extends TagSupport {

	private boolean disp = false;

	@Override
	public int doStartTag() throws JspException {

		String display = (String) pageContext.getAttribute(PageTag.DISPLAY);
		if ((display != null) && (!display.equals("")) && (display.equals("true"))) {
			disp = true;
		} else {
			disp = false;
		}

		if (disp) {
			StringBuffer buf = new StringBuffer(100);
			String startStrs = (String) pageContext.getAttribute(PageTag.START);
			int start = Integer.parseInt(startStrs);
			String url = (String) pageContext.getAttribute(PageTag.URL);
			String countStrs = (String) pageContext.getAttribute(PageTag.COUNT);
			int count = Integer.parseInt(countStrs);

			String allCountStrs = (String) pageContext.getAttribute(PageTag.TOTALCOUNT);
			int allCount = Integer.parseInt(allCountStrs);

			int numPages = 0;
			if (allCount != count) {
				numPages = (int) Math.ceil((double) allCount / (double) count);
			} else {
				numPages = 1;
			}

			int currentPage = (start / count) + 1;
			int lo = currentPage - 3;
			int m = (int) Math.floor(((double) numPages - (double) 1) / 4);

			int k = (int) Math.floor(((double) currentPage - (double) 1) / 4);
			int hi = currentPage + 4;
			if (lo > 1) {
				buf.append("<li class=\"disabled\">");
				buf.append("<li><a href=\"");
				buf.append(url);
				buf.append("&start=");
				buf.append((lo - 2) * count);
				buf.append("\">");
				buf.append("...</a></li>");
				int lo3 = currentPage;
				int n = 0;
				while (k != 0 && lo3 <= (8 + 4 * (k - 1)) && lo3 >= (6 + 4 * (k - 1)) && n < 4) {
					buf.append("<li class=\"\">");
					buf.append("<a href=\"").append(url);
					buf.append("&start=");
					buf.append((5 + 4 * (k - 1) + n - 1) * count);
					buf.append("\">");
					buf.append(5 + 4 * (k - 1) + n);
					buf.append("</a>");
					buf.append("</li>");
					n++;
					lo3--;

				}

			}

			// Print the page numbers before the current page
			else {
				int lo3 = lo + 2;
				int n = 1;
				while (lo3 < 4 && lo3 >= 1 && n < 4) {
					buf.append("<li>");
					buf.append("<a href=\"").append(url);
					buf.append("&start=");
					buf.append(((n - 1) * count));
					buf.append("\">");
					buf.append(n);
					buf.append("</a>");
					buf.append("</li>");
					lo3--;
					n++;
				}
			}

			// Print the current page
			buf.append("<li class=\"active\"><a href='#'>");
			buf.append(currentPage);
			buf.append("</a></li>");
			currentPage++;

			while (currentPage >= 6 + 4 * (k - 1) && currentPage <= 9 + 4 * (k - 1) && currentPage <= numPages) {
				buf.append("<li>");
				buf.append("<a href=\"").append(url);
				buf.append("&start=");
				buf.append(((currentPage - 1) * count));
				buf.append("\">");
				buf.append(currentPage);
				buf.append("</a></li>");
				currentPage++;
			}

			while (currentPage <= 5 && currentPage <= numPages) {
				buf.append("<li>");
				buf.append("<a href=\"").append(url);
				buf.append("&start=");
				buf.append(((currentPage - 1) * count));
				buf.append("\">");
				buf.append(currentPage);
				buf.append("</a></li>");
				currentPage++;
			}

			if (hi < numPages && (currentPage > 5)) {
				buf.append("<li><a href=\"");
				buf.append(url);
				buf.append("&start=");
				buf.append(((hi - 1) * count));
				buf.append("\">");
				buf.append("...</a></li>");
			}

			else if (hi >= numPages && hi < 5 + 4 * m && (numPages - 1) % 4 != 0) {
				buf.append("<li><a href=\"");
				buf.append(url);
				buf.append("&start=");
				buf.append(((5 + 4 * k - 1) * count));
				buf.append("\">");
				buf.append("...</a></li>");
			}

			// Print page numbers after the current page
			HttpServletResponse response = (HttpServletResponse) pageContext.getResponse();
			JspWriter writer = pageContext.getOut();
			try {
				writer.print(response.encodeURL(buf.toString()));
			} catch (IOException e) {
				throw new JspException("PrevTag error");
			}
		}
		return (EVAL_BODY_INCLUDE);

	}

	@Override
	public int doEndTag() throws JspException {
		return (EVAL_PAGE);
	}
}
