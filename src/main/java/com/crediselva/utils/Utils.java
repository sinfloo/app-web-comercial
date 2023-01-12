package com.crediselva.utils;

public class Utils {
	public static String convertToUpperCase(String value) {
		return	value.toUpperCase();
	}
	public static String civilStatusName(String value) {
		switch (value) {
		case "1":
			value="SOLTERO";
			break;
		case "2":
			value="CASADO";
			break;
		case "3":
			value="DIVORCIADO";
			break;
		case "4":
			value="CONVIVIENTE";
			break;
		default:
			value="SOLTERO";
			break;
		}
		return value;
	}
	public static String stateCustomer(String value) {
		switch (value) {
		case "1":
			value="NUEVO";
			break;
		case "2":
			value="CLIENTE";
			break;
		case "3":
			value="EX-CLIENTE";
			break;
		case "4":
			value="SUSPENDIDO";
			break;
		}
		return value;
	}
}
