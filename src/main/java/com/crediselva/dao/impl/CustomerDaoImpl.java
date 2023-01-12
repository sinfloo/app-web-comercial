
package com.crediselva.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import com.crediselva.controller.dto.CustomerResponse;
import com.crediselva.dao.CustomerDao;
import com.crediselva.dto.Customer;
import com.crediselva.utils.Utils;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Repository
public class CustomerDaoImpl implements CustomerDao {

	private static final Logger LOGGER = Logger.getLogger("CustomerDaoImpl.class");

	@Autowired
	private ObjectMapper mapper;

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private SimpleJdbcInsert jdbcInsert;

	@Override
	public CustomerResponse getObjectForDocument(String document) {
		SimpleJdbcCall call = new SimpleJdbcCall(jdbcTemplate).withProcedureName("SP_SEARCH_CUSTOMER");
		CustomerResponse customer = null;
		try {
			Map<String, String> map = new HashMap<>();
			map.put("c_code", document.substring(1, 6));
			map.put("c_document", document);
			SqlParameterSource parameterSource = new MapSqlParameterSource(map);
			Map<String, Object> mapCustomer = call.execute(parameterSource);
			String response = mapper.writeValueAsString(mapCustomer.get("#result-set-1"));
			if (response.length() > 2) {
				customer = mapper.readValue(response, new TypeReference<List<CustomerResponse>>() {
				}).get(0);
			}
		} catch (Exception e) {
			LOGGER.log(Level.SEVERE, "Error al Obtener Datos", e);
		}

		return customer;
	}

	@Override
	public List<CustomerResponse> getAll() {
		SimpleJdbcCall call = new SimpleJdbcCall(jdbcTemplate).withProcedureName("SP_SEARCH_CUSTOMER");
		List<CustomerResponse> customers = null;
		try {
			Map<String, String> map = new HashMap<>();
			map.put("c_code", null);
			map.put("c_document", null);
			SqlParameterSource parameterSource = new MapSqlParameterSource(map);
			Map<String, Object> mapCustomer = call.execute(parameterSource);
			customers = mapper.readValue(mapper.writeValueAsString(mapCustomer.get("#result-set-1")).toString(),
					new TypeReference<List<CustomerResponse>>() {
					});
		} catch (Exception e) {
			LOGGER.log(Level.SEVERE, "Error al Obtener Datos", e);
		}

		return customers;
	}

	@Override
	public int save(Customer customer) {
		if (customer.getId_customer() == 0) {
			final Map<String, Object> parameters = new HashMap<>();
			parameters.put("c_dni", customer.getTipdoc().equals("1") ? customer.getNumDoc() : 0);
			parameters.put("c_name", Utils.convertToUpperCase(customer.getName()));
			parameters.put("c_first_name", Utils.convertToUpperCase(customer.getFirstname()));
			parameters.put("c_last_name", Utils.convertToUpperCase(customer.getLastname()));
			parameters.put("d_date_birth", customer.getDateBirth());
			parameters.put("c_civil_status", customer.getCivilStatus());
			parameters.put("c_state", customer.getState());
			jdbcInsert = new SimpleJdbcInsert(jdbcTemplate).withTableName("m_person").usingGeneratedKeyColumns("n_id_person");
			int id_person = jdbcInsert.executeAndReturnKey(parameters).intValue();

			final Map<String, Object> paramsCustomer = new HashMap<>();
			paramsCustomer.put("c_tip_doc", customer.getTipdoc());
			paramsCustomer.put("c_num_doc", customer.getNumDoc());
			paramsCustomer.put("c_razon_social",Utils.convertToUpperCase(customer.getRazonSocial() != null ? customer.getRazonSocial() : "-"));
			paramsCustomer.put("c_address", customer.getAddress());
			paramsCustomer.put("c_refe_address", customer.getReferenceAddress());
			paramsCustomer.put("c_address_business", customer.getAddressBusiness());
			paramsCustomer.put("c_refe_address_bus", customer.getReferenceAddressBusiness());
			paramsCustomer.put("n_id_ubigeo", Integer.valueOf(customer.getUbigeo()));
			paramsCustomer.put("c_phone_main", customer.getPhoneMain());
			paramsCustomer.put("c_phone_second", customer.getPhoneSecond());
			paramsCustomer.put("c_email_main", customer.getEmailMain());
			paramsCustomer.put("c_email_second", customer.getEmailSecond());
			paramsCustomer.put("c_source_money", customer.getSourceMoney());
			paramsCustomer.put("c_market", customer.getMarket());
			paramsCustomer.put("n_id_sector", customer.getSector().getId_sector());
			paramsCustomer.put("n_id_person", id_person);
			paramsCustomer.put("c_state", customer.getState());
			jdbcInsert = new SimpleJdbcInsert(jdbcTemplate).withTableName("m_customer").usingGeneratedKeyColumns("n_id_customer");
			return jdbcInsert.executeAndReturnKey(paramsCustomer).intValue();
		} else {
			String sql="UPDATE m_person SET c_dni =?, c_name = ?, c_first_name = ?, c_last_name = ?, d_date_birth = ? WHERE c_dni = ?";
			jdbcTemplate.update(new PreparedStatementCreator() {				
				@Override
				public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
					PreparedStatement ps=con.prepareStatement(sql);
					ps.setString(1, customer.getNumDoc());
					ps.setString(2, Utils.convertToUpperCase(customer.getName()));
					ps.setString(3, Utils.convertToUpperCase(customer.getFirstname()));
					ps.setString(4, Utils.convertToUpperCase(customer.getLastname()));
					ps.setDate(5, customer.getDateBirth());
					ps.setString(6, customer.getNumDoc());
					return ps;
				}
			});
			String sqlCustomer="UPDATE m_customer SET c_razon_social = ?, c_address = ?, c_refe_address =  ?, c_address_business =  ?, c_refe_address_bus =  ?,n_id_ubigeo=?,\r\n"
					+ " c_phone_main = ?, c_phone_second = ?, c_email_main = ?, c_email_second = ?, c_source_money = ?, c_market = ?, n_id_sector = ?, d_audit_date = ?, c_state = ? \r\n"
					+ "WHERE n_id_customer = ?";
			jdbcTemplate.update(new PreparedStatementCreator() {				
				@Override
				public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
					PreparedStatement ps=con.prepareStatement(sqlCustomer);
					ps.setString(1, Utils.convertToUpperCase(customer.getRazonSocial() != null ? customer.getRazonSocial() : "-"));
					ps.setString(2, Utils.convertToUpperCase(customer.getAddress()));
					ps.setString(3, Utils.convertToUpperCase(customer.getReferenceAddress()));
					ps.setString(4, Utils.convertToUpperCase(customer.getAddressBusiness()));
					ps.setString(5, Utils.convertToUpperCase(customer.getReferenceAddressBusiness()));
					ps.setInt(6,Integer.valueOf(customer.getUbigeo()));
					ps.setString(7, customer.getPhoneMain());
					ps.setString(8, customer.getPhoneSecond());
					ps.setString(9, customer.getEmailMain());
					ps.setString(10, customer.getEmailSecond());
					ps.setString(11, customer.getSourceMoney());
					ps.setString(12, customer.getMarket());
					ps.setInt(13, customer.getSector().getId_sector());
					ps.setDate(14, new Date(new java.util.Date().getTime()));
					ps.setString(15, customer.getState());
					ps.setInt(16, customer.getId_customer());
					return ps;
				}
			});
			return 0;
		}

	}
	

}
