/**
 * 
 */
package com.scbd.data.controller;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.common.controller.BaseController;
import com.common.tag.PageIterator;
import com.scbd.common.form.ControllerOperatorForm;
import com.scbd.company.form.CompanyForm;
import com.scbd.company.service.CompanyService;
import com.scbd.company.service.impl.CompanyServiceImpl;
import com.scbd.data.form.DataForm;
import com.scbd.data.service.DataService;

/**
 * @author Administrator
 *
 */
@Controller
public class DataController extends BaseController {

	@Autowired
	public DataService dataService;
	
	
	@RequestMapping(value="/dat")
	public String getData(String loginName,String passWord){
		
		String result ="/page/data";
		DataForm dat1=dataService.getData(loginName, passWord);
		request.setAttribute("dat1", dat1);
		return result;
	}
	
//	@RequestMapping(value="/add")
//	public String addData(String loginName,String passWord){
//		
//		String result ="/page/addsuc";
//		int add=dataService.addData(loginName, passWord);
//		//DataForm dat1=dataService.getData(loginName, passWord);
//		request.setAttribute("add", add);
//		return result;
//	}
	
	
	//添加 
	@RequestMapping(value = "/add")
	public String addData(String loginName,String passWord,
	//		@ModelAttribute("companyInfo") CompanyForm companyInfo,
			HttpServletResponse response) {
		String result ="/page/addsuc";
		ControllerOperatorForm s = new ControllerOperatorForm();
		s.setOperator("insert");
		s.setObj("AddTenderInfo");
		String json = null;
		try {
			int add=dataService.addData(loginName, passWord);
			//request.setAttribute("add", add);
			//CompanyServiceImpl.AddcompanyInfo(companyInfo);
			
			
			s.setCode("0");
			
		} catch (Exception e) {
			s.setCode("1");
			e.printStackTrace();
		}

		try {
			JSONObject jsonObject = JSONObject.fromObject(s);
			json = jsonObject.toString();
			response.setContentType("text/xml");
			response.getWriter().write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
		//request.setAttribute("add", add);
		return null;
	}
	
	
	
	
	
	//删除 
	@RequestMapping(value="/delete")
	public String deleteData(String loginName,String passWord,HttpServletResponse response){
		
		String result ="/page/deletesuc";
		ControllerOperatorForm s = new ControllerOperatorForm();
		s.setOperator("delete");
		s.setObj("deleteTenderInfo");
		String json = null;
		try {
			int delete=dataService.deleteData(loginName, passWord);
			//request.setAttribute("delete",delete);
			s.setCode("0");
			
		} catch (Exception e) {
			s.setCode("1");
			e.printStackTrace();
		}

		try {
			JSONObject jsonObject = JSONObject.fromObject(s);
			json = jsonObject.toString();
			response.setContentType("text/xml");
			response.getWriter().write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
		//request.setAttribute("add", add);
		return result;
	}
		
	
	
	
	//显示 
	@RequestMapping(value="/display")
	public String displayData(HttpServletResponse response){
		
		String result ="/page/displaysuc";
		ControllerOperatorForm s = new ControllerOperatorForm();
		s.setOperator("display");
		s.setObj("displayTenderInfo");
		String json = null;
		
		try {
			List<DataForm> t=dataService.displayData();
			request.setAttribute("t", t);
			s.setCode("0");
			
		} catch (Exception e) {
			s.setCode("1");
			e.printStackTrace();
		}

		try {
			JSONObject jsonObject = JSONObject.fromObject(s);
			json = jsonObject.toString();
			response.setContentType("text/xml");
			response.getWriter().write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
		//request.setAttribute("add", add);
		return result;
	}
		
		
		//List<DataForm> t=dataService.displayData();
		
		//request.setAttribute("t", t);
	
		
	
	
	
	//修改 
	@RequestMapping(value="/update")
	public String updateData(String loginName,String passWord,HttpServletResponse response){
		
		String result ="/page/updatesuc";
		ControllerOperatorForm s = new ControllerOperatorForm();
		s.setOperator("insert");
		s.setObj("AddTenderInfo");
		String json = null;
		try {
			int u=dataService.updateData( loginName, passWord);
			request.setAttribute("u", u);
			s.setCode("0");
			
		} catch (Exception e) {
			s.setCode("1");
			e.printStackTrace();
		}

		try {
			JSONObject jsonObject = JSONObject.fromObject(s);
			json = jsonObject.toString();
			response.setContentType("text/xml");
			response.getWriter().write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
		//request.setAttribute("add", add);
		return result;
	}
		
	
	//分页
	@RequestMapping(value="/displaylist")
	public String getdisplayDataList(
			@RequestParam("start") int start,
			@RequestParam("limit") int limit,

			HttpServletResponse response
			
			){
		
//		String result ="/page/displaylist";
//		//int start=super.getStart(0, request);
//		PageIterator page=dataService.getdisplayDataList(start,limit);
//		request.setAttribute("list", page);
//	    return result;
		
//		JSONObject jsonObject = new JSONObject();
//		String result ="/page/displaylist";
//		//int start=super.getStart(0, request);
//		PageIterator page=dataService.getdisplayDataList(start,limit);
//		request.setAttribute("list", page);
//	    return result;
		
		
		JSONObject jsonObject = new JSONObject();
		PageIterator t;
		ControllerOperatorForm s = new ControllerOperatorForm();
		s.setOperator("query");
		s.setObj("QueryCompany");
		try {
			t = dataService.getdisplayDataList(start, limit);
			request.setAttribute("list", t);
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
	
	}
//}

	
	
	
	

