package com.scbd.staffinfo.controller;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.common.controller.BaseController;
import com.common.tag.PageIterator;
import com.scbd.boardinfo.form.BoardInfoForm;
import com.scbd.common.form.ControllerOperatorForm;
import com.scbd.staffinfo.form.StaffInfoForm;
import com.scbd.staffinfo.service.StaffInfoService;

@Component
@Controller
public class StaffController extends BaseController{
	
	@Autowired
	StaffInfoService staffInfoService;
	
	@RequestMapping(value="QueryStaffInfobycompanyId")
	public  String QueryStaffInfobycompanyId(
			@RequestParam("start") int start,
			@RequestParam("company_id") int company_id,
			@RequestParam("limit") int limit,
			HttpServletResponse response
			){
		
		JSONObject jsonObject = new JSONObject();
		PageIterator t;
		ControllerOperatorForm s = new ControllerOperatorForm();
		s.setOperator("query");
		s.setObj("QueryStaffInfobycompanyId");
		try {
			t = staffInfoService.QueryStaffInfobycompanyId(company_id, start, limit);
			if (t.getAllCount() == 0) {
				s.setCode("1");
				jsonObject = JSONObject.fromObject(s);
			} else {
				jsonObject.element("list", t.getModelList());
				jsonObject.put("count", t.getAllCount());
			}
			String json = jsonObject.toString();
			response.setContentType("text/xml");
			response.getWriter().write(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null; 
		
	}
	
	
	
	@RequestMapping(value = "/QueryStaffInfobystaffname")
	public String QueryStaffInfobystaffname(
			@RequestParam("start") int start,
			@RequestParam("StaffInfo") StaffInfoForm StaffInfo,
			@RequestParam("limit") int limit,
			
			HttpServletResponse response) {
		
		
		JSONObject jsonObject = new JSONObject();
		PageIterator t;
		ControllerOperatorForm s = new ControllerOperatorForm();
		s.setOperator("query");
		s.setObj("QueryStaffInfobystaffname");
		try {
			t = staffInfoService.QueryStaffInfobystaffname(StaffInfo, start, limit);
			if (t.getAllCount() == 0) {
				s.setCode("1");
				jsonObject = JSONObject.fromObject(s);
			} else {
				jsonObject.element("list", t.getModelList());
				jsonObject.put("count", t.getAllCount());
			}
			String json = jsonObject.toString();
			response.setContentType("text/xml");
			response.getWriter().write(json);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return null;
	}
	
	
	
	/**
	 * 组合能筛选能所有分页
	 * 
	 * @param start
	 * @param interval
	 * @param userid
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/StaffInfoPaginationAndName")
	public String StaffInfoPaginationAndName(@RequestParam("company_id") int company_id,@RequestParam("resources_name") String resources_name,@RequestParam("start") int start,
			@RequestParam("limit") int limit,HttpServletResponse response) throws Exception {
		JSONObject jsonObject = new JSONObject();
		PageIterator t;
		 StaffInfoForm StaffInfo=new StaffInfoForm();
		 StaffInfo.setCompany_id(company_id);
		if (resources_name == "" ) {
			t =  staffInfoService.QueryStaffInfobycompanyId(company_id, start, limit);
		} else  {
			StaffInfo.setStaff_name(resources_name);
			t = staffInfoService.QueryStaffInfobystaffname(StaffInfo, start, limit);
		}


		if (t.getAllCount() == 0) {
			ControllerOperatorForm s = new ControllerOperatorForm();
			s.setOperator("pagination");
			s.setObj("StaffInfoPaginationAndName");
			s.setCode("1");
			jsonObject = JSONObject.fromObject(s);

		} else {
			jsonObject.element("list", t.getModelList());
			jsonObject.put("count", t.getAllCount());
		}

		String json = jsonObject.toString();
		try {
			response.setContentType("text/xml");
			response.getWriter().write(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}
	
}
