
package com.crediselva.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Customer extends Person{
    private int id_customer;
    private String code;
    private String tipdoc;
    private String numDoc;
    private String razonSocial;
    private String address;
    private String referenceAddress;
    private String addressBusiness;
    private String referenceAddressBusiness;
    private String ubigeo;
    private String phoneMain;
    private String phoneSecond;
    private String emailMain;
    private String emailSecond;
    private String sourceMoney;
    private String market;
    private Sector sector;
    private String state;
}
