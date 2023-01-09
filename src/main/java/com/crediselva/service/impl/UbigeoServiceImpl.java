package com.crediselva.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crediselva.dao.UbigeoDao;
import com.crediselva.dto.Departament;
import com.crediselva.dto.District;
import com.crediselva.dto.Province;
import com.crediselva.dto.Ubigeo;
import com.crediselva.service.UbigeoService;

@Service
public class UbigeoServiceImpl implements UbigeoService{
	
	@Autowired
	private UbigeoDao repository;

	@Override
	public List<Departament> getDepartamentAll() {
		return repository.getDepartamentAll();
	}

	@Override
	public List<Province> getProvinceForDepartament(String id_departament) {
		return repository.getProvinceForDepartament(id_departament);
	}

	@Override
	public List<District> getDistrictForProvince(String id_province) {
		return repository.getDistrictForProvince(id_province);
	}

	@Override
	public Ubigeo getUbigeo(String id_ubigeo) {
		// TODO Auto-generated method stub
		return repository.getUbigeo(id_ubigeo);
	}

}
