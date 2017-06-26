package com.scbd.companyinformation.controller;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;


import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.common.controller.BaseController;
import com.common.tag.PageIterator;
import com.scbd.common.form.ControllerOperatorForm;
import com.scbd.companyinformation.form.CompanyInfoForm;
import com.scbd.companyinformation.form.ReportForm;
import com.scbd.companyinformation.service.CompanyInfoService;

@Component
@Controller
public class CompanyInfoController<T> extends BaseController {
	
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	@Autowired
	private CompanyInfoService companyInfoServiceImpl;
	

	
	
	
	@RequestMapping(value = "/test")
	public String QueryOrderInfoByRentalinfoid1(
			HttpServletResponse response) {
		JSONObject jsonObject = new JSONObject();
		ControllerOperatorForm s = new ControllerOperatorForm();
		s.setOperator("select");
		s.setObj("QueryEvaluateInfoByRentalinfoId");
		try {
			CompanyInfoForm a=new CompanyInfoForm();
			a.setCompanyname("test");
			ReportForm t1=new ReportForm();
			t1.setIndex(100);
			t1.setTime("2017-03-30 00:00:00");
			t1.setTitle("ceshi");
			t1.setUnit("ceshiunit");
			
			ReportForm t2=new ReportForm();
			t1.setIndex(200);
			t1.setTime("2017-03-31 00:00:00");
			t1.setTitle("ceshi2");
			t1.setUnit("ceshiunit2");
			
			ArrayList<ReportForm> t=new ArrayList<ReportForm>();
			t.add(t1);
			t.add(t2);
			
			a.setReport(t);
			
			companyInfoServiceImpl.saveCompanyInfo(a);
			String json = jsonObject.toString();
			response.setContentType("text/xml");
			response.getWriter().write(json);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return null;
	}
	
}
