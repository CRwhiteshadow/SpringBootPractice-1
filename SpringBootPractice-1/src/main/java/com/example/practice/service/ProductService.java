package com.example.practice.service;

import java.util.List;

import javax.transaction.Transactional;

import com.example.practice.model.Product;
import com.example.practice.repository.IProductRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("productService")
@Transactional
public class ProductService implements IProductService{

    @Autowired
    private IProductRepository productRepository;

    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

	@Override
	public Product findById(Integer id) {
		return productRepository.getById(id);
	}
    
}
