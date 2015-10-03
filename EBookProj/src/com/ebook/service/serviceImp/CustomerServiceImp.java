package com.ebook.service.serviceImp;

import com.ebook.dao.CustomerDao;
import com.ebook.dao.daoImp.CustomerDaoImp;
import com.ebook.model.Customer;
import com.ebook.service.CustomerService;

public class CustomerServiceImp implements CustomerService{

	CustomerDao customerDao = new CustomerDaoImp();
	
	public Customer getCustomer(String name) {
		return customerDao.getCustomer(name);
	}

	public Customer getCustomer(String name, String password) {
		return customerDao.getCustomer(name,password);
	}
	
	public void updateCustomer(Customer customer) {
		customerDao.updateCustomer(customer);
	}

}
