package cn.com.sgcc.servlet;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

import org.apache.commons.logging.*;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import cn.com.sgcc.vo.*;
import cn.com.sgcc.ac.*;
import cn.com.sgcc.generic.*;

public class LicenseServlet extends HttpServlet
{
	private AccessControl accessControl;

	private static Log logger = LogFactory.getLog(LicenseServlet.class);

	/*
	public void setAccessControl(AccessControl accessControl)
	{
		this.accessControl = accessControl;
	}
	*/

	@Override
	public void init(ServletConfig servletConfig) throws ServletException 
	{ 
		ServletContext servletContext = servletConfig.getServletContext(); 
		WebApplicationContext webApplicationContext = WebApplicationContextUtils.getWebApplicationContext(servletContext); 
		accessControl = (AccessControl) webApplicationContext.getBean("AccessControlBean");
	} 

    @Override
    public void doGet(HttpServletRequest request,
                      HttpServletResponse response) throws IOException
    {
		{
			// context
			AccessControlContext context = new AccessControlContext();
			context.setIp(request.getRemoteAddr());
			//context.setIp("127.0.0.1");
			
			// get rid
			String[] ridNames = { "RID", "rid", "Rid" };
			String rid = null;
			for (int i = 0; i < ridNames.length; ++i)
			{
				rid = request.getParameter(ridNames[i]);
				if (null != rid)
				{
					break;
				}
			}
			if (null == rid)
			{
				logger.error(new StringBuilder().append(context.getIp()).append(" no rid").toString());
				response.sendError(400, "no rid");
				return;
			}

			// get uid
			String[] uidNames = { "UID", "uid", "Uid" };
			String uid = null;
			for (int i = 0; i < uidNames.length; ++i)
			{
				uid = request.getParameter(uidNames[i]);
				if (null != uid)
				{
					break;
				}
			}
			/*	
				if (null == uid)
				{
				response.sendError(ErrorCode.PARAM_NULL_UID);
				return;
				}
				*/

			// user
			User user = new User();
			user.setName(uid);

			// resource 
			Resource resource = new Resource();
			resource.setNameHash(rid);

			logger.info(new StringBuilder().append(context.getIp()).append(" ").append(rid).append(" license request").toString());
			
			// execute access control
			License license = accessControl.execute(user, resource, context);
			if (null == license || null == license.toXmlString())
			{
				logger.info(new StringBuilder().append(context.getIp()).append(" ").append(rid).append(" license deny").toString());
				response.sendError(400, "Bad request: no permission or rid not exists");
				return;
			}

			// response
			response.setContentType("text/xml;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println(license.toXmlString());
			out.close();

			logger.info(new StringBuilder().append(context.getIp()).append(" ").append(rid).append(" license return").toString());
		}
    }

	@Override
	public void doPost(HttpServletRequest request,
			HttpServletResponse response)  throws IOException
	{
		doGet(request, response);
	}

}
