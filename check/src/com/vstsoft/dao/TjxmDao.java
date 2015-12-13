package com.vstsoft.dao;

import java.util.List;


import com.vstsoft.model.Tongji;
import com.vstsoft.model.Tjdj;
import com.vstsoft.model.Tjxm;
import com.vstsoft.model.Yjtjb;
import com.vstsoft.model.Yjkh;
import com.vstsoft.model.Yjkhclass;

public interface TjxmDao {
	public List<Tjxm> tjxmMET(Tongji tongji);
	public List<Tjdj> tjdjMET(Tongji tongji);
	public List<Yjtjb> yjtjbMET(Tongji tongji);
	
	public List<Yjkh> yjkhMET(String year);
	public boolean addyjkhMET(Yjkhclass yjkhclass) ;
	public boolean edityjkhMET(Yjkhclass yjkhclass) ;
}