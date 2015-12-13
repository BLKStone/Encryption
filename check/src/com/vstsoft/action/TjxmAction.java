package com.vstsoft.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;





import com.vstsoft.model.Tongji;
import com.vstsoft.model.Tjdj;
import com.vstsoft.model.Yjtjb;
import com.vstsoft.model.Yjkh;
import com.vstsoft.model.Yjkhclass;
import com.vstsoft.model.Tjxm;
import com.vstsoft.service.TjxmService;

public class TjxmAction extends ActionSupport{

	private TjxmService tj ;
	private List<Tjxm> list;
	private String cong ;
	private String dao ;
	private String jigou ;

	private String xsy;
	private String nddjrw;
	private String ndhkrw ;
	private String year ;
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getXsy() {
		return xsy;
	}
	public void setXsy(String xsy) {
		this.xsy = xsy;
	}
	public String getNddjrw() {
		return nddjrw;
	}
	public void setNddjrw(String nddjrw) {
		this.nddjrw = nddjrw;
	}
	public String getNdhkrw() {
		return ndhkrw;
	}
	public void setNdhkrw(String ndhkrw) {
		this.ndhkrw = ndhkrw;
	}
	


	public String getCong() {
		return cong;
	}
	public void setCong(String cong) {
		this.cong = cong;
	}
	public String getDao() {
		return dao;
	}
	public void setDao(String dao) {
		this.dao = dao;
	}
	public String getJigou() {
		return jigou;
	}
	public void setJigou(String jigou) {
		this.jigou = jigou;
	}
	

	

	public List<Tjxm> getList() {
		return list;
	}

	public void setList(List<Tjxm> list) {
		this.list = list;
	}

	public TjxmService getTj() {
		return tj;
	}

	public void setTj(TjxmService tj) {
		this.tj = tj;
	}

	HttpServletRequest request = ServletActionContext.getRequest();
	
	

	
	
	public String tjxmMET() throws Exception {
		System.out.println("********tjxmMET********");

		
		Tongji tongji = new Tongji();
		tongji.setCong(this.cong);
		tongji.setDao(this.dao);
		tongji.setJigou(this.jigou);
		List<Tjxm> list = tj.tjxmMET(tongji);
		JSONObject json = new JSONObject();
		json.accumulate("Rows", list);
		System.out.println(">>>>>>>>>>json"+json);    
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/x-json;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache"); 
		response.getWriter().print(json.toString());
		return null;
	}
	
	public String tjdjMET() throws Exception {
		System.out.println("********tjdjMET********");

		
		Tongji tongji = new Tongji();
		tongji.setCong(this.cong);
		tongji.setDao(this.dao);
		tongji.setJigou(this.jigou);
		List<Tjdj> list = tj.tjdjMET(tongji);
		JSONObject json = new JSONObject();
		json.accumulate("Rows", list);
		System.out.println(">>>>>>>>>>json"+json);    
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/x-json;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache"); 
		response.getWriter().print(json.toString());
		return null;
	}
	public String yjtjbMET() throws Exception {
		System.out.println("********yjtjbMET********");

		
		Tongji tongji = new Tongji();
		tongji.setCong(this.cong);
		tongji.setDao(this.dao);
		tongji.setJigou(this.jigou);
		List<Yjtjb> list = tj.yjtjbMET(tongji);
		JSONObject json = new JSONObject();
		json.accumulate("Rows", list);
		System.out.println(">>>>>>>>>>json"+json);    
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/x-json;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache"); 
		response.getWriter().print(json.toString());
		return null;
	}
	
	public String yjkhMET() throws Exception {
		System.out.println("********yjkhMET********");	
		List<Yjkh> list = tj.yjkhMET(this.getYear());
		JSONObject json = new JSONObject();
		json.accumulate("Rows", list);
		System.out.println(">>>>>>>>>>json"+json);    
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/x-json;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache"); 
		response.getWriter().print(json.toString());
		return null;
	}

	
	
	

	
	
	
	public String addyjkhMET() throws Exception {
		System.out.println("********addyjkhMET*********");
		Yjkhclass yjkhclass = new Yjkhclass();
		yjkhclass.setXsy(this.xsy);
		yjkhclass.setNddjrw(this.nddjrw);
		yjkhclass.setNdhkrw(this.ndhkrw);
		yjkhclass.setYear(this.year);
	
		tj.addyjkhMET(yjkhclass);
		return null;
	}


	public String edityjkhMET() throws Exception {
		System.out.println("********edityjkhMET*********");
		Yjkhclass yjkhclass = new Yjkhclass();
		yjkhclass.setXsy(this.xsy);
		yjkhclass.setNddjrw(this.nddjrw);
		yjkhclass.setNdhkrw(this.ndhkrw);
		yjkhclass.setYear(this.year);
	
		tj.edityjkhMET(yjkhclass);
		return null;
	}
	
	
	

}