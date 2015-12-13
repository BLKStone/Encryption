package cn.com.sgcc.ac;

import java.util.List;

import org.apache.commons.logging.*;

import cn.com.sgcc.db.*;
import cn.com.sgcc.dao.*;
import cn.com.sgcc.vo.*;

public class AccessControlImpl implements AccessControl
{
	private DatabaseLayer databaseLayer;

	private static Log logger = LogFactory.getLog(AccessControlImpl.class);

	public void setDatabaseLayer(DatabaseLayer databaseLayer)
	{
		this.databaseLayer = databaseLayer;
	}

	// may return null
	public License execute(User user, Resource resource, AccessControlContext context)
	{
		License rt = null;

		try
		{
			if (databaseLayer.getIpRangeDao().isValidIp(context.getIp()))
			{
				Resource resourceFind = databaseLayer.getResourceDao().select(resource.getNameHash());

				if (null != resourceFind)
				{
					rt = new License();
					rt.setResource(resourceFind);
				}
				else
				{
					System.out.println("resource is null");
					logger.error(new StringBuilder().append(context.getIp()).append(" ").append(resource.getNameHash()).append(" rid not exists").toString());
				}
			}
			else
			{
				logger.error(new StringBuilder().append(context.getIp()).append(" ").append(resource.getNameHash()).append(" ip not valid").toString());
			}
		}
		catch (DaoException e)
		{
			System.out.println(e.getMessage());
			logger.error(e);
		}

		return rt;
	}
}
