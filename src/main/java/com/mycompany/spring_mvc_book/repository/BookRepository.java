/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_book.repository;

import com.mycompany.spring_mvc_book.entities.BookEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author USER
 */
@Repository
public interface BookRepository extends CrudRepository<BookEntity, Integer>{
    
    List<BookEntity> findByNameContainingOrAuthorContaining(String name, String author);
    
    List<BookEntity> findByAuthorContainingOrderByAuthorDesc(String strSearch);
    
    @Query("Select b from BookEntity b where " + 
           "b.categoryEntity.name like %?1% and " + 
           "b.bookDetailEntity.price < ?2 " + 
           "order by b.name desc" )
    List<BookEntity> findBookByCategoryAndPrice(String name, double price);
    
    @Query(value = "select * " 
            + "from book b join book_detail bd on b.book_detail_id = bd.id " 
            + "join category c on c.id = b.category_id " 
            + "where c.name like ?1 and bd.price ?2;", nativeQuery = true)
    List<BookEntity> findBookByCategoryAndPriceNative(String name, double price);
    
    List<BookEntity> findByCategoryEntityNameContainingAndBookDetailEntityPriceLessThan(String name, double price);
}
