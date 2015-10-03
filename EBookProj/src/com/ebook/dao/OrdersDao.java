package com.ebook.dao;

import java.util.List;

import com.ebook.model.Customer;
import com.ebook.model.Order;
import com.ebook.model.OrderDetail;

public interface OrdersDao {

	boolean saveOrder(Order order);
	
	List<Order> getOrder(Customer customer);
	
	List<OrderDetail> getOrderDetail(Order order);
}
