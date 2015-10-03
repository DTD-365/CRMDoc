package com.ebook.dao.daoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ebook.dao.CustomerDao;
import com.ebook.model.Customer;
import com.ebook.utils.DBUtil;

public class CustomerDaoImp implements CustomerDao {

	public Customer getCustomer(String name, String password) {

		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		String sql;
		Customer customer = new Customer();
		
		sql = "select * from customer where name = ? and password = ? ";

		conn = DBUtil.getConnection();

		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, name);
			pst.setString(2, password);
			
			rs = pst.executeQuery();
			
			assembleCustomer(rs, customer);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(pst, conn, rs);
		}
		
		return customer;
	}

	public Customer getCustomer(String name) {

		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		String sql;
		Customer customer = new Customer();
		
		sql = "select * from customer where name = ? ";

		conn = DBUtil.getConnection();

		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, name);
			
			System.out.println("+++name++"+ name);
			System.out.println("+++Sql++"+ sql);
			rs = pst.executeQuery();
			
			System.out.println("+++++"+ rs);
			
			assembleCustomer(rs, customer);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(pst, conn, rs);
		}
		
		return customer;
	}
	
	public Customer getCustomerById(int id) {

		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		String sql;
		Customer customer = new Customer();
		
		sql = "select * from customer where id = ? ";

		conn = DBUtil.getConnection();

		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			
			rs = pst.executeQuery();
			
			System.out.println("+++++"+ rs);
			
			assembleCustomer(rs, customer);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(pst, conn, rs);
		}
		
		return customer;
	}

	private void assembleCustomer(ResultSet rs, Customer customer)
			throws SQLException {
		while(rs.next()) {
			
			System.out.println("++assembleCustomer+++"+ rs.getString(1));
			customer.setId(Integer.parseInt(rs.getString(1)));
			customer.setName(rs.getString(2));
			customer.setPassword(rs.getString(3));
			customer.setSex(rs.getString(4));
			customer.setEmail(rs.getString(5));
			customer.setPhone(rs.getString(6));
			customer.setAddress(rs.getString(7));
			customer.setQuestion(rs.getString(8));
			customer.setAnswer(rs.getString(9));
		}
	}

	// register and update user information
	public void updateCustomer(Customer customer) {
		
		System.out.println("-------customer.getName()-------"+ customer.getName());
		
		Connection conn = null;
		PreparedStatement pst = null;
		String sql;

		if (customer.getId() == null) {
			sql = "insert into customer (name, password, sex, phone, email, address, question, answer) values(?,?,?,?,?,?,?,?)";
		} else {
			sql = "update customer set name=?, password=?, sex=?, phone=?, email=?, address=?, question=?, answer=? where id =? ";
		}

		conn = DBUtil.getConnection();

		try {

			pst = conn.prepareStatement(sql);

			pst.setString(1, customer.getName());
			pst.setString(2, customer.getPassword());
			pst.setString(3, customer.getSex());
			pst.setString(4, customer.getPhone());
			pst.setString(5, customer.getEmail());
			pst.setString(6, customer.getAddress());
			pst.setString(7, customer.getQuestion());
			pst.setString(8, customer.getAnswer());

			if (customer.getId() != null) {
				pst.setInt(9, customer.getId());
			}
			pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(pst, conn);
		}
	}

	public static void main(String[] args) {
		CustomerDaoImp imp = new CustomerDaoImp();
		Customer customer = new Customer();

		customer.setName("1");
		customer.setPassword("2");
		customer.setSex("3");
		customer.setPhone("4");
		customer.setEmail("5");
		customer.setAddress("6");
		customer.setQuestion("7");
		customer.setAnswer("8");

		imp.updateCustomer(customer);

	}
}
