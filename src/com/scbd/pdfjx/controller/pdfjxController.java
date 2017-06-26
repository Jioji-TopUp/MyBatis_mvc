package com.scbd.pdfjx.controller;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import java.util.List;

import javax.servlet.http.HttpServletResponse;



import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.common.controller.BaseController;

import com.scbd.common.form.ControllerOperatorForm;

import com.scbd.pdfjx.form.pdfjxForm;
import com.scbd.pdfjx.service.pdfjxService;


@Component
@Controller
public class pdfjxController<T> extends BaseController {
	
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	@Autowired
	private pdfjxService pdfjxServiceImpl;

	
	
	
	//根据id查看招标详情页
	@RequestMapping(value = "/QuerypdfjxBytime")
	public String QuerypdfjxBytime(
			@RequestParam("time") String time,
			HttpServletResponse response) {
	
		ControllerOperatorForm s = new ControllerOperatorForm();
		s.setOperator("query");
		s.setObj("QueryTenderInfoById");
		String json = null;
		try {
			JSONObject jsonObject = new JSONObject();
			pdfjxForm  t=pdfjxServiceImpl.QuerypdfjxBytime(time);
			if (t == null) {
				s.setCode("1");
				jsonObject = JSONObject.fromObject(s);
			} else {
				List<pdfjxForm> a = new ArrayList<pdfjxForm>();
				a.add(t);
				jsonObject.element("list", a);
			}
			 json = jsonObject.toString();
			response.setContentType("text/xml");
			response.getWriter().write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	

	
	
	
	
	


		
		

	
}
