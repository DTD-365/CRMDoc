package com.ebook.service;

import java.util.List;

import com.ebook.model.Customer;
import com.ebook.model.Order;
import com.ebook.model.OrderDetail;

public interface OrdersService {

	public boolean saveOrder(Order order); // 保存订单

	public List<Order> getOrder(Customer customer); // 根据用户ID查询订单

	public List<OrderDetail> getOrderDetail(Order order); // 根据订单号查询订单明细
}
