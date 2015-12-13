package com.vstsoft.dao.impl;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.vstsoft.dao.StudentDao;
import com.vstsoft.model.Student;

public class StudentDaoImpl extends Student implements StudentDao {

	private SqlMapClient sqlMapClient;
	
	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		this.sqlMapClient = sqlMapClient;
	}
	
	public boolean del(int id) {
		try {
			int b = sqlMapClient.delete("del", id);
			if(b>0){
				return true;
			}else{
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public List<Student> queryAll() {
		List<Student> list = null;
		try {
			list = sqlMapClient.queryForList("queryAll");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public Student queryById(int id) {
		Student student = null;
		try {
			student = (Student) sqlMapClient.queryForObject("queryById", id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return student;
	}

	public boolean save(Student student) {
		boolean b ;
		try {
			sqlMapClient.insert("saveStu", student);
			b = true ;
		} catch (SQLException e) {
			e.printStackTrace();
			b = false;
		}
		return b ;
	}

	public boolean update(Student student) {
		boolean b ;
		try {
			sqlMapClient.update("updateStu", student);
			b = true;
		} catch (SQLException e) {
			e.printStackTrace();
			b = false;
		}
		return b;
	}

}
