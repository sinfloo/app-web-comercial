package com.crediselva.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.crediselva.controller.dto.CustomerResponse;
import com.crediselva.dto.Customer;

public interface CustomerService {
	public List<CustomerResponse> getAll();
    public CustomerResponse getObjectForDocument(String document);
    public int save(Customer customer);
    public Page<CustomerResponse> findPaginated(Pageable pageable);
}

