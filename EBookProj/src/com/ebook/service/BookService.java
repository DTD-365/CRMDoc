package com.ebook.service;

import java.util.List;

import com.ebook.model.Book;

public interface BookService {

	Book getBook(Integer id);

	List<Book> queryBook(String keyword);

}
