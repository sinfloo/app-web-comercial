package com.crediselva.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.crediselva.dto.CustomerResponse;
import com.crediselva.service.CustomerService;

@Controller
public class ControllerCredits {
	
	@Autowired
	private CustomerService customerServicce;

	@GetMapping("/")
	public String showCredits(Model model) {
		return "credits";
	}
	
	@PostMapping(path = "/credits/obtain", produces = MediaType.APPLICATION_JSON_VALUE)
	public String getCreditsForDocument(@RequestParam String document, Model model) {
		CustomerResponse customerResponse=customerServicce.getObjectForDocument(document);
		model.addAttribute("customer",customerResponse);
		return "credits";
	}
}
