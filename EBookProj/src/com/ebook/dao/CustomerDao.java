package com.ebook.dao;

import com.ebook.model.Customer;

public interface CustomerDao {

	//���Բ�Ҫ
	//void createCustomer(Customer customer);
	void updateCustomer(Customer customer);
	Customer getCustomer(String name, String password);
	Customer getCustomer(String name);
}
