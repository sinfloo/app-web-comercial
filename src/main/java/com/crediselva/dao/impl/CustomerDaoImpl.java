
package com.crediselva.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.crediselva.dao.CustomerDao;
import com.crediselva.dto.CustomerResponse;

@Repository
public class CustomerDaoImpl implements CustomerDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;


	@Override
	public CustomerResponse getObjectForDocument(String document) {
		CustomerResponse customer=null;
        String sql="SELECT c.n_id_customer,c.c_tip_doc,c.c_num_doc,p.c_name,p.c_first_name,p.c_last_name,c.c_razon_social FROM m_customer c INNER JOIN m_person p ON c.n_id_person=p.n_id_person where c.c_num_doc=?";
        customer =jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(CustomerResponse.class),new Object[] {document});
        return customer;
	}

}
