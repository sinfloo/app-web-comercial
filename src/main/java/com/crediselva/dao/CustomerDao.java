package com.crediselva.dao;

import com.crediselva.dto.CustomerResponse;

public interface CustomerDao {
    public CustomerResponse getObjectForDocument(String document);
}
