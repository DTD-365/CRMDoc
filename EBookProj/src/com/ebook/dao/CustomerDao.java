package com.ebook.dao;

import com.ebook.model.Customer;

public interface CustomerDao {

	//可以不要
	//void createCustomer(Customer customer);
	void updateCustomer(Customer customer);
	Customer getCustomer(String name, String password);
	Customer getCustomer(String name);
}
