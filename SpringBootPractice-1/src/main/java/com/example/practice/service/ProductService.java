package com.example.practice.service;

import java.util.List;

import com.example.practice.model.Product;
import com.example.practice.repository.IProductRepository;

import org.springframework.beans.factory.annotation.Autowired;

public class ProductService implements IProductService{

    @Autowired
    private IProductRepository productRepository;

    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }
    
}
