package com.vstsoft.action;

import java.util.Map;

import com.vstsoft.service.LoginService;
import com.vstsoft.model.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private LoginService loginService;
	
	private User user;

	@Override
	public String execute() {
		try {
			if(null == user) {
				return INPUT;
			}
			
			boolean isLogin = loginService.login(user);
			
			//登录成功，将状态记入session
			if(isLogin) {
				Map<String, Object> session = ActionContext.getContext().getSession();
				session.put("login_user", user.getUserName());
				return SUCCESS;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ERROR;
	}
	
	public String logOut() {
		Map<String, Object> session = ActionContext.getContext().getSession();
		session.remove("login_user");
		user = null;
		return SUCCESS;
	}

	public LoginService getLoginService() {
		return loginService;
	}

	public void setLoginService(LoginService loginService) {
		this.loginService = loginService;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
