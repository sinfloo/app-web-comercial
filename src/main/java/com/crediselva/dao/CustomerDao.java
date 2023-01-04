package com.crediselva.dao;

import java.util.List;

import com.crediselva.controller.dto.CustomerResponse;
import com.crediselva.dto.Customer;

public interface CustomerDao {
	public List<CustomerResponse> getAll();
    public CustomerResponse getObjectForDocument(String document);
    public int save(Customer customer);
}
