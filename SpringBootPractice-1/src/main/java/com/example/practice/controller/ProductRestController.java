package com.example.practice.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.practice.model.Product;
import com.example.practice.repository.IProductRepository;

@RestController
@RequestMapping("/product/rest")
public class ProductRestController {
    
    @Autowired
    private IProductRepository productRepository;

    @GetMapping(value = "/findAll",produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public  List<Product> findAll(){   
        return productRepository.findAll();        
    }

    @GetMapping(value = "/findById/{id}",produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public Product findById(@PathVariable("id") Integer id) {
    	return productRepository.getById(id);
    }
    
    @GetMapping(value = "/findProductId",produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public List<Integer> findAllId(){
        List<Product> pds = productRepository.findAll();
        List<Integer> pids = new ArrayList<Integer>();
        for(int i=0;i<pds.size();i++){
           Integer pid = pds.get(i).getProductid();
           pids.add(pid);
        }
        return pids;
    }
}
