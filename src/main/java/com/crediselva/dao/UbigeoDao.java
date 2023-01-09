package com.crediselva.dao;

import java.util.List;

import com.crediselva.dto.Departament;
import com.crediselva.dto.District;
import com.crediselva.dto.Province;
import com.crediselva.dto.Ubigeo;

public interface UbigeoDao {
	public Ubigeo getUbigeo(String id_ubigeo);
	public List<Departament>getDepartamentAll();
	public List<Province>getProvinceForDepartament(String id_departament);
	public List<District>getDistrictForProvince(String id_province);
}
