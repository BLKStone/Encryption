package com.vstsoft.dao;

import java.util.List;


import com.vstsoft.model.Tongji2;
import com.vstsoft.model.Ribao;
import com.vstsoft.model.Ribaob;
import com.vstsoft.model.Shoukuan;
import com.vstsoft.model.Shoukuanclass;
public interface RibaoDao {
	public List<Ribao> ribaoMET(Tongji2 tongji2);
	public List<Ribaob> ribaobMET(Tongji2 tongji2);
	public List<Shoukuan> shoukuanMET(Tongji2 tongji2);
	public boolean addshoukuanMET(Shoukuanclass shoukuanclass) ;
	public boolean editshoukuanMET(Shoukuanclass shoukuanclass) ;
}