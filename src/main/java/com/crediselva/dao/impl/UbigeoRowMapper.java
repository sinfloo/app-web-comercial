package com.crediselva.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.crediselva.dto.Departament;
import com.crediselva.dto.District;
import com.crediselva.dto.Province;
import com.crediselva.dto.Ubigeo;

public class UbigeoRowMapper implements RowMapper<Ubigeo>{

	@Override
	public Ubigeo mapRow(ResultSet rs, int rowNum) throws SQLException {
		Ubigeo ubigeo=new Ubigeo();
		ubigeo.setN_id_ubigeo(rs.getInt("n_id_ubigeo"));
		ubigeo.setDistrict(new District(String.valueOf(rs.getInt("n_id_ubigeo")),rs.getString("c_provincia_inei"),rs.getString("c_distrito")));
		ubigeo.setProvince(new Province(rs.getString("c_provincia_inei"),rs.getString("c_departamento_inei"),rs.getString("c_provincia")));
		ubigeo.setDepartament(new Departament(rs.getString("c_departamento_inei"),rs.getString("c_departamento")));
		return ubigeo;
	}

}
