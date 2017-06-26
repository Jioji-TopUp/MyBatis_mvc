package com.scbd.pythonconfig.controller;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;



import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.common.controller.BaseController;
import com.common.tag.PageIterator;

import com.scbd.common.form.ControllerOperatorForm;


import com.scbd.pythonconfig.form.PythonConfigForm;
import com.scbd.pythonconfig.service.PythonConfigService;

@Component
@Controller
public class PythonConfigController<T> extends BaseController {
	
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	@Autowired
	private PythonConfigService PythonConfigServiceImpl;

		
	

	    //定时任务
	    @Scheduled(cron="0 0 2 * * ?" ) //每天2点执行
	    public void taskCycle(){
	    	String ss2=request.getSession().getServletContext().getRealPath("/");
			String commandStr = "python \""+ss2+"page\\plugins\\fullavatareditor\\python\\company_data_in_up.py\"";  
			 System.out.println(exeCmd(commandStr));
	    }
	
	
	
	//根据id查看配置信息
	@RequestMapping(value = "/QueryPythonConfigById")
	public String QueryPythonConfigById(
			@RequestParam("_id") String _id,
			HttpServletResponse response) {
	
		ControllerOperatorForm s = new ControllerOperatorForm();
		s.setOperator("query");
		s.setObj("QueryPythonConfigById");
		String json = null;
		try {
			JSONObject jsonObject = new JSONObject();
			PythonConfigForm  t=PythonConfigServiceImpl.QueryPythonConfigById(_id);
			if (t == null) {
				s.setCode("1");
				jsonObject = JSONObject.fromObject(s);
			} else {
				List<PythonConfigForm> a = new ArrayList<PythonConfigForm>();
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
	
	
	
	
	
///////////主页所使用的的2个筛选                  1
	@RequestMapping(value = "/QueryPythonConfigByremarks")
	public String QueryPythonConfigByremarks(
			@RequestParam("remarks") String remarks,
			@RequestParam("start") int start,
			@RequestParam("limit") int limit,
			
			HttpServletResponse response) {
		
		
		JSONObject jsonObject = new JSONObject();
		PageIterator t;
		ControllerOperatorForm s = new ControllerOperatorForm();
		s.setOperator("select");
		s.setObj("PythonConfigPagination");
		try {
			t = PythonConfigServiceImpl.QueryPythonConfigByremarks(remarks, start, limit);
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
	
	
	
///////////主页所使用的的 2个筛选                  2
	//配置所有信息进行分页
	@RequestMapping(value = "/PythonConfigPagination")
	public String PythonConfigPagination(
			@RequestParam("start") int start,
			@RequestParam("limit") int limit,
			
			HttpServletResponse response) {
		
		
		JSONObject jsonObject = new JSONObject();
		PageIterator t;
		ControllerOperatorForm s = new ControllerOperatorForm();
		s.setOperator("select");
		s.setObj("PythonConfigPagination");
		try {
			t = PythonConfigServiceImpl.PythonConfigPagination(start, limit);
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
	@RequestMapping(value = "/PythonConfigPaginationAndlocation")
	public String PythonConfigPaginationAndlocation(	@RequestParam("remarks") String remarks,@RequestParam("start") int start,
			@RequestParam("limit") int limit,HttpServletResponse response) throws Exception {
		JSONObject jsonObject = new JSONObject();
		PageIterator t;

		if (remarks == "" ) {
			t =  PythonConfigServiceImpl.PythonConfigPagination(start, limit);
		} else  {
			t = PythonConfigServiceImpl.QueryPythonConfigByremarks(remarks, start, limit);
		}


		if (t.getAllCount() == 0) {
			ControllerOperatorForm s = new ControllerOperatorForm();
			s.setOperator("pagination");
			s.setObj("PythonConfigPaginationAndlocation");
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
	
	
	
	

	
	
	
	//修改配置信息
	@RequestMapping(value = "/UpdatePythonConfig",method=RequestMethod.POST)
	public String UpdateOrderInfo(@RequestParam("_id") String _id,@ModelAttribute("PythonConfig") PythonConfigForm PythonConfig,
			HttpServletResponse response) {
		ControllerOperatorForm s = new ControllerOperatorForm();
		s.setOperator("Update");
		s.setObj("UpdatePythonConfig");
		String json = null;
		try {
		
			PythonConfig.set_id(_id);
			PythonConfigServiceImpl.UpdatePythonConfig(PythonConfig);
			
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
		return null;
	}
	
	
	
	
	
	
	//删除配置信息
	@RequestMapping(value = "/DeletePythonConfig")
	public String DeletePythonConfig(
			@ModelAttribute("_id") String _id,
			HttpServletResponse response) {
		ControllerOperatorForm s = new ControllerOperatorForm();
		s.setOperator("Delete");
		s.setObj("DeletePythonConfig");
		String json = null;
		try {
		
			PythonConfigServiceImpl.DeletePythonConfig(_id);
			
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
		return null;
	}
	
	
	
	
	//修改配置状态
		@RequestMapping(value = "/SuspendPythonConfig")
		public String SuspendPythonConfig(
				@ModelAttribute("_id") String _id,
				@ModelAttribute("pythonstate") int pythonstate,
				HttpServletResponse response) {
			ControllerOperatorForm s = new ControllerOperatorForm();
			s.setOperator("Suspend");
			s.setObj("SuspendPythonConfig");
			String json = null;
			try {
			
				PythonConfigServiceImpl.SuspendPythonConfig(_id, pythonstate);
				
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
			return null;
		}
	
	
	
	
	
	//添加配置
	@RequestMapping(value = "/AddPythonConfig",method=RequestMethod.POST) 
	public String AddOrderInfo(
			@ModelAttribute("PythonConfig") PythonConfigForm PythonConfig,

			HttpServletResponse response) {
		ControllerOperatorForm s = new ControllerOperatorForm();
		s.setOperator("insert");
		s.setObj("AddPythonConfig");
		String json = null;
		try {
		
			PythonConfig.setPythonstate(1);
			PythonConfig.setPythontime(df.format(new Date()));
			PythonConfigServiceImpl.AddPythonConfig(PythonConfig);
			
			s.setCode("0");
			
		} catch (Exception e) {
			s.setCode("1");
			e.printStackTrace();
		}
		
		
		
	try {
		String ss2=request.getSession().getServletContext().getRealPath("/");
		String commandStr = "python \""+ss2+"page\\plugins\\fullavatareditor\\python\\configurable_spider.py\" \""+PythonConfig.getPythonurl()+"\"";  
		
		System.out.println(exeCmd(commandStr));
        JSONObject jsonObject = JSONObject.fromObject(s);
		json = jsonObject.toString();
		response.setContentType("text/xml");
			response.getWriter().write(json);
		} catch (IOException e) {
			e.printStackTrace();
	}
		return null;
	}
	

	public static String exeCmd(String commandStr) {  
		BufferedReader br = null; 
		StringBuilder sb=new StringBuilder();  
		try {  
			Process p = Runtime.getRuntime().exec(commandStr);  
			br = new BufferedReader(new InputStreamReader(p.getInputStream()));  
			String line = null;  

			while ((line = br.readLine()) != null) {  
				sb.append(line);  		
			}  
		
		} catch (Exception e) {  
			e.printStackTrace();  
		}   
		finally  
		{  
			if (br != null)  
			{  
				try {  
					br.close();  
				} catch (Exception e) {  
					e.printStackTrace();  
				}  
			} 
		}  
		return sb.toString();
	} 
	
	
	
	
	
	


		
		

	
}
