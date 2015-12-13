package com.vstsoft.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.vstsoft.model.Student;
import com.vstsoft.service.StudentService;

public class StudentAction extends ActionSupport{

	private StudentService ss ;
	private List<Student> list;
	private int id ;
	private String username ;
	private String stuid;
	private String phone;
	private String address;
	private String email;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<Student> getList() {
		return list;
	}

	public void setList(List<Student> list) {
		this.list = list;
	}

	public StudentService getSs() {
		return ss;
	}

	public void setSs(StudentService ss) {
		this.ss = ss;
	}

	HttpServletRequest request = ServletActionContext.getRequest();
	
	public String queryAll() throws Exception {
		System.out.println("********queryAll********");
		List<Student> list = ss.queryAll();
		JSONObject json = new JSONObject();
		json.accumulate("Rows", list);
		System.out.println(">>>>>>>>>>json"+json);    
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/x-json;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache"); 
		response.getWriter().print(json.toString());
		return null;
	}

	public String del() throws Exception {
		System.out.println(">>>>>>>>del>>>>>>>");
		System.out.println(">>>>>>>>>id="+this.getId());
		ss.del(this.getId());
		return null;
	}

	public String queryById() throws Exception {
		System.out.println(">>>>>>>>>id="+this.getId());
		Student student = ss.queryById(this.getId());
		JSONObject json = new JSONObject();
		json.accumulate("student", student);
		System.out.println(">>>>>>>json="+json);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/x-json;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache"); 
		response.getWriter().print(json.toString());
		return null;
	}

	public String change() throws Exception {
		System.out.println("********change*********");
		Student student = new Student();
		student.setUsername(this.username);
		student.setStuid(this.stuid);
		student.setPhone(this.phone);
		student.setEmail(this.email);
		student.setAddress(this.address);
		student.setId(this.id);
		ss.update(student);
		return null;
	}


	public String save() throws Exception {
		Student student = new Student();
		student.setUsername(this.username);
		student.setStuid(this.stuid);
		student.setPhone(this.phone);
		student.setEmail(this.email);
		student.setAddress(this.address);
		ss.save(student);
		return null;
	}
	
	public String getStuid() {
		return stuid;
	}

	public void setStuid(String stuid) {
		this.stuid = stuid;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
}
