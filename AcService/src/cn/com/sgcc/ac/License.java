package cn.com.sgcc.ac;

import cn.com.sgcc.vo.*;
import cn.com.sgcc.generic.*;

public class License
{
	private User user;
	private Resource resource;

	public User getUser()
	{
		return user;
	}

	public void setUser(User user)
	{
		this.user = user;
	}

	public Resource getResource()
	{
		return resource;
	}

	public void setResource(Resource resource)
	{
		this.resource = resource;
	}

	public String toXmlString()
	{
		if (getResource().getRights().getOnlineDisplayable() ||
				getResource().getRights().getOnlineCopyable() ||
				getResource().getRights().getOnlinePrintable() ||
				getResource().getRights().getOfflineDisplayable() ||
				getResource().getRights().getOfflineCopyable() ||
				getResource().getRights().getOfflinePrintable())
		{
			StringBuilder sb = new StringBuilder();
			sb.append("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
			sb.append("<license>");
			sb.append("<rid>");
			sb.append(getResource().getNameHash());
			sb.append("</rid>");
			sb.append("<key>");
			sb.append(getResource().getKey());
			sb.append("</key>");
			sb.append("<iv>");
			sb.append(getResource().getIv());
			sb.append("</iv>");
			sb.append("<rights>");
			if (getResource().getRights().getOnlineDisplayable() ||
					getResource().getRights().getOnlineCopyable() ||
					getResource().getRights().getOnlinePrintable())
			{
				sb.append("<online>");
				if (getResource().getRights().getOnlineDisplayable())
				{
					sb.append("<display/>");
				}
				if (getResource().getRights().getOnlineCopyable())
				{
					sb.append("<copy/>");
				}
				if (getResource().getRights().getOnlinePrintable())
				{
					sb.append("<print/>");
				}
				sb.append("</online>");
			}
			if (getResource().getRights().getOfflineDisplayable() ||
					getResource().getRights().getOfflineCopyable() ||
					getResource().getRights().getOfflinePrintable())
			{
				sb.append("<offline>");
				if (getResource().getRights().getOfflineDisplayable())
				{
					sb.append("<display");
					if (getResource().getRights().getOfflineDisplayDuration() != -1)
					{
						sb.append(" duration=\"" + getResource().getRights().getOfflineDisplayDuration() + "\"");
					}
					if (getResource().getRights().getOfflineDisplayCount() != -1)
					{
						sb.append(" count=\"" + getResource().getRights().getOfflineDisplayCount() + "\"");
					}
					sb.append("/>");
				}
				if (getResource().getRights().getOfflineCopyable())
				{
					sb.append("<copy/>");
				}
				if (getResource().getRights().getOfflinePrintable())
				{
					sb.append("<print/>");
				}
				sb.append("</offline>");
			}
			sb.append("</rights>");
			sb.append("</license>");

			return sb.toString();
		}
		else
		{
			return null;
		}
	}
}
