package com.crediselva.dao;

import java.util.List;

import com.crediselva.dto.Sector;

public interface SectorDao {
	public List<Sector>getAll();
	public Sector getSectorForId(int id);
}
