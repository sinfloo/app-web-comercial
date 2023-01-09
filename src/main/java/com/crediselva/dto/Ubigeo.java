package com.crediselva.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Ubigeo {
	private int n_id_ubigeo;
	private Departament departament;
	private Province province;
	private District district;
}
