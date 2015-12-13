package com.vstsoft.dao.impl;


import com.ibatis.sqlmap.client.SqlMapClient;
import com.vstsoft.dao.UserDao;

import com.vstsoft.model.User;
import java.sql.SQLException;

public class UserDaoImpl extends User implements UserDao {
	
private SqlMapClient sqlMapClient;

	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		this.sqlMapClient = sqlMapClient;
	}

	
	
	public String queryPassword(String userName){ 
		String Password = null;
		try {
			Password = (String) sqlMapClient.queryForObject("queryPassword", userName);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return Password;
	}

	
	

}
