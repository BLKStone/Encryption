package cn.com.sgcc.ac;

import cn.com.sgcc.vo.*;

public interface AccessControl
{
	// may return null
	public License execute(User user, Resource resource, AccessControlContext context);
}
