package com.ebook.dao;

import java.util.List;

import com.ebook.model.Book;

public interface BookDao {

	Book getBook(Integer id);






	List<Book> queryBook(String keyword);

}
