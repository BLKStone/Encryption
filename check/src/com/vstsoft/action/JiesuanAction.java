package com.vstsoft.action;

import java.util.List;
import com.vstsoft.model.Tongji2;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.vstsoft.model.Jiesuan;
import com.vstsoft.model.Jiesuanclass;
import com.vstsoft.model.Hkdj;
import com.vstsoft.model.Hkdjclass;
import com.vstsoft.model.Tcjs;
import com.vstsoft.model.Tcjsclass;
import com.vstsoft.service.JiesuanService;

public class JiesuanAction extends ActionSupport{

	private JiesuanService jie ;
	private List<Jiesuan> list;
	
	
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
	private String hkjg ;
	private String hkdw ;
	private String hkrq ;
	private String hkje ;	
	private String zcf ;
	private String jtf ;
	private String zsf ;
	private String qt ;
	
	public int getXh() {
		return xh;
	}
	public void setXh(int xh) {
		this.xh = xh;
	}
	public String getHkjg() {
		return hkjg;
	}
	public void setHkjg(String hkjg) {
		this.hkjg = hkjg;
	}
	public String getHkdw() {
		return hkdw;
	}
	public void setHkdw(String hkdw) {
		this.hkdw = hkdw;
	}
	public String getHkrq() {
		return hkrq;
	}
	public void setHkrq(String hkrq) {
		this.hkrq = hkrq;
	}
	public String getHkje() {
		return hkje;
	}
	public void setHkje(String hkje) {
		this.hkje = hkje;
	}
	public String getZcf() {
		return zcf;
	}
	public void setZcf(String zcf) {
		this.zcf = zcf;
	}
	public String getJtf() {
		return jtf;
	}
	public void setJtf(String jtf) {
		this.jtf = jtf;
	}
	public String getZsf() {
		return zsf;
	}
	public void setZsf(String zsf) {
		this.zsf = zsf;
	}
	public String getQt() {
		return qt;
	}
	public void setQt(String qt) {
		this.qt = qt;
	}


	private String tcbl ;
	private String czqkk ;
	private String ddkx ;


	public String getTcbl() {
		return tcbl;
	}
	public void setTcbl(String tcbl) {
		this.tcbl = tcbl;
	}
	public String getCzqkk() {
		return czqkk;
	}
	public void setCzqkk(String czqkk) {
		this.czqkk = czqkk;
	}
	public String getDdkx() {
		return ddkx;
	}
	public void setDdkx(String ddkx) {
		this.ddkx = ddkx;
	}
	
	
	

	private String xstc ;
	private String cwsh ;	
	private String kp ;
	private String xcsktz ;
	private String kptt ;

	public String getXstc() {
		return xstc;
	}
	public void setXstc(String xstc) {
		this.xstc = xstc;
	}
	public String getCwsh() {
		return cwsh;
	}
	public void setCwsh(String cwsh) {
		this.cwsh = cwsh;
	}
	public String getKp() {
		return kp;
	}
	public void setKp(String kp) {
		this.kp = kp;
	}
	public String getXcsktz() {
		return xcsktz;
	}
	public void setXcsktz(String xcsktz) {
		this.xcsktz = xcsktz;
	}
	public String getKptt() {
		return kptt;
	}
	public void setKptt(String kptt) {
		this.kptt = kptt;
	}
	

	public List<Jiesuan> getList() {
		return list;
	}

	public void setList(List<Jiesuan> list) {
		this.list = list;
	}

	public JiesuanService getJie() {
		return jie;
	}

	public void setJie(JiesuanService jie) {
		this.jie = jie;
	}

	HttpServletRequest request = ServletActionContext.getRequest();
	
	public String jiesuanMET() throws Exception {
		System.out.println("********jiesuanMET********");
		Tongji2 tongji2 = new Tongji2();
		tongji2.setCong(this.cong);
		tongji2.setDao(this.dao);
		List<Jiesuan> list = jie.jiesuanMET(tongji2);
		JSONObject json = new JSONObject();
		json.accumulate("Rows", list);
		System.out.println(">>>>>>>>>>json"+json);    
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/x-json;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache"); 
		response.getWriter().print(json.toString());
		return null;
	}

	public String hkdjMET() throws Exception {
		System.out.println("********hkdjMET********");
		Tongji2 tongji2 = new Tongji2();
		tongji2.setCong(this.cong);
		tongji2.setDao(this.dao);
		List<Hkdj> list = jie.hkdjMET(tongji2);
		JSONObject json = new JSONObject();
		json.accumulate("Rows", list);
		System.out.println(">>>>>>>>>>json"+json);    
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/x-json;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache"); 
		response.getWriter().print(json.toString());
		return null;
	}
	public String addhkdjMET() throws Exception {
		System.out.println("********addhkdjMET*********");
		Hkdjclass hkdjclass = new Hkdjclass();
				
	
		hkdjclass.setXh(this.xh);
		hkdjclass.setHkjg(this.hkjg);
		hkdjclass.setHkdw(this.hkdw);
		hkdjclass.setHkrq(this.hkrq);
		hkdjclass.setHkje(this.hkje);
		hkdjclass.setZcf(this.zcf);
		hkdjclass.setJtf(this.jtf);
		hkdjclass.setZsf(this.zsf);
		hkdjclass.setQt(this.qt);
	
		jie.addhkdjMET(hkdjclass);
		return null;
	}


	public String edithkdjMET() throws Exception {
		System.out.println("********edithkdjMET*********");
		Hkdjclass hkdjclass = new Hkdjclass();
		
		
		hkdjclass.setXh(this.xh);
		hkdjclass.setHkjg(this.hkjg);
		hkdjclass.setHkdw(this.hkdw);
		hkdjclass.setHkrq(this.hkrq);
		hkdjclass.setHkje(this.hkje);
		hkdjclass.setZcf(this.zcf);
		hkdjclass.setJtf(this.jtf);
		hkdjclass.setZsf(this.zsf);
		hkdjclass.setQt(this.qt);
	
		jie.edithkdjMET(hkdjclass);
		return null;
	}
	
	
	public String tcjsMET() throws Exception {
		System.out.println("********tcjsMET********");
		Tongji2 tongji2 = new Tongji2();
		tongji2.setCong(this.cong);
		tongji2.setDao(this.dao);
		List<Tcjs> list = jie.tcjsMET(tongji2);
		JSONObject json = new JSONObject();
		json.accumulate("Rows", list);
		System.out.println(">>>>>>>>>>json"+json);    
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/x-json;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache"); 
		response.getWriter().print(json.toString());
		return null;
	}
	
	
	public String addtcjsMET() throws Exception {
		System.out.println("********addtcjsMET*********");
		Tcjsclass tcjsclass = new Tcjsclass();
	
	
		tcjsclass.setXh(this.xh);
		tcjsclass.setTcbl(this.tcbl);
		tcjsclass.setCzqkk(this.czqkk);
		tcjsclass.setDdkx(this.ddkx);
	
		jie.addtcjsMET(tcjsclass);
		return null;
	}


	public String edittcjsMET() throws Exception {
		System.out.println("********edittcjsMET*********");
		Tcjsclass tcjsclass = new Tcjsclass();
		
		
		tcjsclass.setXh(this.xh);
		tcjsclass.setTcbl(this.tcbl);
		tcjsclass.setCzqkk(this.czqkk);
		tcjsclass.setDdkx(this.ddkx);
	
		jie.edittcjsMET(tcjsclass);
		return null;
	}

	


	public String addjiesuanMET() throws Exception {
		System.out.println("********addjiesuanMET*********");
		Jiesuanclass jiesuanclass = new Jiesuanclass();
	
	
		jiesuanclass.setXh(this.xh);
		jiesuanclass.setXstc(this.xstc);
		jiesuanclass.setCwsh(this.cwsh);
		jiesuanclass.setKp(this.kp);
		jiesuanclass.setXcsktz(this.xcsktz);
		jiesuanclass.setKptt(this.kptt);
	
		jie.addjiesuanMET(jiesuanclass);
		return null;
	}


	public String editjiesuanMET() throws Exception {
		System.out.println("********editjiesuanMET*********");
		Jiesuanclass jiesuanclass = new Jiesuanclass();
		
		
		jiesuanclass.setXh(this.xh);
		jiesuanclass.setXstc(this.xstc);
		jiesuanclass.setCwsh(this.cwsh);
		jiesuanclass.setKp(this.kp);
		jiesuanclass.setXcsktz(this.xcsktz);
		jiesuanclass.setKptt(this.kptt);
	
		jie.editjiesuanMET(jiesuanclass);
		return null;
	}

	
	


}