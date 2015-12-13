package com.vstsoft.service;

import java.util.List;

import com.vstsoft.model.Jiesuan;
import com.vstsoft.model.Jiesuanclass;
import com.vstsoft.model.Hkdj;
import com.vstsoft.model.Hkdjclass;
import com.vstsoft.model.Tcjsclass;
import com.vstsoft.model.Tcjs;
import com.vstsoft.model.Tongji2;

public interface JiesuanService {
	public List<Jiesuan> jiesuanMET(Tongji2 tongji2);
	public List<Hkdj> hkdjMET(Tongji2 tongji2);
	public List<Tcjs> tcjsMET(Tongji2 tongji2);
	public boolean addhkdjMET(Hkdjclass hkdjclass);
	public boolean edithkdjMET(Hkdjclass hkdjclass);
	
	public boolean addtcjsMET(Tcjsclass tcjsclass);
	public boolean edittcjsMET(Tcjsclass tcjsclass);
	
	public boolean addjiesuanMET(Jiesuanclass jiesuanclass);
	public boolean editjiesuanMET(Jiesuanclass jiesuanclass);
}
