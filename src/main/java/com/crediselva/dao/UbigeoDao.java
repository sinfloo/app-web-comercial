package com.crediselva.dao;

import java.util.List;

import com.crediselva.dto.Departament;
import com.crediselva.dto.District;
import com.crediselva.dto.Province;

public interface UbigeoDao {
	public List<Departament>getDepartamentAll();
	public List<Province>getProvinceForDepartament(String id_departament);
	public List<District>getDistrictForProvince(String id_province);
}
