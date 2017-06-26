/**
 * 
 */
package com.scbd.dataimport.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
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
import com.scbd.dataimport.form.CompanyDataForm;
import com.scbd.dataimport.form.CompanyFilesForm;
import com.scbd.dataimport.form.DataColumnAndValueForm;
import com.scbd.dataimport.service.CompanyDetailService;

/**
 * @author ZJD
 * 
 */
@Component
@Controller
public class CompanyFileController extends BaseController {

	private static SimpleDateFormat format1 = new SimpleDateFormat(
			"yyyy-MM-dd HH:mm:ss");
	private static SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
	private static SimpleDateFormat format3 = new SimpleDateFormat("yyyy-MM");
	/* 存储访问数据池里所传入的值 */
	@Autowired
	private CompanyDetailService companyDetailServiceImpl;

	@RequestMapping(value = "/addCompanyFiles")
	public void addCompanyFiles(HttpServletResponse respongse,
			@ModelAttribute CompanyFilesForm companyFilesForm
			){
		try{
			
			companyFilesForm.setPosttime(format1.format(new Date()));
			companyDetailServiceImpl.addCompanyFiles(companyFilesForm);
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/getCompanyColumns")
	public String getCompanyColumns(HttpServletResponse response) {
		ControllerOperatorForm s = new ControllerOperatorForm();
		s.setOperator("insert");
		s.setObj("importData");
		String json = "failed";
		try {
			List<String> columns = new ArrayList<String>();
			List<CompanyDataForm> t = companyDetailServiceImpl
					.getCompanyDataGroupByCompanyid();

			for (CompanyDataForm c : t) {
				List<DataColumnAndValueForm> p = c.getMcolumn();
				for (DataColumnAndValueForm p1 : p) {
					if (!columns.contains(p1.getColumnname())) {
						columns.add(p1.getColumnname());
					}
				}
			}

			JSONObject jsonObject = new JSONObject();
			jsonObject.element("rows", t);
			json = jsonObject.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}

		try {
			response.setContentType("text/xml");
			response.getWriter().write(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping(value = "/getCompanyData")
	public String getCompanyData(HttpServletResponse response,
			@RequestParam("companyid") String companyid,
			@RequestParam("start") int start,
			@RequestParam("interval") int interval) {
		ControllerOperatorForm s = new ControllerOperatorForm();
		s.setOperator("insert");
		s.setObj("importData");
		String json = "failed";

		List<String> columns = new ArrayList<String>();

		List<CompanyDataForm> t = companyDetailServiceImpl
				.getCompanyData(companyid);
		int end = start + interval;
		List<CompanyDataForm> rs = t.subList(start,
				end < t.size() ? end : t.size());

		for (CompanyDataForm c : rs) {
			List<DataColumnAndValueForm> p = c.getMcolumn();
			for (DataColumnAndValueForm p1 : p) {
				if (!columns.contains(p1.getColumnname())) {
					columns.add(p1.getColumnname());
				}
			}
		}

		JSONObject jsonObject = new JSONObject();
		jsonObject.element("list", rs);
		jsonObject.put("count", t.size());
		jsonObject.element("columns", columns);
		json = jsonObject.toString();
		try {
			response.setContentType("text/xml");
			response.getWriter().write(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping(value = "/getAllCompanyDataGroupByDate")
	public String getAllCompanyDataGroupByDate(HttpServletResponse response) {
		ControllerOperatorForm s = new ControllerOperatorForm();
		s.setOperator("insert");
		s.setObj("importData");
		String json = "failed";
		try {
			List<CompanyDataForm> t = companyDetailServiceImpl
					.getAllCompanyDataGroupByDate();
			JSONObject jsonObject = new JSONObject();
			jsonObject.element("list", t);
			jsonObject.put("count", t.size());
			json = jsonObject.toString();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		try {
			response.setContentType("text/xml");
			response.getWriter().write(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping(value = "/getCompanyFiles")
	public String getCompanyFiles(HttpServletResponse response,
			@RequestParam("companyid") String companyid,
			@RequestParam("start") int start,
			@RequestParam("interval") int interval) {
		ControllerOperatorForm s = new ControllerOperatorForm();
		s.setOperator("insert");
		s.setObj("importData");
		String json = "failed";

		List<CompanyFilesForm> t = companyDetailServiceImpl
				.getCompanyFiles(companyid);
		int end = start + interval;
		List<CompanyFilesForm> rs = t.subList(start,
				end < t.size() ? end : t.size());
		JSONObject jsonObject = new JSONObject();
		jsonObject.element("list", rs);
		jsonObject.put("count", t.size());
		json = jsonObject.toString();

		try {
			response.setContentType("text/xml");
			response.getWriter().write(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping(value = "/getAllCompanyFiles")
	public String getAllCompanyFiles(HttpServletResponse response,
			@RequestParam("start") int start,
			@RequestParam("interval") int interval) {
		String json = "failed";
		try {
			ControllerOperatorForm s = new ControllerOperatorForm();
			s.setOperator("insert");
			s.setObj("importData");

			List<CompanyFilesForm> t;

			t = companyDetailServiceImpl.getAllCompanyFiles();

			int end = start + interval;
			List<CompanyFilesForm> rs = t.subList(start, end < t.size() ? end
					: t.size());

			JSONObject jsonObject = new JSONObject();
			jsonObject.element("list", rs);
			jsonObject.put("count", t.size());
			json = jsonObject.toString();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		try {
			response.setContentType("text/xml");
			response.getWriter().write(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping(value = "/getAllCompanyDataAndFilesByDate")
	public String getAllCompanyDataAndFilesByDate(HttpServletResponse response) {
		String json = "failed";
		try {
			ControllerOperatorForm s = new ControllerOperatorForm();
			s.setOperator("insert");
			s.setObj("importData");

			List<CompanyFilesForm> rs1 = new ArrayList<CompanyFilesForm>();
			List<CompanyDataForm> rs2 = new ArrayList<CompanyDataForm>();

			List<CompanyFilesForm> t1 = companyDetailServiceImpl
					.getAllCompanyFilesGroupByDate();
			List<CompanyDataForm> t2 = companyDetailServiceImpl
					.getAllCompanyDataGroupByDate();
			List<String> time = this.getRecentDate();
			List<String> timers = new ArrayList<String>();

			for (int p = 0; p < t1.size(); p++) {
				if (time.contains(t1.get(p).getPosttime())) {
					t1.get(p).setCompanyid(
							String.valueOf(time
									.indexOf(t1.get(p).getPosttime())));
					rs1.add(t1.get(p));
				}
			}

			for (int p = 0; p < t2.size(); p++) {
				if (time.contains(t2.get(p).getPosttime())) {
					t2.get(p).setCompanyid(
							String.valueOf(time
									.indexOf(t2.get(p).getPosttime())));
					rs2.add(t2.get(p));
				}
			}

			for (String e : time) {
				String pe = e.substring(8, 10) + "日";
				timers.add(pe);
			}

			JSONObject jsonObject = new JSONObject();
			jsonObject.element("filelist", rs1);
			jsonObject.element("datalist", rs2);
			jsonObject.element("time", timers);

			json = jsonObject.toString();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		try {
			response.setContentType("text/xml");
			response.getWriter().write(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	private List<String> getRecentDate() {
		List<String> rs = new ArrayList<String>();
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DAY_OF_YEAR, -15);
		Date Start = cal.getTime();
		cal.add(Calendar.MONTH, 1);
		if (cal.getTime().getMonth() == 2) {
			cal.add(Calendar.DAY_OF_YEAR, -1);
		}
		Date End = cal.getTime();
		while (!Start.after(End)) {
			rs.add(format2.format(Start));
			Start.setTime(Start.getTime() + 24 * 60 * 60 * 1000);

		}
		return rs;
	}

	@RequestMapping(value = "/getCompanyFilesList")
	public String getCompanyFilesList(HttpServletResponse response) {
		String json = "failed";
		try {
			ControllerOperatorForm s = new ControllerOperatorForm();
			s.setOperator("insert");
			s.setObj("importData");

			List<CompanyFilesForm> t;

			t = companyDetailServiceImpl.getCompanyFilesList();

			JSONObject jsonObject = new JSONObject();
			jsonObject.element("list", t);
			jsonObject.put("count", t.size());
			json = jsonObject.toString();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		try {
			response.setContentType("text/xml");
			response.getWriter().write(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping(value = "/getDataStatics")
	public String getDataStatics(HttpServletResponse response) {
		String json = "failed";
		try {
			ControllerOperatorForm s = new ControllerOperatorForm();
			s.setOperator("insert");
			s.setObj("importData");

			List<CompanyFilesForm> t;

			t = companyDetailServiceImpl.getCompanyFilesList();

			JSONObject jsonObject = new JSONObject();
			jsonObject.element("list", t);
			jsonObject.put("count", t.size());
			json = jsonObject.toString();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		try {
			response.setContentType("text/xml");
			response.getWriter().write(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping(value = "/getCompanyFilesListByDate")
	public String getCompanyFilesListByDate(HttpServletResponse response,
			@RequestParam("date") String date,
			@RequestParam("start") int start,
			@RequestParam("interval") int interval) {
		String json = "failed";
		try {
			ControllerOperatorForm s = new ControllerOperatorForm();
			s.setOperator("insert");
			s.setObj("importData");

			Date a1 = new Date();
			String a1String = format3.format(a1);
			if (date.length() < 2) {
				date = "0" + date;
			}
			String dateString = a1String + "-" + date;
			List<CompanyFilesForm> t = companyDetailServiceImpl
					.getCompanyFilesByDate(dateString);
			int end = start + interval;
			List<CompanyFilesForm> rs = t.subList(start, end < t.size() ? end
					: t.size());

			JSONObject jsonObject = new JSONObject();
			jsonObject.element("list", rs);
			jsonObject.put("count", t.size());
			json = jsonObject.toString();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		try {
			response.setContentType("text/xml");
			response.getWriter().write(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping(value = "/getCompanyDataListByDate")
	public String getCompanyDataListByDate(HttpServletResponse response,
			@RequestParam("date") String date,
			@RequestParam("start") int start,
			@RequestParam("interval") int interval) {
		String json = "failed";

		try {
			ControllerOperatorForm s = new ControllerOperatorForm();
			s.setOperator("insert");
			s.setObj("importData");
			Date a1 = new Date();
			String a1String = format3.format(a1);
			List<String> columns = new ArrayList<String>();

			if (date.length() < 2) {
				date = "0" + date;
			}
			String dateString = a1String + "-" + date;
			List<CompanyDataForm> t = companyDetailServiceImpl
					.getCompanyDataByDate(dateString);
			int end = start + interval;
			List<CompanyDataForm> rs = t.subList(start, end < t.size() ? end
					: t.size());
			for (CompanyDataForm c : rs) {
				List<DataColumnAndValueForm> p = c.getMcolumn();
				for (DataColumnAndValueForm p1 : p) {
					if (!columns.contains(p1.getColumnname())) {
						columns.add(p1.getColumnname());
					}
				}
			}

			JSONObject jsonObject = new JSONObject();
			jsonObject.element("list", rs);
			jsonObject.put("count", t.size());
			jsonObject.element("columns", columns);
			json = jsonObject.toString();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		try {
			response.setContentType("text/xml");
			response.getWriter().write(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping(value = "/getCompanyDataGroupByCondition")
	public String getCompanyDataGroupByCondition(HttpServletResponse response,
			@RequestParam("key") String key) {

		String json = "failed";
		try {
			ControllerOperatorForm s = new ControllerOperatorForm();
			s.setOperator("insert");
			s.setObj("importData");

			List<CompanyDataForm> t = companyDetailServiceImpl
					.getAllCompanyDataGroupByCondition(key, "");

			JSONObject jsonObject = new JSONObject();
			jsonObject.element("list", t);
			jsonObject.put("count", t.size());
			json = jsonObject.toString();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		try {
			response.setContentType("text/xml");
			response.getWriter().write(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping(value = "/getCompanyDataByCompanyIdAndKeywords")
	public String getCompanyDataByCompanyIdAndKeywords(HttpServletResponse response,
			@RequestParam("keyword") String keyword,
			@RequestParam("companyid") String companyid,
			@RequestParam("start") int start,
			@RequestParam("interval") int interval) {
		String json = "failed";
		try {
			ControllerOperatorForm s = new ControllerOperatorForm();
			s.setOperator("insert");
			s.setObj("importData");
			List<String> columns = new ArrayList<String>();
			String[] keywords=keyword.split(",");			
			HashMap<String,CompanyDataForm> rss=new HashMap<String,CompanyDataForm>();
			List<CompanyDataForm> t=new ArrayList<CompanyDataForm>();
			
			
			for(String k:keywords){
				List<CompanyDataForm> p = companyDetailServiceImpl.getCompanyDataByCompanyIdAndKeywords(companyid,k);
				for(CompanyDataForm p1:p){
					rss.put(p1.get_id(), p1);
				}
			}
			
			Iterator iter = rss.entrySet().iterator();
			while (iter.hasNext()) 
			{
				Map.Entry entry = (Map.Entry) iter.next();
				t.add((CompanyDataForm)entry.getValue());
			}
			
			
			int end = start + interval;
			List<CompanyDataForm> rs = t.subList(start, end < t.size() ? end
					: t.size());
			
			for (CompanyDataForm c : rs) {
				List<DataColumnAndValueForm> p = c.getMcolumn();
				for (DataColumnAndValueForm p1 : p) {
					if (!columns.contains(p1.getColumnname())) {
						columns.add(p1.getColumnname());
					}
				}
			}

			JSONObject jsonObject = new JSONObject();
			jsonObject.element("list", rs);
			jsonObject.put("count", t.size());
			jsonObject.element("columns", columns);
			json = jsonObject.toString();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		try {
			response.setContentType("text/xml");
			response.getWriter().write(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping(value = "/getCompanyFilesByCompanyIdAndKeywords")
	public String getCompanyFilesByCompanyIdAndKeywords(
			HttpServletResponse response,
			@RequestParam("keyword") String keyword,
			@RequestParam("companyid") String companyid,
			@RequestParam("start") int start,
			@RequestParam("interval") int interval) {
		String json = "failed";
		try {
			ControllerOperatorForm s = new ControllerOperatorForm();
			s.setOperator("insert");
			s.setObj("importData");

			String[] keywords=keyword.split(",");			
			HashMap<String,CompanyFilesForm> rss=new HashMap<String,CompanyFilesForm>();
			List<CompanyFilesForm> t=new ArrayList<CompanyFilesForm>();
			
			
			for(String k:keywords){
				List<CompanyFilesForm> p = companyDetailServiceImpl.getCompanyFilesByCompanyIdAndKeywords(companyid,k);
				for(CompanyFilesForm p1:p){
					rss.put(p1.get_id(), p1);
				}
			}
			
			Iterator iter = rss.entrySet().iterator();
			while (iter.hasNext()) 
			{
				Map.Entry entry = (Map.Entry) iter.next();
				t.add((CompanyFilesForm)entry.getValue());
			}

			int end = start + interval;
			List<CompanyFilesForm> rs = t.subList(start, end < t.size() ? end
					: t.size());

			JSONObject jsonObject = new JSONObject();
			jsonObject.element("list", rs);
			jsonObject.put("count", t.size());
			json = jsonObject.toString();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		try {
			response.setContentType("text/xml");
			response.getWriter().write(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping(value = "/getCompanyFilesGroupByCondition")
	public String getCompanyFilesGroupByCondition(HttpServletResponse response,
			@RequestParam("key") String key) {
		String json = "failed";
		try {
			ControllerOperatorForm s = new ControllerOperatorForm();
			s.setOperator("insert");
			s.setObj("importData");
			Date a1 = new Date();
			String a1String = format3.format(a1);

			List<CompanyFilesForm> t = companyDetailServiceImpl
					.getAllCompanyFilesGroupByCondition(key, "");

			JSONObject jsonObject = new JSONObject();
			jsonObject.element("list", t);
			jsonObject.put("count", t.size());
			json = jsonObject.toString();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		try {
			response.setContentType("text/xml");
			response.getWriter().write(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping(value = "/getCompanyDataByCondition")
	public String getCompanyDataByCondition(HttpServletResponse response,
			@RequestParam("key") String key,
			@RequestParam("value") String value,
			@RequestParam("start") int start,
			@RequestParam("interval") int interval) {
		String json = "failed";
		try {
			ControllerOperatorForm s = new ControllerOperatorForm();
			s.setOperator("insert");
			s.setObj("importData");
			List<String> columns = new ArrayList<String>();

			List<CompanyDataForm> t = companyDetailServiceImpl
					.getAllCompanyDataByCondition(key, value);

			int end = start + interval;
			List<CompanyDataForm> rs = t.subList(start, end < t.size() ? end
					: t.size());

			for (CompanyDataForm c : rs) {
				List<DataColumnAndValueForm> p = c.getMcolumn();
				for (DataColumnAndValueForm p1 : p) {
					if (!columns.contains(p1.getColumnname())) {
						columns.add(p1.getColumnname());
					}
				}
			}

			JSONObject jsonObject = new JSONObject();
			jsonObject.element("list", rs);
			jsonObject.put("count", t.size());
			jsonObject.element("columns", columns);
			json = jsonObject.toString();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		try {
			response.setContentType("text/xml");
			response.getWriter().write(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping(value = "/getCompanyFilesByCondition")
	public String getCompanyFilesByCondition(HttpServletResponse response,
			@RequestParam("key") String key,
			@RequestParam("value") String value,
			@RequestParam("start") int start,
			@RequestParam("interval") int interval) {
		String json = "failed";
		try {
			ControllerOperatorForm s = new ControllerOperatorForm();
			s.setOperator("insert");
			s.setObj("importData");
			Date a1 = new Date();

			List<CompanyFilesForm> t = companyDetailServiceImpl
					.getAllCompanyFilesByCondition(key, value);

			int end = start + interval;
			List<CompanyFilesForm> rs = t.subList(start, end < t.size() ? end
					: t.size());

			JSONObject jsonObject = new JSONObject();
			jsonObject.element("list", rs);
			jsonObject.put("count", t.size());
			json = jsonObject.toString();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		try {
			response.setContentType("text/xml");
			response.getWriter().write(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping(value = "/getDataAndFilesStaticGroupByCondition")
	public String getDataAndFilesStaticGroupByCondition(
			HttpServletResponse response) {
		String json = "failed";
		try {
			ControllerOperatorForm s = new ControllerOperatorForm();
			s.setOperator("insert");
			s.setObj("importData");

			List<CompanyFilesForm> t1 = companyDetailServiceImpl
					.getAllCompanyFilesGroupByCondition("mainkeywords", "");
			List<CompanyFilesForm> t2 = companyDetailServiceImpl
					.getAllCompanyFilesGroupByCondition("url", "");
			List<CompanyFilesForm> t3 = companyDetailServiceImpl
					.getAllCompanyFilesGroupByCondition("language", "");

			List<CompanyDataForm> t4 = companyDetailServiceImpl
					.getAllCompanyDataGroupByCondition("mainkeywords", "");
			List<CompanyDataForm> t5 = companyDetailServiceImpl
					.getAllCompanyDataGroupByCondition("url", "");

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("filesmainkeywords", t1.size());
			jsonObject.put("filesurl", t2.size());
			jsonObject.put("fileslanguage", t3.size());
			jsonObject.put("datamainkeywords", t4.size());
			jsonObject.put("dataurl", t5.size());
			json = jsonObject.toString();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		try {
			response.setContentType("text/xml");
			response.getWriter().write(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	
	
	

	@RequestMapping(value = "/getcompanybyurl")
	public String getcompanybyurl(
			@RequestParam("start") int start,
			@RequestParam("url") String url,
			@RequestParam("count") int count,

			HttpServletResponse response) {


		JSONObject jsonObject = new JSONObject();
		PageIterator t;
		ControllerOperatorForm s = new ControllerOperatorForm();
		s.setOperator("query");
		s.setObj("getcompanybyurl");
		try {
			t = companyDetailServiceImpl.getcompanybyurl(url, start, count);
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
	
	

	@RequestMapping(value = "/DeleteCompanyData")
	public String DeleteCompanyData(
			@ModelAttribute("_id") String _id,
			HttpServletResponse response) {
		ControllerOperatorForm s = new ControllerOperatorForm();
		s.setOperator("Delete");
		s.setObj("DeleteCompanyData");
		String json = null;
		try {
		
			companyDetailServiceImpl.DeleteCompanyData(_id);
			
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
	
}
