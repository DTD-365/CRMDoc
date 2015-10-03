package com.ebook.dao.daoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ebook.dao.OrdersDao;
import com.ebook.model.Book;
import com.ebook.model.Customer;
import com.ebook.model.Order;
import com.ebook.model.OrderDetail;
import com.ebook.utils.DBUtil;

public class OrdersDaoImp implements OrdersDao {

	public List<Order> getOrder(Customer customer) {

		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		String sql = "select * from orders where customer_id = ? ";

		List<Order> result = new ArrayList<Order>();

		conn = DBUtil.getConnection();

		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, customer.getId());

			rs = pst.executeQuery();

			assembleOrder(rs, result);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(pst, conn, rs);
		}

		return result;
	}

	private void assembleOrder(ResultSet rs, List<Order> result) {

		try {

			while (rs.next()) {

				Order o = new Order();

				o.setId(rs.getInt(1));
				CustomerDaoImp customerDaoImp = new CustomerDaoImp();
				o.setCustomer(customerDaoImp.getCustomerById((rs.getInt(2))));

				o.setOrder_number(rs.getString(3));
				o.setTotal_price(rs.getDouble(4));
				o.setStatus(rs.getString(5));
				o.setCreated_at(rs.getTimestamp(6));

				o.setOrderDetailList(getOrderDetail(o));

				result.add(o);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public List<OrderDetail> getOrderDetail(Order order) {

		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		String sql = "select * from order_detail where order_id = ? ";

		List<OrderDetail> result = new ArrayList<OrderDetail>();

		conn = DBUtil.getConnection();

		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, order.getId());

			rs = pst.executeQuery();

			assembleOrderDetail(rs, result, order);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(pst, conn, rs);
		}

		return result;
	}

	private void assembleOrderDetail(ResultSet rs, List<OrderDetail> result,
			Order order) {

		try {

			while (rs.next()) {

				OrderDetail od = new OrderDetail();

				int orderId = rs.getInt(2);
				int bookId = rs.getInt(1);
				int quantity = rs.getInt(3);
				double unit_price = rs.getDouble(4);

				// 1
				BookDaoImp bookDaoImp = new BookDaoImp();
				Book book = bookDaoImp.getBook(bookId);
				od.setBook(book);
				
				// 2
				order.setId(orderId);
				od.setOrder(order);

				// 3
				od.setQuantity(quantity);

				// 4
				od.setUnit_price(unit_price);

				result.add(od);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public boolean saveOrder(Order order) {

		Connection conn = null;
		PreparedStatement pst = null;
		int count = 0;
		ResultSet rs_genkeys = null;
		String sql = "insert into orders (customer_id, order_number, total_price, status) values(?,?,?,?) ";

		List<OrderDetail> orderDetails = order.getOrderDetailList();
		conn = DBUtil.getConnection();

		try {
			pst = conn.prepareStatement(sql);

			//pst.setInt(1, pst.getGeneratedKeys().getInt(1));
			pst.setInt(1, order.getCustomer().getId());
			pst.setString(2, order.getOrder_number());
			pst.setDouble(3, order.getTotal_price());
			pst.setString(4, order.getStatus());

			// 1：插入主表
			count = pst.executeUpdate();

			rs_genkeys = pst.getGeneratedKeys();

			// order id which is auto-generated
			int autogen_order_id = 0;
			while (rs_genkeys.next()) {
				autogen_order_id = rs_genkeys.getInt(1);
				System.out.println("======autogen_order_id========="
						+ autogen_order_id);
			}

			if (orderDetails.size() > 0) {
				// 2：插入明细表
				order.setId(autogen_order_id);
				saveOrderDetail(order, orderDetails);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(pst, conn);
		}

		if (count > 0) {
			return false;
		} else {
			return false;
		}
	}

	private void saveOrderDetail(Order order,
			List<OrderDetail> orderDetails) {

		Connection conn = null;
		PreparedStatement pst = null;
		String sql = "insert into order_detail (order_id, book_id, quantity, unit_price) values(?,?,?,?) ";

		conn = DBUtil.getConnection();

		try {
			for (OrderDetail orderDetail : orderDetails) {

				pst = conn.prepareStatement(sql);

				pst.setInt(1, order.getId());
				pst.setInt(2, orderDetail.getBook().getId());
				pst.setInt(3, orderDetail.getQuantity());
				pst.setDouble(4, orderDetail.getUnit_price());
				
				pst.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(pst, conn);
		}
	}
	
	public static void main(String[] args){
		
		Order order = new Order();
		
		List<OrderDetail> orderDetailList = new ArrayList<OrderDetail>();
		
		Customer customer = new Customer();
		customer.setId(32);
		customer.setName("testName01");

		order.setCustomer(customer);
		order.setTotal_price(2222);
		order.setStatus("Y");
		order.setOrderDetailList(orderDetailList);
		
		for (int i = 0; i < 5; i++) {

			OrderDetail anOrderDetail = new OrderDetail();
			
			Book book = new Book();
			
			book.setAuthor("author1");
			book.setDescription("sun book Description1");
			book.setPrice(444.44);
			book.setId(1+i);

			anOrderDetail.setBook(book);
			anOrderDetail.setOrder(order);
			anOrderDetail.setQuantity(3333);
			anOrderDetail.setUnit_price(33.33);
			
			orderDetailList.add(anOrderDetail);
		}
		
		OrdersDaoImp odi = new OrdersDaoImp(); 
		odi.saveOrder(order);
		
	}
}
