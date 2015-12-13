package com.vstsoft.dao.impl;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.vstsoft.dao.TjxmDao;

import com.vstsoft.model.Tjxm;
import com.vstsoft.model.Tongji;
import com.vstsoft.model.Tjdj;
import com.vstsoft.model.Yjtjb;
import com.vstsoft.model.Yjkh;
import com.vstsoft.model.Yjkhclass;


public class TjxmDaoImpl extends Tjxm implements TjxmDao {

	private SqlMapClient sqlMapClient;
	
	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		this.sqlMapClient = sqlMapClient;
	}
	
	

	public List<Tjxm> tjxmMET(Tongji tongji) {
		List<Tjxm> list = null;
		try {
			list = sqlMapClient.queryForList("tjxmMET", tongji);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Tjdj> tjdjMET(Tongji tongji) {
		List<Tjdj> list = null;
		try {
			list = sqlMapClient.queryForList("tjdjMET", tongji);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<Yjtjb> yjtjbMET(Tongji tongji) {
		List<Yjtjb> list = null;
		try {
			list = sqlMapClient.queryForList("yjtjbMET", tongji);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Yjkh> yjkhMET(String year) {
		List<Yjkh> list = null;
		try {
			list = sqlMapClient.queryForList("yjkhMET",year);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	public boolean addyjkhMET(Yjkhclass yjkhclass) {
		boolean b ;
		try {
			sqlMapClient.insert("addyjkhMET", yjkhclass);
			b = true ;
		} catch (SQLException e) {
			e.printStackTrace();
			b = false;
		}
		return b ;
	}

	
	public boolean edityjkhMET(Yjkhclass yjkhclass) {
		boolean b ;
		try {
			sqlMapClient.update("edityjkhMET", yjkhclass);
			b = true;
		} catch (SQLException e) {
			e.printStackTrace();
			b = false;
		}
		return b;
	}
	
}