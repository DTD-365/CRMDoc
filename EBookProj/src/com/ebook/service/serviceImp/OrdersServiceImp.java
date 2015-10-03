package com.ebook.service.serviceImp;

import java.util.List;

import com.ebook.dao.OrdersDao;
import com.ebook.dao.daoImp.OrdersDaoImp;
import com.ebook.model.Customer;
import com.ebook.model.Order;
import com.ebook.model.OrderDetail;
import com.ebook.service.OrdersService;

public class OrdersServiceImp implements OrdersService{

	OrdersDao ordersDao = new OrdersDaoImp();
	
	public List<Order> getOrder(Customer customer) {
		return ordersDao.getOrder(customer);
	}

	public List<OrderDetail> getOrderDetail(Order order) {
		return ordersDao.getOrderDetail(order);
	}

	public boolean saveOrder(Order order) {
		return ordersDao.saveOrder(order);
	}
}
