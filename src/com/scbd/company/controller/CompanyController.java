package com.scbd.company.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.common.controller.BaseController;
import com.common.tag.PageIterator;
import com.scbd.common.form.ControllerOperatorForm;
import com.scbd.company.form.CompanyForm;
import com.scbd.company.service.CompanyService;
import com.scbd.pdfjx.form.pdfjxForm;
import com.scbd.pdfjx.service.pdfjxService;






@Component
@Controller
public class CompanyController extends BaseController {


	@Autowired
	private CompanyService CompanyServiceImpl;
	@Autowired
	private pdfjxService pdfjxServiceImpl;

	

	

	@RequestMapping(value = "/QueryCompany")
	public String QueryCompany(
			@RequestParam("start") int start,
			@RequestParam("limit") int limit,

			HttpServletResponse response) {


		JSONObject jsonObject = new JSONObject();
		PageIterator t;
		ControllerOperatorForm s = new ControllerOperatorForm();
		s.setOperator("query");
		s.setObj("QueryCompany");
		try {
			t = CompanyServiceImpl.QueryCompany(start, limit);
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




	@RequestMapping(value = "/QueryCompanybyId")
	public String QueryCompanybycompanyId(

			@RequestParam("id") int id,

			HttpServletResponse response) {


		JSONObject jsonObject = new JSONObject();
		CompanyForm t;
		ControllerOperatorForm s = new ControllerOperatorForm();
		s.setOperator("query");
		s.setObj("QueryCompanybyId");
		try {
			t = CompanyServiceImpl.QueryCompanybyId(id);
			if (t==null) {
				s.setCode("1");
				jsonObject = JSONObject.fromObject(s);
			} else {
				List<CompanyForm> a = new ArrayList<CompanyForm>();
				a.add(t);
				jsonObject.element("list", a);
			}
			String json = jsonObject.toString();
			response.setContentType("text/xml");
			response.getWriter().write(json);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return null;
	}





	@RequestMapping(value = "/QueryCompanybyechars")
	public String QueryCompanybyechars(

			@RequestParam("id") int id,

			HttpServletResponse response) {


		JSONObject jsonObject = new JSONObject();
		CompanyForm t;
		CompanyForm q;
		CompanyForm w;
		ControllerOperatorForm s = new ControllerOperatorForm();
		s.setOperator("query");
		s.setObj("QueryCompanybyId");
		try {
			t = CompanyServiceImpl.QueryCompanybyId(id);


			if (t==null) {
				s.setCode("1");
				jsonObject = JSONObject.fromObject(s);
			} else {
				List<CompanyForm> a = new ArrayList<CompanyForm>();
				List<CompanyForm> b = new ArrayList<CompanyForm>();


				int sn;
				String[] ss=t.getRelation_id().split(",");
				for(int i=0;i<ss.length;i++)
				{
					sn=Integer.parseInt(ss[i]);
					q = CompanyServiceImpl.QueryCompanybyId(sn);


					int sc;
					String[] sx=q.getRelation_id().split(",");
					List<CompanyForm> c = new ArrayList<CompanyForm>();
					for(int j=0;j<sx.length;j++)
					{
						sc=Integer.parseInt(sx[j]);
						w = CompanyServiceImpl.QueryCompanybyId(sc);
						c.add(w);

					}
					q.setCompany_xinxi(c);
					b.add(q);
				}

				t.setCompany_xinxi(b);
				a.add(t);
				String relation_id="";
				List<CompanyForm> g;
				g = CompanyServiceImpl.QueryCompanybyrelationid(relation_id);
				a.addAll(g);
				jsonObject.element("list", a);
			}
			String json = jsonObject.toString();
			response.setContentType("text/xml");
			response.getWriter().write(json);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return null;
	}

	
	
	//添加公司名
	@RequestMapping(value = "/AddcompanyInfo")
	public String AddOrderInfo(
			@ModelAttribute("companyInfo") CompanyForm companyInfo,
			HttpServletResponse response) {
		ControllerOperatorForm s = new ControllerOperatorForm();
		s.setOperator("insert");
		s.setObj("AddTenderInfo");
		String json = null;
		try {
		
			CompanyServiceImpl.AddcompanyInfo(companyInfo);
			
			
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
	
	//删除公司
		@RequestMapping(value = "/DeletecompanyInfo")
		public String DeleteOrderInfo(int id,
			//	@ModelAttribute("companyInfo") CompanyForm companyInfo,
				HttpServletResponse response) {
			ControllerOperatorForm s = new ControllerOperatorForm();
			s.setOperator("delete");
			s.setObj("deleteTenderInfo");
			String json = null;
			try {
			
				CompanyServiceImpl.DeletecompanyInfo(id);
				
				
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
	
		//更新公司
		@RequestMapping(value = "/UpdatecompanyInfo")
		public String UpdateOrderInfo(
					String company_name,
				int id,
			//	@ModelAttribute("companyInfo") CompanyForm companyInfo,
				HttpServletResponse response) {
			ControllerOperatorForm s = new ControllerOperatorForm();
			s.setOperator("update");
			s.setObj("updatecompanyInfo");
			String json = null;
			try {
			
				CompanyServiceImpl.updatecompanyInfo(company_name,id);
				
				
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
	
		
		
		
		
	
	


	@RequestMapping(value = "/QueryCompanybycompanyname")
	
	public String QueryCompanybycompanyname(
			@RequestParam("start") int start,
			@RequestParam("company_name") String company_name,
			@RequestParam("limit") int limit,

			HttpServletResponse response) {


		JSONObject jsonObject = new JSONObject();
		PageIterator t;
		ControllerOperatorForm s = new ControllerOperatorForm();
		s.setOperator("query");
		s.setObj("QueryCompany");
		try {
			t = CompanyServiceImpl.QueryCompanybycompanyname(company_name,start, limit);
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
	
	
	

	@RequestMapping(value = "/QueryCompanybycompanyname1")
	public String QueryCompanybycompanyname1(
			@RequestParam("start") int start,
			@RequestParam("company_name") String company_name,
			@RequestParam("limit") int limit,

			HttpServletResponse response) {

		String json = "";
		PageIterator t;

		try {
			t = CompanyServiceImpl.QueryCompanybycompanyname(company_name,start, limit);
			if (t.getAllCount() == 0) {
				json = "{\"value\":\"\"}";
			} else {
				List<CompanyForm> clist = t.getModelList();
				json = "{\"value\":[";
				for(CompanyForm c:clist){
					json += "{\"id\":"+c.getId()+",\"company_name\":\""+c.getCompany_name()+"\"},";
				}

				json =json.substring(0,json.length()-1)+"]}";
			}

			response.setContentType("text/xml");
			response.getWriter().write(json);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return null;
	}
	
	
	
	

	@RequestMapping(value = "/companyname")
	public String companyname(
	

			HttpServletResponse response) {


		JSONObject jsonObject = new JSONObject();
		List<CompanyForm> t = null;
		ControllerOperatorForm s = new ControllerOperatorForm();
		s.setOperator("query");
		s.setObj("QueryCompany");
		try {
			t=CompanyServiceImpl.companyname();
			if (t.size()==0) {
				s.setCode("1");
				jsonObject = JSONObject.fromObject(s);
			} else {
			
				jsonObject.element("data", t);
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
	@RequestMapping(value = "/companyPaginationAndName")
	
	public String companyPaginationAndName(	@RequestParam("company_name") String company_name,@RequestParam("start") int start,
			@RequestParam("limit") int limit,HttpServletResponse response) throws Exception {
		JSONObject jsonObject = new JSONObject();
		PageIterator t;

		if (company_name == "" ) {
			t =  CompanyServiceImpl.QueryCompany(start, limit);
		} else  {
			t = CompanyServiceImpl.QueryCompanybycompanyname(company_name, start, limit);
		}


		if (t.getAllCount() == 0) {
			ControllerOperatorForm s = new ControllerOperatorForm();
			s.setOperator("pagination");
			s.setObj("companyPaginationAndName");
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


	//新建表的图片添加

	@RequestMapping(value = "/AddFile")
	public String AddRentalInfoPic(
			@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletResponse response) {
		ControllerOperatorForm s = new ControllerOperatorForm();
		s.setOperator("insert");
		s.setObj("addrentalinfo");
		String json = null;
		String newFilename="";
		try {
			request.setCharacterEncoding("utf-8");
			String path = request
					.getSession()
					.getServletContext()
					.getRealPath(
							"/res/pdf/");
			String fileName = file.getOriginalFilename();
			UUID u = UUID.randomUUID();
			SimpleDateFormat format = new SimpleDateFormat(
					"yyyy_MM_dd_HH_mm_ss");
			String houzui = fileName.substring(fileName.lastIndexOf("."));

			newFilename = u.toString() + "_" + format.format(new Date())
					+ houzui;
			File targetFile = new File(path, newFilename);

			if (!targetFile.exists()) {
				targetFile.mkdirs();
			}
			file.transferTo(targetFile);
			s.setCode("0");
		} catch (Exception e) {
			e.printStackTrace();
			s.setCode("1");
		}
		try {

			String ss2=request.getSession().getServletContext().getRealPath("/");
			String commandStr = "python \""+ss2+"page\\plugins\\fullavatareditor\\python\\pdf.py\" \""+ss2+"res\\pdf\\"+newFilename+"\"";  
			//String commandStr = "ipconfig";  
			String ss = exeCmd(commandStr);  

			s.setOperator(ss);
			JSONObject jsonObject = new JSONObject();

			pdfjxForm  t=pdfjxServiceImpl.QuerypdfjxBytime(ss);

			if (t == null) {
				s.setCode("1");
				jsonObject = JSONObject.fromObject(s);
			} else {
				List<pdfjxForm> a = new ArrayList<pdfjxForm>();
				a.add(t);
				jsonObject.element("list", a);
			}

			json = jsonObject.toString();

			File fp=new File(ss2+"page\\plugins\\fullavatareditor\\python\\a.txt");
			PrintWriter pfp= new PrintWriter(fp,"utf-8");
			pfp.print(json);
			pfp.close();
			commandStr = "python \""+ss2+"page\\plugins\\fullavatareditor\\python\\123.py\" \""+ss2+"page\\plugins\\fullavatareditor\\python\\a.txt\"";
			String sss = exeCmd1(commandStr);  
			
			t=pdfjxServiceImpl.QuerypdfjxBytime(sss);
			if (t == null) {
				s.setCode("1");
				jsonObject = JSONObject.fromObject(s);
			} else {
				List<pdfjxForm> a = new ArrayList<pdfjxForm>();
				a.add(t);
				jsonObject.element("Num", t.getDate());
			}
			
			//jsonObject.element("Num", sss);
			json = jsonObject.toString();
			response.setContentType("text/xml");
			response.getWriter().write(json);
		} catch (Exception e) {
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
	
	public static String exeCmd1(String commandStr) {  
		BufferedReader br = null; 
		StringBuilder sb=new StringBuilder();  
		try {  
			Process p = Runtime.getRuntime().exec(commandStr);  
			br = new BufferedReader(new InputStreamReader(p.getInputStream()));  
			String line =null;  

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
