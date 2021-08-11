package com.example.practice.service;

import java.util.List;

import com.example.practice.model.Product;

public interface IProductService {
    public List<Product> findAll();
    public Product findById(Integer id);
}
