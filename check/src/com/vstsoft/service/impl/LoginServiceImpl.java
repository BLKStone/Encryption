package com.vstsoft.service.impl;

import com.vstsoft.dao.UserDao;
import com.vstsoft.service.LoginService;
import com.vstsoft.model.User;

public class LoginServiceImpl implements LoginService {
	
	private UserDao userDao;

	public boolean login(User user) throws Exception {
		
		String password = userDao.queryPassword(user.getUserName());
		
		if(user.getPassword().equals(password)) {
			return true;
		}
		
		return false;
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

}
