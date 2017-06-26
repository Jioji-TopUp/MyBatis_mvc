/**
 * 
 */
package com.scbd.login.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scbd.login.Dao.LoginDao;
import com.scbd.login.form.LoginForm;
import com.scbd.login.service.LoginService;

/**
 * @author dong
 *
 */
@Service("loginService")
public class LoginServiceImpl implements LoginService {

	@Autowired
	private LoginDao loginDaoImpl;
	
	@Override
	public String getLogin(String loginName,String passWord) {
		
	Object obj=loginDaoImpl.getLogin(loginName, passWord);
	return obj.toString();

}
}