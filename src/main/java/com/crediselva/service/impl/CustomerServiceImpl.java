package com.crediselva.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crediselva.dao.CustomerDao;
import com.crediselva.dto.CustomerResponse;
import com.crediselva.service.CustomerService;

@Service
public class CustomerServiceImpl implements CustomerService{

	@Autowired
	private CustomerDao repository;
	

	@Override
	public CustomerResponse getObjectForDocument(String document) {
		return repository.getObjectForDocument(document);
	}

	

}
