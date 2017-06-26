package com.common.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.MessageFormat;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.StringUtils;

import com.alibaba.fastjson.JSONObject;

/**
 * 控制跳转父类
 * @author Liu Jinglei 
 *
 */
public abstract class BaseController {
	private static Logger log = Logger.getLogger(BaseController.class);

	@Value("${pagesize}")
	protected int pageSize;

	public HttpServletRequest request = null;

	@Resource
	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public boolean isPhoneAccess() {
		boolean result = false;
		String Agent = request.getHeader("User-Agent");
		StringBuffer requestUrl = request.getRequestURL();
		String domain = requestUrl.delete(requestUrl.length() - request.getRequestURI().length(), requestUrl.length())
				.toString();
		if (Agent.indexOf("Android") > 0 || Agent.indexOf("SymbianOS") > 0 || Agent.indexOf("iPhone OS") > 0
				|| Agent.indexOf("Windows Phone") > 0) {
			result = true;
		}
		return result;
	}

	public String getFullURL() {
		String queryStr = request.getQueryString();
		StringBuffer url = request.getRequestURL();
		if (!StringUtils.isEmpty(queryStr)) {
			url.append("?").append(queryStr);
		}
		return url.toString();
	}

	public void sendString(String str, HttpServletResponse response) {
		try {
			response.setContentType("Application/json;charset=UTF-8");
			response.setHeader("Cache-Control", "no-cache");
			response.getWriter().print(str);
			response.getWriter().flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void sendJSONObject(JSONObject jsonStr, HttpServletResponse response) {
		try {
			response.setContentType("Application/json;charset=UTF-8");
			response.setHeader("Cache-Control", "no-cache");
			response.getWriter().print(jsonStr);
			response.getWriter().flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int getStart(int start, HttpServletRequest request) {

		int result = 0;
		if (request.getParameter("start") == null || request.getParameter("start").equals("")) {
			result = start;
		} else
			result = new Integer(request.getParameter("start"));
		return result;
	}

	public int getCount(int count, HttpServletRequest request) {

		int result = 0;
		if (request.getParameter("count") == null || request.getParameter("count").equals("")) {
			result = count;
		} else
			result = new Integer(request.getParameter("count"));
		return result;
	}

	public String pageListKey() {
		String search = request.getParameter("search");
		if (search == null) {
			search = "";
		} else {
			try {
				search = new String(search.getBytes("ISO-8859-1"), "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			request.setAttribute("search", search);
		}
		return search;
	}
}