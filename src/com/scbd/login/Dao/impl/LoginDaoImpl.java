/**
 * 
 */
package com.scbd.login.Dao.impl;

import org.springframework.stereotype.Repository;

import com.common.mybatis.Mybatis;
import com.common.tag.PageIterator;
import com.scbd.login.Dao.LoginDao;
import com.scbd.login.form.LoginForm;

/**
 * @author dong
 *
 */
@Repository("loginDaoImpl")
public class LoginDaoImpl extends Mybatis<LoginForm> implements LoginDao {

	
	/**
	 * 返回1用户名错误
	 * 返回2密码错误
	 * 返回3正确
	 */
	@Override
	public String getLogin(String loginName,String passWord) {
		Object obj= this.queryOne1("login.getLogin",loginName);
		if(obj==null){
			return "1";
		}else
		if(obj.toString().equals(passWord)){
			return "3";
		}else 
			return "2";
		
		//return this.queryOne("login.getLogin", loginName);
	}

	

}
