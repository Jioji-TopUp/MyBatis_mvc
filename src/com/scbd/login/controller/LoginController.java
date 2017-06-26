/**
 * 
 */
package com.scbd.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.common.controller.BaseController;
import com.scbd.login.form.LoginForm;
import com.scbd.login.service.LoginService;

/**
 * @author dong
 * 
 */
@Controller
public final class LoginController extends BaseController {
	@Autowired
	private LoginService loginService;

	@RequestMapping(value = "/log")
	public String getLogin(String loginName, String passWord) {
		
		
		String result = "/page/loginsuc";
		String result2 = "/pages/login/index";
		
		String str=loginService.getLogin(loginName, passWord);
		if(str.equals("2"))
		return result;
		else
		return result2;
	}
}
