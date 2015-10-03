package com.ebook.service;

import java.util.List;

import com.ebook.model.Customer;
import com.ebook.model.Order;
import com.ebook.model.OrderDetail;

public interface OrdersService {

	public boolean saveOrder(Order order); // ���涩��

	public List<Order> getOrder(Customer customer); // �����û�ID��ѯ����

	public List<OrderDetail> getOrderDetail(Order order); // ���ݶ����Ų�ѯ������ϸ
}
