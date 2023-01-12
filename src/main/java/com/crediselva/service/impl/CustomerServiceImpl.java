package com.crediselva.service.impl;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.crediselva.controller.dto.CustomerResponse;
import com.crediselva.dao.CustomerDao;
import com.crediselva.dto.Customer;
import com.crediselva.service.CustomerService;

@Service
public class CustomerServiceImpl implements CustomerService{

	@Autowired
	private CustomerDao repository;
	
	private List<CustomerResponse> customers=null;
	
	@Override
	public CustomerResponse getObjectForDocument(String document) {
		return repository.getObjectForDocument(document);
	}


	@Override
	public List<CustomerResponse> getAll() {
		customers=repository.getAll();
		return customers;
	}


	@Override
	public int save(Customer customer) {
		return repository.save(customer);
	}

	@Override
	public Page<CustomerResponse> findPaginated(Pageable pageable) {
        int pageSize = pageable.getPageSize();
        int currentPage = pageable.getPageNumber();
        int startItem = currentPage * pageSize;
        List<CustomerResponse> list;
        customers=getAll();
        if (customers.size() < startItem) {
            list = Collections.emptyList();
        } else {
            int toIndex = Math.min(startItem + pageSize, customers.size());
            list = customers.subList(startItem, toIndex);
        }

        Page<CustomerResponse> customerPage    = new PageImpl<CustomerResponse>(list, PageRequest.of(currentPage, pageSize), customers.size());

        return customerPage;
    }

}
