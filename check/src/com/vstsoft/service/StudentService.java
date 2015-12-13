package com.vstsoft.service;

import java.util.List;

import com.vstsoft.model.Student;

public interface StudentService {
	public List<Student> queryAll();
	public boolean save(Student student) ;
	public boolean del(int id) ;
	public boolean update(Student student) ;
	public Student queryById(int id);
}
