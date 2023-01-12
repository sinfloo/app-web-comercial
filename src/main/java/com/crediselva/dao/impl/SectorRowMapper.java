package com.crediselva.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.crediselva.dto.Sector;

public class SectorRowMapper implements RowMapper<Sector>{

	@Override
	public Sector mapRow(ResultSet rs, int rowNum) throws SQLException {
		Sector sector=new Sector();
		sector.setId_sector(rs.getInt("n_id_sector"));
		sector.setDescription(rs.getString("c_description"));
		sector.setAuditDate(rs.getDate("d_audit_date"));
		return sector;
	}

}
