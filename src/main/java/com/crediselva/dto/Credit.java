package com.crediselva.dto;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Credit {
	private int id_credit;
	private double amount;
	private String period;
	private int term;
	private double couta;
	private int cant_cuotas;
	private double interest;
	private Date create_date;
	private Date audit_date;
	private List<TimeLineCredit>time_lines;
	private String state;

}
