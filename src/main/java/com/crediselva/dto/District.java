package com.crediselva.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class District {
	private String n_id_ubigeo;
	private String c_provincia_inei;
	private String c_distrito;
}
