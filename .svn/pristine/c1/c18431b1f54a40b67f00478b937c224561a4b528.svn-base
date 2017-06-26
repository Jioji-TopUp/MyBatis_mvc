package com.scbd.supplier_probleminfo.controller;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.common.tag.PageIterator;
import com.scbd.common.form.ControllerOperatorForm;
import com.scbd.supplier_probleminfo.service.Supplier_problemInfoService;

@Component
@Controller
public class Supplier_problemInfoController {

	@Autowired
	Supplier_problemInfoService supplier_problemInfoService;
	
	@RequestMapping(value="QuerySupplier_problemInfobycompanyId")
	public String QuerySupplier_problemInfobycompanyId(
			@RequestParam("company_id") int company_id,
			@RequestParam("start") int start,
			@RequestParam("limit") int limit,
			HttpServletResponse response
			){
		JSONObject jsonobject = new JSONObject();
		PageIterator t;
		ControllerOperatorForm s = new ControllerOperatorForm();
		s.setOperator("query");
		s.setObj("QueryBoardInfobycompanyId");
		
		try{
			System.out.println("company_id, start, limit"+company_id+start+limit);
			t = supplier_problemInfoService.QuerySupplier_problemInfobycompanyId(company_id, start, limit);
			if(t.getAllCount()==0){
				s.setCode("1");
				jsonobject = JSONObject.fromObject(s);
			}else{
				jsonobject.element("list", t.getModelList());
				jsonobject.put("count", t.getAllCount());
			}
		
		String json = jsonobject.toString();
		response.setContentType("text/xml");
		response.getWriter().write(json);
		
		}catch(Exception e){
			e.printStackTrace();
		}
		supplier_problemInfoService.QuerySupplier_problemInfobycompanyId(company_id, start, limit);
		return null;
	}
}
