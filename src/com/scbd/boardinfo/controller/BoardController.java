package com.scbd.boardinfo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.common.controller.BaseController;
import com.common.tag.PageIterator;
import com.scbd.boardinfo.form.BoardInfoForm;
import com.scbd.boardinfo.service.BoardInfoService;
import com.scbd.common.form.ControllerOperatorForm;


@Component
@Controller
public class BoardController extends BaseController {

	
	@Autowired
	private BoardInfoService BoardInfoServiceImpl;
	
	

	@RequestMapping(value = "/QueryBoardInfobycompanyId")
	public String QueryBoardInfobycompanyId(
			@RequestParam("start") int start,
			@RequestParam("company_id") int company_id,
			@RequestParam("limit") int limit,
			
			HttpServletResponse response) {
		
	
		JSONObject jsonObject = new JSONObject();
		PageIterator t;
		ControllerOperatorForm s = new ControllerOperatorForm();
		s.setOperator("query");
		s.setObj("QueryBoardInfobycompanyId");
		try {
			t = BoardInfoServiceImpl.QueryBoardInfobycompanyId(company_id, start, limit);
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
	
	

	@RequestMapping(value = "/QueryBoardInfobyboardname")
	public String QueryBoardInfobyboardname(
			@RequestParam("start") int start,
			@RequestParam("BoardInfo") BoardInfoForm BoardInfo,
			@RequestParam("limit") int limit,
			
			HttpServletResponse response) {
		
		
		JSONObject jsonObject = new JSONObject();
		PageIterator t;
		ControllerOperatorForm s = new ControllerOperatorForm();
		s.setOperator("query");
		s.setObj("QueryBoardInfobyboardname");
		try {
			t = BoardInfoServiceImpl.QueryBoardInfobyboardname(BoardInfo, start, limit);
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
	@RequestMapping(value = "/BoardInfoPaginationAndName")
	public String BoardInfoPaginationAndName(@RequestParam("company_id") int company_id,@RequestParam("resources_name") String resources_name,@RequestParam("start") int start,
			@RequestParam("limit") int limit,HttpServletResponse response) throws Exception {
		JSONObject jsonObject = new JSONObject();
		PageIterator t;
		 BoardInfoForm BoardInfo=new BoardInfoForm();
		 BoardInfo.setCompany_id(company_id);
		if (resources_name == "" ) {
			t =  BoardInfoServiceImpl.QueryBoardInfobycompanyId(BoardInfo.getCompany_id(), start, limit);
		} else  {
			BoardInfo.setBoard_name(resources_name);
			t = BoardInfoServiceImpl.QueryBoardInfobyboardname(BoardInfo, start, limit);
		}


		if (t.getAllCount() == 0) {
			ControllerOperatorForm s = new ControllerOperatorForm();
			s.setOperator("pagination");
			s.setObj("BoardInfoPaginationAndName");
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
