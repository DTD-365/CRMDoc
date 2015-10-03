package com.ebook.dao.daoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ebook.dao.BookDao;
import com.ebook.model.Book;
import com.ebook.utils.DBUtil;

public class BookDaoImp implements BookDao {

	public Book getBook(Integer id) {

		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		String sql;
		Book book = new Book();

		sql = "select * from book where id = ? ";

		conn = DBUtil.getConnection();

		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);

			rs = pst.executeQuery();

			while(rs.next()){
				assembleBook(rs, book);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(pst, conn, rs);
		}

		return book;
	}

	public List<Book> queryBook(String keyword) {

		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		String sql;
		List<Book> booklist = new ArrayList<Book>();

		sql = "select * from book where title like '%"+keyword+"%' or author like '%"+keyword+"%' ";
		//sql = "select * from book where title like '%?%' or publisher like '%?%' ";
		//sql = "select * from book where title = ? and publisher = ? ";
		
		conn = DBUtil.getConnection();

		try {
			pst = conn.prepareStatement(sql);
			//pst.setString(1, keyword);
			//pst.setString(2, "上海出版社");

			rs = pst.executeQuery();

			assembleBooks(rs, booklist);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(pst, conn, rs);
		}

		return booklist;
	}

	private void assembleBook(ResultSet rs, Book book) throws SQLException {
		if (rs!=null) {
			book.setId(Integer.parseInt(rs.getString(1)));
			book.setTitle(rs.getString(2));
			book.setAuthor(rs.getString(3));
			book.setPublisher(rs.getString(4));
			book.setType(rs.getString(5));
			book.setDescription(rs.getString(6));
			book.setImage_url(rs.getString(7));
			book.setPrice(Double.parseDouble(rs.getString(8)));
		}
	}

	private void assembleBooks(ResultSet rs, List<Book> booklist)
			throws SQLException {
		while (rs.next()) {
			Book book = new Book();
			assembleBook(rs, book);
			booklist.add(book);
		}
	}

	public static void main(String[] args) {
		BookDaoImp imp = new BookDaoImp();
		Book book = new Book();

		int pageNum1 = (int)Math.floor(19/3);
		double pageNum2 = Math.ceil(19/3);
		int pageNum3 = (int)(19/3);
		
		book.setId(10);
		book.setTitle("11");
		book.setAuthor("12");
		book.setPublisher("13");
		book.setType("14");
		book.setDescription("15");
		book.setImage_url("16");
		book.setPrice(44.44);

		imp.getBook(3);
		
		imp.queryBook("java");
	}
}
