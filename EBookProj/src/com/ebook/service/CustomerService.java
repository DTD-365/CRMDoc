package com.ebook.service;

import com.ebook.model.Customer;

public interface CustomerService {

	Customer getCustomer(String name, String password);
	void updateCustomer(Customer customer);
	Customer getCustomer(String name);
	
}
