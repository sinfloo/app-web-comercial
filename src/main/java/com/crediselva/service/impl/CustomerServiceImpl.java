package com.crediselva.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crediselva.controller.dto.CustomerResponse;
import com.crediselva.dao.CustomerDao;
import com.crediselva.dto.Customer;
import com.crediselva.service.CustomerService;

@Service
public class CustomerServiceImpl implements CustomerService{

	@Autowired
	private CustomerDao repository;
	

	@Override
	public CustomerResponse getObjectForDocument(String document) {
		return repository.getObjectForDocument(document);
	}


	@Override
	public List<CustomerResponse> getAll() {
		return repository.getAll();
	}


	@Override
	public int save(Customer customer) {
		return repository.save(customer);
	}

	

}
