package com.scbd.pythonconfig.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.common.controller.BaseController;
import com.scbd.dataimport.form.CompanyFilesForm;
import com.scbd.pythonconfig.form.Python_ConditionForm;
import com.scbd.pythonconfig.service.impl.Python_ConditionServiceImpl;

@Controller
public class Python_ConditionController extends BaseController {

	@Autowired
	private Python_ConditionServiceImpl python_ConditionServiceImpl;
	
	
	
	@RequestMapping(value="/getPython_CondithionAll")
	public void getPython_CondithionAll(
			HttpServletResponse response
			){

		JSONObject jsonobject = new JSONObject();
		try{
			List<Python_ConditionForm> pList = python_ConditionServiceImpl.getPython_CondithionAll();
			jsonobject.element("value", pList);
			
			String json = jsonobject.toString();
			response.setContentType("text/xml");
			response.getWriter().write(json);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	

}
