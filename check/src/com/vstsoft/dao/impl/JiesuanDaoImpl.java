package com.vstsoft.dao.impl;

import java.sql.SQLException;
import java.util.List;
import com.vstsoft.model.Tongji2;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.vstsoft.dao.JiesuanDao;
import com.vstsoft.model.Jiesuan;
import com.vstsoft.model.Jiesuanclass;
import com.vstsoft.model.Hkdj;
import com.vstsoft.model.Hkdjclass;
import com.vstsoft.model.Tcjsclass;
import com.vstsoft.model.Tcjs;

public class JiesuanDaoImpl extends Jiesuan implements JiesuanDao {

	private SqlMapClient sqlMapClient;
	
	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		this.sqlMapClient = sqlMapClient;
	}
	
	

	@SuppressWarnings("unchecked")
	public List<Jiesuan> jiesuanMET(Tongji2 tongji2) {
		List<Jiesuan> list = null;
		try {
			list = sqlMapClient.queryForList("jiesuanMET",tongji2);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Hkdj> hkdjMET(Tongji2 tongji2) {
		List<Hkdj> list = null;
		try {
			list = sqlMapClient.queryForList("hkdjMET",tongji2);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean addhkdjMET(Hkdjclass hkdjclass) {
		boolean b ;
		try {
			sqlMapClient.insert("addhkdjMET", hkdjclass);
			b = true ;
		} catch (SQLException e) {
			e.printStackTrace();
			b = false;
		}
		return b ;
	}

	
	public boolean edithkdjMET(Hkdjclass hkdjclass) {
		boolean b ;
		try {
			sqlMapClient.update("edithkdjMET", hkdjclass);
			b = true;
		} catch (SQLException e) {
			e.printStackTrace();
			b = false;
		}
		return b;
	}
	
	public boolean addtcjsMET(Tcjsclass tcjsclass) {
		boolean b ;
		try {
			sqlMapClient.insert("addtcjsMET", tcjsclass);
			b = true ;
		} catch (SQLException e) {
			e.printStackTrace();
			b = false;
		}
		return b ;
	}

	
	public boolean edittcjsMET(Tcjsclass tcjsclass) {
		boolean b ;
		try {
			sqlMapClient.update("edittcjsMET", tcjsclass);
			b = true;
		} catch (SQLException e) {
			e.printStackTrace();
			b = false;
		}
		return b;
	}
	
	
	
	
	
	public boolean addjiesuanMET(Jiesuanclass jiesuanclass) {
		boolean b ;
		try {
			sqlMapClient.insert("addjiesuanMET", jiesuanclass);
			b = true ;
		} catch (SQLException e) {
			e.printStackTrace();
			b = false;
		}
		return b ;
	}

	
	public boolean editjiesuanMET(Jiesuanclass jiesuanclass) {
		boolean b ;
		try {
			sqlMapClient.update("editjiesuanMET", jiesuanclass);
			b = true;
		} catch (SQLException e) {
			e.printStackTrace();
			b = false;
		}
		return b;
	}
	
	
	
	public List<Tcjs> tcjsMET(Tongji2 tongji2) {
		List<Tcjs> list = null;
		try {
			list = sqlMapClient.queryForList("tcjsMET",tongji2);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}


}