package com.vstsoft.service.impl;

import java.util.List;
import com.vstsoft.model.Tongji2;
import com.vstsoft.dao.RibaoDao;
import com.vstsoft.model.Ribao;
import com.vstsoft.model.Ribaob;
import com.vstsoft.model.Shoukuan;
import com.vstsoft.model.Shoukuanclass;

import com.vstsoft.service.RibaoService;

public class RibaoServiceImpl implements RibaoService {

	private RibaoDao ridao ;
	
	
	
	public List<Ribao> ribaoMET(Tongji2 tongji2) {
		List<Ribao> list = ridao.ribaoMET(tongji2);
		return list;
	}

	public List<Ribaob> ribaobMET(Tongji2 tongji2) {
		List<Ribaob> list = ridao.ribaobMET(tongji2);
		return list;
	}
	public List<Shoukuan> shoukuanMET(Tongji2 tongji2) {
		List<Shoukuan> list = ridao.shoukuanMET(tongji2);
		return list;
	}
	
	
	public boolean addshoukuanMET(Shoukuanclass shoukuanclass) {
		boolean b = ridao.addshoukuanMET(shoukuanclass);
		if(b){
			return true;
		}else{
			return false;
		}
	}

	public boolean editshoukuanMET(Shoukuanclass shoukuanclass) {
		boolean b = ridao.editshoukuanMET(shoukuanclass);
		if(b){
			return true;
		}else{
			return false;
		}
	}

	

	public RibaoDao getRidao() {
		return ridao;
	}

	public void setRidao(RibaoDao ridao) {
		this.ridao = ridao;
	}

}