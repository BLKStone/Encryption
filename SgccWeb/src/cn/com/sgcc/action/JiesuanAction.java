package cn.com.sgcc.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class JiesuanAction extends ActionSupport{

	
	
	private String cong ;
	private String dao ;

	HttpServletRequest request = ServletActionContext.getRequest();
	
	public String jiesuanMET() throws Exception {
		System.out.println("********jiesuanMET********");
//		Tongji2 tongji2 = new Tongji2();
//		tongji2.setCong(this.cong);
//		tongji2.setDao(this.dao);
//		List<Jiesuan> list = jie.jiesuanMET(tongji2);
//		JSONObject json = new JSONObject();
//		json.accumulate("Rows", list);
//		System.out.println(">>>>>>>>>>json"+json);    
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/x-json;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache"); 
//		response.getWriter().print(json.toString());
		return null;
	}

	


}