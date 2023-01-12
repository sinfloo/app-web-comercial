package com.crediselva.dao.impl;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.crediselva.dao.SectorDao;
import com.crediselva.dto.Sector;

@Repository
public class SectorDaoImpl implements SectorDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	
	@Override
	public List<Sector> getAll() {
		String sql="select * from m_sector";
		List<Map<String,Object>> list = jdbcTemplate.queryForList(sql);
		List<Sector> listSector = new ArrayList<Sector>(); 
		list.forEach(s -> {
			Sector se = new Sector((Integer)s.get("n_id_sector"), (String)s.get("c_description"),(Date)s.get("d_audit_date"));
			listSector.add(se);
		}); 
		return listSector;
	}


	@SuppressWarnings("deprecation")
	@Override
	public Sector getSectorForId(int id) {
		String sql="select n_id_sector,c_description,d_audit_date from m_sector where n_id_sector=?";
		Sector sector=jdbcTemplate.queryForObject(sql, new Object[] {id},new SectorRowMapper());
		return sector;
	}

}
