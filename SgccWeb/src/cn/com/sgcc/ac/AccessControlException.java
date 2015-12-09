package cn.com.sgcc.ac;

public class AccessControlException extends Exception
{
	public AccessControlException()
	{
		super();
	}

	public AccessControlException(String message)
	{
		super(message);
	}

	public AccessControlException(String message, Throwable cause)
	{
		super(message, cause);
	}

	public AccessControlException(Throwable cause)
	{
		super(cause);
	}
}
