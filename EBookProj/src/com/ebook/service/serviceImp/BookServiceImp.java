package com.ebook.service.serviceImp;

import java.util.List;

import com.ebook.dao.BookDao;
import com.ebook.dao.daoImp.BookDaoImp;
import com.ebook.model.Book;
import com.ebook.service.BookService;

public class BookServiceImp implements BookService{

	BookDao bookDao = new BookDaoImp();
	
	public Book getBook(Integer id) {
		return bookDao.getBook(id);
	}

	public List<Book> queryBook(String keyword) {
		return bookDao.queryBook(keyword);
	}
}
