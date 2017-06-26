/**
 * 
 */
package com.scbd.login.Dao;

import org.mybatis.spring.annotation.MapperScan;

import com.common.tag.PageIterator;
import com.scbd.login.form.LoginForm;

/**
 * @author dong
 *
 */
@MapperScan
public interface LoginDao {
	/**
	 * 根据登陆名查询
	 * 返回1用户名错误
	 * 返回2密码错误
	 * 返回3正确
	 * @param loginName
	 * @return
	 */
	public String getLogin(String loginName,String passWord);
	
	
	
	
}
