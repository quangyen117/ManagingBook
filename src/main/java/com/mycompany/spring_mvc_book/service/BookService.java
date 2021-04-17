/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_book.service;

import com.mycompany.spring_mvc_book.entities.BookEntity;
import com.mycompany.spring_mvc_book.repository.BookRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author USER
 */
@Service
public class BookService {
    
    @Autowired
    private BookRepository bookRepository;
    
    public List<BookEntity> getBooks() {
        return (List<BookEntity>) bookRepository.findAll();
    }
    
    public void save(BookEntity bookEntity) {
        bookRepository.save(bookEntity);
    }
    
    public BookEntity findBookById(int id) {
        Optional<BookEntity> optional = bookRepository.findById(id);
        if (optional.isPresent()) {
            return optional.get();
        } else {
            return new BookEntity();
        }
    }
    
    public List<BookEntity> searchBook(String strSearch) {
        return (List<BookEntity>) bookRepository.findByNameContainingOrAuthorContaining(strSearch, strSearch);
//        return bookRepository.findByCategoryEntityNameContainingAndBookDetailEntityPriceLessThan(strSearch, 150000);
    }
    
    public boolean deleteBook(int id) {
        bookRepository.deleteById(id);
        return bookRepository.existsById(id);
    }
    
}
