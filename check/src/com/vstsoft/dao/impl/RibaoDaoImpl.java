package com.vstsoft.dao.impl;

import java.sql.SQLException;
import java.util.List;
import com.vstsoft.model.Tongji2;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.vstsoft.dao.RibaoDao;
import com.vstsoft.model.Ribao;
import com.vstsoft.model.Ribaob;
import com.vstsoft.model.Shoukuan;
import com.vstsoft.model.Shoukuanclass;
import com.vstsoft.model.Tjxm;
import com.vstsoft.model.Tongji;
public class RibaoDaoImpl extends Ribao implements RibaoDao {

	private SqlMapClient sqlMapClient;
	
	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		this.sqlMapClient = sqlMapClient;
	}
	
	
	public List<Ribao> ribaoMET(Tongji2 tongji2) {
		List<Ribao> list = null;
		try {
			list = sqlMapClient.queryForList("ribaoMET", tongji2);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Ribaob> ribaobMET(Tongji2 tongji2) {
		List<Ribaob> list = null;
		try {
			list = sqlMapClient.queryForList("ribaobMET", tongji2);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<Shoukuan> shoukuanMET(Tongji2 tongji2) {
		List<Shoukuan> list = null;
		try {
			list = sqlMapClient.queryForList("shoukuanMET", tongji2);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public boolean addshoukuanMET(Shoukuanclass shoukuanclass) {
		boolean b ;
		try {
			sqlMapClient.insert("addshoukuanMET", shoukuanclass);
			b = true ;
		} catch (SQLException e) {
			e.printStackTrace();
			b = false;
		}
		return b ;
	}

	
	public boolean editshoukuanMET(Shoukuanclass shoukuanclass) {
		boolean b ;
		try {
			sqlMapClient.update("editshoukuanMET", shoukuanclass);
			b = true;
		} catch (SQLException e) {
			e.printStackTrace();
			b = false;
		}
		return b;
	}

}