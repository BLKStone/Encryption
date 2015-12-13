package com.vstsoft.service.impl;

import java.util.List;

import com.vstsoft.dao.TjxmDao;
import com.vstsoft.model.Tjxm;
import com.vstsoft.model.Tongji;
import com.vstsoft.model.Tjdj;
import com.vstsoft.model.Yjtjb;
import com.vstsoft.model.Yjkh;
import com.vstsoft.model.Yjkhclass;
import com.vstsoft.service.TjxmService;

public class TjxmServiceImpl implements TjxmService {

	private TjxmDao tjdao ;
	
	

	public List<Tjxm> tjxmMET(Tongji tongji) {
		List<Tjxm> list = tjdao.tjxmMET(tongji);
		return list;
	}

	public List<Tjdj> tjdjMET(Tongji tongji) {
		List<Tjdj> list = tjdao.tjdjMET(tongji);
		return list;
	}
	public List<Yjtjb> yjtjbMET(Tongji tongji) {
		List<Yjtjb> list = tjdao.yjtjbMET(tongji);
		return list;
	}
	public List<Yjkh> yjkhMET(String year) {
		List<Yjkh> list = tjdao.yjkhMET(year);
		return list;
	}
	public boolean addyjkhMET(Yjkhclass yjkhclass) {
		boolean b = tjdao.addyjkhMET(yjkhclass);
		if(b){
			return true;
		}else{
			return false;
		}
	}

	public boolean edityjkhMET(Yjkhclass yjkhclass) {
		boolean b = tjdao.edityjkhMET(yjkhclass);
		if(b){
			return true;
		}else{
			return false;
		}
	}
	
	
	
	
	

	

	public TjxmDao getTjdao() {
		return tjdao;
	}

	public void setTjdao(TjxmDao tjdao) {
		this.tjdao = tjdao;
	}

}