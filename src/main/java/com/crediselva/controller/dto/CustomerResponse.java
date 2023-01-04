package com.crediselva.controller.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class CustomerResponse {
	private int n_id_customer;
	private String c_tip_doc;
	private String c_num_doc;
	private String c_name;
	private String c_first_name;
	private String c_last_name;
	private String c_razon_social;
	
	@Override
	public String toString() {		
		return c_name+" "+c_first_name+" "+c_last_name;
	}
}
