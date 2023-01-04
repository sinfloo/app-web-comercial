package com.crediselva.service;

import java.util.List;

import com.crediselva.dto.Departament;
import com.crediselva.dto.District;
import com.crediselva.dto.Province;

public interface UbigeoService {
	public List<Departament>getDepartamentAll();
	public List<Province>getProvinceForDepartament(String id_departament);
	public List<District>getDistrictForProvince(String id_province);
}
