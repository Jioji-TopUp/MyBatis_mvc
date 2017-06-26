package com.common.util;

import org.apache.ibatis.type.Alias;

@Alias(value = "dataSourseForm")
public class DataSourseForm {

	String jdbcDriver;
	public String getJdbcDriver() {
		return jdbcDriver;
	}
	public void setJdbcDriver(String jdbcDriver) {
		this.jdbcDriver = jdbcDriver;
	}
	public String getDbUrl() {
		return dbUrl;
	}
	public void setDbUrl(String dbUrl) {
		this.dbUrl = dbUrl;
	}
	public String getDbUsername() {
		return dbUsername;
	}
	public void setDbUsername(String dbUsername) {
		this.dbUsername = dbUsername;
	}
	public String getDbPassword() {
		return dbPassword;
	}
	public void setDbPassword(String dbPassword) {
		this.dbPassword = dbPassword;
	}
	String dbUrl;
	String dbUsername;
    String dbPassword;
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
