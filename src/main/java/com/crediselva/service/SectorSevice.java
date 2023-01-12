package com.crediselva.service;

import java.util.List;

import com.crediselva.dto.Sector;

public interface SectorSevice {
	public List<Sector>getAll();
	public Sector getSectorForId(int id);
}
