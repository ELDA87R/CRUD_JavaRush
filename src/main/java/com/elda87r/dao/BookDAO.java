package com.elda87r.dao;

import com.elda87r.model.Book;

import java.util.List;


public interface BookDAO {
     void addBook (Book book);

     void updateBook(Book book);

     void deleteBook(int id);

     Book getBookById(int id);

     List<Book> listBooks(int rowsPerPage, int page, String criterion);

     long getBooksCount();
}
