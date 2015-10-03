package com.ebook.model;

import java.util.ArrayList;
import java.util.List;

public class Cart {

	private List<OrderDetail> orderDetails = new ArrayList<OrderDetail>();

	//add goods to cart
	public void addOrderDetail(OrderDetail orderDetail){
		
		int bookId = orderDetail.getBook().getId();
		OrderDetail findedOrderDetail = findOrderDetailInChart(bookId);
		if (findedOrderDetail != null) {
			findedOrderDetail.addQuantity();
		} else {
			orderDetails.add(orderDetail);
		}
	}
	
	//update quantity
	public void updateQuantity(int bookId, int quantity){
		OrderDetail findedOrderDetail = findOrderDetailInChart(bookId);
		findedOrderDetail.setQuantity(quantity);
	}
	
	//calculate tatal price
	public double calculateTotalPrice(){
		double totalPrice = 0;
		for(OrderDetail orderDetail :orderDetails){
			totalPrice += orderDetail.getUnit_price();
		}
		return totalPrice;
	}
	
	private OrderDetail findOrderDetailInChart(int bookId) {
		for(OrderDetail orderDetail :orderDetails){
			if (orderDetail.getBook().getId() == bookId) {
				return orderDetail;	
			}
		}
		return null;
	}

	//delete goods
	public void deleteOrderDetail(int bookId){

		OrderDetail findedOrderDetail = findOrderDetailInChart(bookId);
		if (findedOrderDetail != null) {
			orderDetails.remove(findedOrderDetail);
		}
	}

	//total recorder in cart
	public int totalOrderDetailSize(){
		return orderDetails.size();
	}

	//clear cart
	public void clearCart(){
		orderDetails.clear();
	}
	
	public List<OrderDetail> getOrderDetails() {
		return orderDetails;
	}


	public void setOrderDetails(List<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}
}
