package cn.com.sgcc.crypto;

import java.io.*;

import cn.com.sgcc.vo.*;
import cn.com.sgcc.inform.*;

public interface Cipher
{
	// return encrypt result
	public int encryptFile(File fromFile, File toDir, Rights rights, boolean force);

	// may return null
	public EncryptResult encryptDir(File fromDir, File toDir, Rights rights, boolean force, Informer informer);
}
