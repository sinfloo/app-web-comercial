package com.crediselva.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.crediselva.dto.Customer;
import com.crediselva.dto.District;
import com.crediselva.service.CustomerService;
import com.crediselva.service.UbigeoService;
import com.crediselva.utils.Constans;

@Controller
@RequestMapping(path = "/customer")
public class ControllerCustomer {
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private UbigeoService ubigeoService;
	
	@GetMapping("/")
	public String getCustomers(Model model) {
		model.addAttribute("customers",customerService.getAll());
		return "customer/read_customer";
	}	
	
	@GetMapping("/new")
	public String newCustomer(Model model) {
		model.addAttribute("customer",new Customer());
		model.addAttribute("departaments",ubigeoService.getDepartamentAll());
		model.addAttribute("provinces",ubigeoService.getProvinceForDepartament("01"));
		return "customer/edit_customer";
	}
	@GetMapping("/obtnerDistrito/{id}")
	public ResponseEntity<List<District>> obtnerDistrito(Model model,@PathVariable String id) {
		return ResponseEntity.ok(ubigeoService.getDistrictForProvince(id));
	}

	@PostMapping(value = "/save")
	public String addCustomer(@Validated Customer customer,Model model) {
		customer.setState(Constans.STATE_CUSTOMER_1);
		customerService.save(customer);
		return "redirect:/customer/";
	}
	
}
