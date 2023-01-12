package com.crediselva.controller.dto;

import java.sql.Date;

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
	private Date d_date_birth;
	private String c_civil_status;
	private String c_razon_social;
	private String c_address;
	private String c_refe_address;
	private String c_address_business;
	private String c_refe_address_bus;
	private String n_id_ubigeo;
	private String c_phone_main;
	private String c_phone_second;
	private String c_email_main;
	private String c_email_second;
	private String c_source_money;
	private String c_market;
	private int n_id_sector;
	private String c_state;
	
	@Override
	public String toString() {		
		return c_name+" "+c_first_name+" "+c_last_name;
	}
}
