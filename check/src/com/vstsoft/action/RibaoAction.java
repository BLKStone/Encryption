package com.vstsoft.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.vstsoft.model.Ribao;
import com.vstsoft.model.Ribaob;
import com.vstsoft.model.Shoukuan;
import com.vstsoft.model.Shoukuanclass;
import com.vstsoft.model.Tjxm;
import com.vstsoft.model.Tongji2;
import com.vstsoft.model.Tongji;
import com.vstsoft.service.RibaoService;

public class RibaoAction extends ActionSupport{

	private RibaoService ri ;
	private List<Ribao> list;
	
	
	
	
	
	
	
	private String cong ;
	private String dao ;
	

	
	


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
	
	
	private int xh ;
	private String qcssix ;
	private String qcsfive ;
	
	
	public int getXh() {
		return xh;
	}
	public void setXh(int xh) {
		this.xh = xh;
	}
	public String getQcssix() {
		return qcssix;
	}
	public void setQcssix(String qcssix) {
		this.qcssix = qcssix;
	}
	public String getQcsfive() {
		return qcsfive;
	}
	public void setQcsfive(String qcsfive) {
		this.qcsfive = qcsfive;
	}

	

	public List<Ribao> getList() {
		return list;
	}

	public void setList(List<Ribao> list) {
		this.list = list;
	}

	public RibaoService getRi() {
		return ri;
	}

	public void setRi(RibaoService ri) {
		this.ri = ri;
	}

	HttpServletRequest request = ServletActionContext.getRequest();
	
	
	
	public String ribaoMET() throws Exception {
		System.out.println("********ribaoMET********");
		Tongji2 tongji2 = new Tongji2();
		tongji2.setCong(this.cong);
		tongji2.setDao(this.dao);
		List<Ribao> list = ri.ribaoMET(tongji2);
		JSONObject json = new JSONObject();
		json.accumulate("Rows", list);
		System.out.println(">>>>>>>>>>json"+json);    
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/x-json;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache"); 
		response.getWriter().print(json.toString());
		return null;
	}

	public String ribaobMET() throws Exception {
		System.out.println("********ribaobMET********");
		Tongji2 tongji2 = new Tongji2();
		tongji2.setCong(this.cong);
		tongji2.setDao(this.dao);
		List<Ribaob> list = ri.ribaobMET(tongji2);
		JSONObject json = new JSONObject();
		json.accumulate("Rows", list);
		System.out.println(">>>>>>>>>>json"+json);    
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/x-json;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache"); 
		response.getWriter().print(json.toString());
		return null;
	}

	
	public String shoukuanMET() throws Exception {
		System.out.println("********shoukuanMET********");
		Tongji2 tongji2 = new Tongji2();
		tongji2.setCong(this.cong);
		tongji2.setDao(this.dao);
		List<Shoukuan> list = ri.shoukuanMET(tongji2);
		JSONObject json = new JSONObject();
		json.accumulate("Rows", list);
		System.out.println(">>>>>>>>>>json"+json);    
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/x-json;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache"); 
		response.getWriter().print(json.toString());
		return null;
	}




	public String addshoukuanMET() throws Exception {
		System.out.println("********addshoukuanMET*********");
		Shoukuanclass shoukuanclass = new Shoukuanclass();
		shoukuanclass.setXh(this.xh);
		shoukuanclass.setQcssix(this.qcssix);
		shoukuanclass.setQcsfive(this.qcsfive);
	
		ri.addshoukuanMET(shoukuanclass);
		return null;
	}


	public String editshoukuanMET() throws Exception {
		System.out.println("********editshoukuanMET*********");
		Shoukuanclass shoukuanclass = new Shoukuanclass();
		shoukuanclass.setXh(this.xh);
		shoukuanclass.setQcssix(this.qcssix);
		shoukuanclass.setQcsfive(this.qcsfive);
	
		ri.editshoukuanMET(shoukuanclass);
		return null;
	}
	
	


}