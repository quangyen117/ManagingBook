/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_book.utils;

import com.mycompany.spring_mvc_book.entities.BookEntity;
import com.mycompany.spring_mvc_book.model.Book;
import com.mycompany.spring_mvc_book.model.BookDetail;
import com.mycompany.spring_mvc_book.model.Category;

/**
 *
 * @author USER
 */
public class ConvertUtils {
    
    public static Book convertBookEntityToBook(BookEntity bookEntity) {
        Book book = new Book();
        book.setId(bookEntity.getId());
        book.setName(bookEntity.getName());
        book.setAuthor(bookEntity.getAuthor());
        
        BookDetail bookDetail = new BookDetail();
        bookDetail.setDescription(bookEntity.getBookDetailEntity().getDescription());
        bookDetail.setId(bookEntity.getBookDetailEntity().getId());
        bookDetail.setIsbn(bookEntity.getBookDetailEntity().getIsbn());
        bookDetail.setNumberOfPage(bookEntity.getBookDetailEntity().getNumberOfPage());
        bookDetail.setPrice(bookEntity.getBookDetailEntity().getPrice());
        bookDetail.setPublishDate(bookEntity.getBookDetailEntity().getPublishDate());
        
        Category category = new Category();
        category.setId(bookEntity.getCategoryEntity().getId());
        category.setName(bookEntity.getCategoryEntity().getName());
        category.setDescription(bookEntity.getCategoryEntity().getDescription());
        
        book.setBookDetail(bookDetail);
        book.setCategory(category);
        
        return book;
    }
}
