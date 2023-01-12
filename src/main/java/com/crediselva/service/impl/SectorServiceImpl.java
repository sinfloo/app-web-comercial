package com.crediselva.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crediselva.dao.SectorDao;
import com.crediselva.dto.Sector;
import com.crediselva.service.SectorSevice;

@Service
public class SectorServiceImpl implements SectorSevice{

	
	@Autowired
	private SectorDao repository;
	
	@Override
	public List<Sector> getAll() {
		// TODO Auto-generated method stub
		return repository.getAll();
	}

	@Override
	public Sector getSectorForId(int id) {
		return repository.getSectorForId(id);
	}

}
