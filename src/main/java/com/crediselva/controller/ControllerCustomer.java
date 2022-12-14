package com.crediselva.controller;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.crediselva.controller.dto.CustomerResponse;
import com.crediselva.dto.Customer;
import com.crediselva.dto.District;
import com.crediselva.dto.Province;
import com.crediselva.dto.Sector;
import com.crediselva.dto.Ubigeo;
import com.crediselva.service.CustomerService;
import com.crediselva.service.SectorSevice;
import com.crediselva.service.UbigeoService;
import com.crediselva.utils.Utils;

@Controller
@RequestMapping(path = "/customer")
public class ControllerCustomer {
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private UbigeoService ubigeoService;
	
	@Autowired
	private SectorSevice sectorService;
	
	@GetMapping("/")
	public String getCustomers(Model model,@RequestParam("page") Optional<Integer> page, @RequestParam("size") Optional<Integer> size) {
		int currentPage = page.orElse(1);
        int pageSize = size.orElse(5);
        Page<CustomerResponse> customerPage = customerService.findPaginated(PageRequest.of(currentPage - 1, pageSize));
        model.addAttribute("customers", customerPage);
        model.addAttribute("currentPage", currentPage);        
        int totalPages = customerPage.getTotalPages();       
        if (totalPages > 0) {
            List<Integer> pageNumbers = IntStream.rangeClosed(1, totalPages)
                .boxed()
                .collect(Collectors.toList());
            model.addAttribute("pageNumbers", pageNumbers);
        }
        model.addAttribute("totalPages",totalPages);
		return "customer/read_customer";
	}	
	
	@GetMapping("/new")
	public String newCustomer(Model model) {
		model.addAttribute("customer",new Customer());
		model.addAttribute("ubigeo",ubigeoService.getUbigeo("12"));
		model.addAttribute("flag_ubigeo","0");
		model.addAttribute("departaments",ubigeoService.getDepartamentAll());
		model.addAttribute("sectors",sectorService.getAll());
		return "customer/edit_customer";
	}
	@GetMapping("/getDistrict/{id}")
	public ResponseEntity<List<District>> getDistrict(Model model,@PathVariable String id) {
		return ResponseEntity.ok(ubigeoService.getDistrictForProvince(id));
	}
	@GetMapping("/getProvince/{id}")
	public ResponseEntity<List<Province>> getProvince(Model model,@PathVariable String id) {
		return ResponseEntity.ok(ubigeoService.getProvinceForDepartament(id));
	}

	@PostMapping(value = "/save")
	public String addCustomer(@Validated Customer customer,Model model) {
		customerService.save(customer);
		return "redirect:/customer/";
	}
	@GetMapping(value = "/edit/{id_document}")
	public String editCustomer(@PathVariable String id_document,Model model) {
		CustomerResponse customerResponse=customerService.getObjectForDocument(id_document);
		Customer customer=new Customer();
		customer.setId_customer(customerResponse.getN_id_customer());
		customer.setName(customerResponse.getC_name());
		customer.setFirstname(customerResponse.getC_first_name());
		customer.setLastname(customerResponse.getC_last_name());
		customer.setDateBirth(customerResponse.getD_date_birth());
		customer.setCivilStatus(customerResponse.getC_civil_status());
		customer.setId_customer(customerResponse.getN_id_customer());
		customer.setTipdoc(customerResponse.getC_tip_doc());
		customer.setNumDoc(customerResponse.getC_num_doc());
		customer.setAddress(customerResponse.getC_address());
		customer.setReferenceAddress(customerResponse.getC_refe_address());
		customer.setAddressBusiness(customerResponse.getC_address_business());
		customer.setReferenceAddressBusiness(customerResponse.getC_refe_address_bus());
		customer.setUbigeo(customerResponse.getN_id_ubigeo());
		customer.setPhoneMain(customerResponse.getC_phone_main());
		customer.setPhoneSecond(customerResponse.getC_phone_second());
		customer.setEmailMain(customerResponse.getC_email_main());
		customer.setEmailSecond(customerResponse.getC_email_second());
		customer.setSourceMoney(customerResponse.getC_source_money());
		customer.setMarket(customerResponse.getC_market());
		customer.setSector(new Sector(customerResponse.getN_id_sector(),null,null));
		customer.setState(customerResponse.getC_state());
		model.addAttribute("customer",customer);
		Ubigeo ubigeo=ubigeoService.getUbigeo(customerResponse.getN_id_ubigeo());
		model.addAttribute("flag_ubigeo","1");
		model.addAttribute("customer",customer);
		model.addAttribute("ubigeo",ubigeo);
		model.addAttribute("departaments",ubigeoService.getDepartamentAll());
		model.addAttribute("sectors",sectorService.getAll());
		return "customer/edit_customer";
	}
	@GetMapping(value = "/view/{id_document}")
	public String viewCustomerDetails(@PathVariable String id_document,Model model) {
		CustomerResponse customerResponse=customerService.getObjectForDocument(id_document);
		Customer customer=new Customer();
		customer.setId_customer(customerResponse.getN_id_customer());
		customer.setName(customerResponse.getC_name());
		customer.setFirstname(customerResponse.getC_first_name());
		customer.setLastname(customerResponse.getC_last_name());
		customer.setDateBirth(customerResponse.getD_date_birth());
		customer.setCivilStatus(Utils.civilStatusName(customerResponse.getC_civil_status()));
		customer.setId_customer(customerResponse.getN_id_customer());
		customer.setTipdoc(customerResponse.getC_tip_doc());
		customer.setNumDoc(customerResponse.getC_num_doc());
		customer.setAddress(customerResponse.getC_address());
		customer.setReferenceAddress(customerResponse.getC_refe_address());
		customer.setAddressBusiness(customerResponse.getC_address_business());
		customer.setReferenceAddressBusiness(customerResponse.getC_refe_address_bus());		
		customer.setPhoneMain(customerResponse.getC_phone_main());
		customer.setPhoneSecond(customerResponse.getC_phone_second());
		customer.setEmailMain(customerResponse.getC_email_main());
		customer.setEmailSecond(customerResponse.getC_email_second());
		customer.setSourceMoney(customerResponse.getC_source_money());
		customer.setMarket(customerResponse.getC_market());
		customer.setSector(sectorService.getSectorForId(customerResponse.getN_id_sector()));
		customer.setState(Utils.stateCustomer(customerResponse.getC_state()));
		Ubigeo ubigeo=ubigeoService.getUbigeo(customerResponse.getN_id_ubigeo());
		model.addAttribute("customer",customer);
		model.addAttribute("ubigeo",ubigeo);
		return "customer/view_customer";
	}
	
}
