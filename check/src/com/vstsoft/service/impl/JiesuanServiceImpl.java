package com.vstsoft.service.impl;

import java.util.List;
import com.vstsoft.model.Tongji2;
import com.vstsoft.dao.JiesuanDao;
import com.vstsoft.model.Jiesuan;
import com.vstsoft.model.Jiesuanclass;
import com.vstsoft.model.Hkdj;
import com.vstsoft.model.Hkdjclass;
import com.vstsoft.model.Tcjs;
import com.vstsoft.model.Tcjsclass;
import com.vstsoft.service.JiesuanService;

public class JiesuanServiceImpl implements JiesuanService {

	private JiesuanDao jiedao ;
	
	

	public List<Jiesuan> jiesuanMET(Tongji2 tongji2) {
		List<Jiesuan> list = jiedao.jiesuanMET(tongji2);
		return list;
	}
	public List<Hkdj> hkdjMET(Tongji2 tongji2) {
		List<Hkdj> list = jiedao.hkdjMET(tongji2);
		return list;
	}
	public List<Tcjs> tcjsMET(Tongji2 tongji2) {
		List<Tcjs> list = jiedao.tcjsMET(tongji2);
		return list;
	}
	public boolean addhkdjMET(Hkdjclass hkdjclass) {
		boolean b = jiedao.addhkdjMET(hkdjclass);
		if(b){
			return true;
		}else{
			return false;
		}
	}

	public boolean edithkdjMET(Hkdjclass hkdjclass) {
		boolean b = jiedao.edithkdjMET(hkdjclass);
		if(b){
			return true;
		}else{
			return false;
		}
	}

	public boolean addtcjsMET(Tcjsclass tcjsclass) {
		boolean b = jiedao.addtcjsMET(tcjsclass);
		if(b){
			return true;
		}else{
			return false;
		}
	}

	public boolean edittcjsMET(Tcjsclass tcjsclass) {
		boolean b = jiedao.edittcjsMET(tcjsclass);
		if(b){
			return true;
		}else{
			return false;
		}
	}
	public boolean addjiesuanMET(Jiesuanclass jiesuanclass) {
		boolean b = jiedao.addjiesuanMET(jiesuanclass);
		if(b){
			return true;
		}else{
			return false;
		}
	}

	public boolean editjiesuanMET(Jiesuanclass jiesuanclass) {
		boolean b = jiedao.editjiesuanMET(jiesuanclass);
		if(b){
			return true;
		}else{
			return false;
		}
	}
	
	
	
	public JiesuanDao getJiedao() {
		return jiedao;
	}

	public void setJiedao(JiesuanDao jiedao) {
		this.jiedao = jiedao;
	}

}