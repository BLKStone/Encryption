package cn.com.sgcc.ds;

import java.sql.*;

public class DataSourceImpl implements DataSource
{
	private String driver;
	private String url;
	private String user;
	private String password;

	private boolean isInited = false;

	public void setDriver(String driver)
	{
		this.driver = driver;
	}

	public void setUrl(String url)
	{
		this.url = url;
	}

	public void setUser(String user)
	{
		this.user = user;
	}

	public void setPassword(String password)
	{
		this.password = password;
	}

	private void init()
	{
		try
		{
			Class.forName(driver).newInstance();
			isInited = true;
		}
		catch (Exception e)
		{
			throw new RuntimeException(e);
		}
	}

	@Override
	public Connection getConnection()
	{
		if (!isInited)
		{
			init();
		}
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Connection error");
		}
		if (conn == null){
			System.out.println("Connection error");
		}
		
		return conn;
	}
}
