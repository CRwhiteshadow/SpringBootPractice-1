package com.example.practice.repository;

import javax.transaction.Transactional;

import com.example.practice.model.Product;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("productDAO")
@Transactional
public interface IProductRepository extends JpaRepository<Product,Integer>{
    
}
