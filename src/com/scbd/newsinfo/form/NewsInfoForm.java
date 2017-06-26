package com.scbd.newsinfo.form;

import org.apache.ibatis.type.Alias;

@Alias(value = "NewsInfo")
public class NewsInfoForm {
	int id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNews_title() {
		return news_title;
	}
	public void setNews_title(String news_title) {
		this.news_title = news_title;
	}
	public String getNews_url() {
		return news_url;
	}
	public void setNews_url(String news_url) {
		this.news_url = news_url;
	}
	public int getCompany_id() {
		return company_id;
	}
	public void setCompany_id(int company_id) {
		this.company_id = company_id;
	}
	String news_title;
	String news_url;
	int company_id;
	String news_website;
	public String getNews_website() {
		return news_website;
	}
	public void setNews_website(String news_website) {
		this.news_website = news_website;
	}
	public String getNews_time() {
		return news_time;
	}
	public void setNews_time(String news_time) {
		this.news_time = news_time;
	}
	public String getNews_posttime() {
		return news_posttime;
	}
	public void setNews_posttime(String news_posttime) {
		this.news_posttime = news_posttime;
	}
	String news_time;
	String news_posttime;


}
