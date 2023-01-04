
package com.crediselva.dto;



import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public abstract class Person {
    private int id_person;
    private String dni;
    private String name;
    private String firstname;
    private String lastname;
    private Date dateBirth;
    private String civilStatus;

}
