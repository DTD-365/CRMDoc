package com.ebook.model;

public class OrderDetail {

	private Book book;
	private Order order;
	private int quantity;
	private double unit_price;

	public OrderDetail() {
	}
	
	// ��������������Դ���һ������
	public OrderDetail(Book book, int quantity) {
		this.book = book;
		this.quantity = quantity;
	}

	// ����һ������
	public OrderDetail(Book book, Order order, int quantity, double unit_price) {
		this.book = book;
		this.order = order;
		this.quantity = quantity;
		this.unit_price = unit_price;
	}	
	
	// һ�������ļ۸����鱾��ĵ��۳�һ�����ж���������
	public void calculateUnitPrice() {
		unit_price = (book.getPrice()*0.5) * quantity;
	}

	public void addQuantity(){
		quantity++;
		calculateUnitPrice();
	}
	
	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getUnit_price() {
		calculateUnitPrice();
		return unit_price;
	}

	public void setUnit_price(double unit_price) {
		this.unit_price = unit_price;
	}

}
