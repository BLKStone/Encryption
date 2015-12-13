package com.vstsoft.service.impl;

import java.util.List;

import com.vstsoft.dao.StudentDao;
import com.vstsoft.model.Student;
import com.vstsoft.service.StudentService;

public class StudentServiceImpl implements StudentService {

	private StudentDao sdao ;
	
	public boolean del(int id) {
		boolean b = sdao.del(id);
		if(b){
			return true ;
		}else{
			return false;
		}
	}

	public List<Student> queryAll() {
		List<Student> list = sdao.queryAll();
		return list;
	}

	public Student queryById(int id) {
		Student student = sdao.queryById(id);
		return student;
	}

	public boolean save(Student student) {
		boolean b = sdao.save(student);
		if(b){
			return true;
		}else{
			return false;
		}
	}

	public boolean update(Student student) {
		boolean b = sdao.update(student);
		if(b){
			return true;
		}else{
			return false;
		}
	}

	public StudentDao getSdao() {
		return sdao;
	}

	public void setSdao(StudentDao sdao) {
		this.sdao = sdao;
	}

}
