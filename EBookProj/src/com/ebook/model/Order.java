package com.ebook.model;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Order {

	private int id = 0;
	private Customer customer = new Customer();
	private String order_number = createOrderNumber();
	private double total_price = 0;
	private String status = "";
	private Timestamp created_at;
	private List<OrderDetail> orderDetailList = new ArrayList<OrderDetail>();
	
	public String createOrderNumber(){
		
		Date currentDate = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String orderNumber = sdf.format(currentDate);
		
		return orderNumber;
	}
	
	public List<OrderDetail> getOrderDetailList() {
		return orderDetailList;
	}

	public void setOrderDetailList(List<OrderDetail> orderDetailList) {
		for(OrderDetail orderDetail : orderDetailList) {
			orderDetail.setOrder(this);
		}
		this.orderDetailList = orderDetailList;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	
	public String getOrder_number() {
		return order_number;
	}

	public void setOrder_number(String order_number) {
		this.order_number = order_number;
	}

	public double getTotal_price() {
		return total_price;
	}

	public void setTotal_price(double total_price) {
		this.total_price = total_price;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Timestamp getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Timestamp created_at) {
		this.created_at = created_at;
	}
	
	public static void main(String[] args){
		
		Order o = new Order();
		
		System.out.println("+++++++" + o.order_number);
	}
}
