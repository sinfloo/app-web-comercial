package com.crediselva.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.crediselva.dao.UbigeoDao;
import com.crediselva.dto.Departament;
import com.crediselva.dto.District;
import com.crediselva.dto.Province;
import com.crediselva.dto.Ubigeo;

@Repository
public class UbigeoDaoImpl implements UbigeoDao {


	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public List<Departament> getDepartamentAll() {
		String sql="SELECT DISTINCT c_departamento_inei,c_departamento FROM m_ubigeo";
		List<Map<String,Object>> list = jdbcTemplate.queryForList(sql);
		List<Departament> listDep = new ArrayList<Departament>(); 
		list.forEach(d -> {
			Departament dep = new Departament((String)d.get("c_departamento_inei"), (String)d.get("c_departamento"));
			listDep.add(dep);
		}); 
		return listDep;
	}

	@Override
	public List<Province> getProvinceForDepartament(String id_departament) {
		String sql="SELECT DISTINCT c_provincia_inei,c_departamento_inei,c_provincia FROM m_ubigeo where c_departamento_inei=?";
		List<Map<String,Object>> list = jdbcTemplate.queryForList(sql,id_departament);
		List<Province> listProv = new ArrayList<Province>(); 
		list.forEach(d -> {
			Province prov = new Province((String)d.get("c_provincia_inei"),(String)d.get("c_departamento_inei"), (String)d.get("c_provincia"));
			listProv.add(prov);
		}); 
		return listProv;
	}

	@Override
	public List<District> getDistrictForProvince(String id_province) {
		String sql="SELECT DISTINCT n_id_ubigeo,c_provincia_inei,c_distrito FROM m_ubigeo where c_provincia_inei=?";
		List<Map<String,Object>> list = jdbcTemplate.queryForList(sql,id_province);
		List<District> listDist = new ArrayList<District>(); 
		list.forEach(d -> {
			District dis = new District((String)String.valueOf(d.get("n_id_ubigeo")),(String)d.get("c_provincia_inei"), (String)d.get("c_distrito"));
			listDist.add(dis);
		}); 
		return listDist;
	}

	@SuppressWarnings("deprecation")
	@Override
	public Ubigeo getUbigeo(String id_ubigeo) {
		String sql="SELECT n_id_ubigeo,c_ubigeo_inei,c_distrito,c_provincia_inei,c_provincia,c_departamento_inei,c_departamento FROM m_ubigeo where n_id_ubigeo=?";
		Ubigeo ubigeo=null;
		try {
			ubigeo=jdbcTemplate.queryForObject(sql,new Object[] {id_ubigeo},new UbigeoRowMapper());
		} catch (Exception e) {
			ubigeo=new Ubigeo();
		}						
		return ubigeo;
	}



}
