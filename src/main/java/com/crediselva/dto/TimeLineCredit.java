package com.crediselva.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class TimeLineCredit {
	private int id_timeline;
	private Date date;
	private double cuota;
	private double residue;
	private Date date_payment;
	private String signature;
	private String state;
	
}
