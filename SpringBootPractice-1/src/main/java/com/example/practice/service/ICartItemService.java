package com.example.practice.service;

import java.util.List;

import com.example.practice.model.CartItem;
import com.example.practice.model.Member;
import com.example.practice.model.Product;

public interface ICartItemService {
	
	public List<CartItem> findByMember(Member member);
	public CartItem save(CartItem cartitem);
	public CartItem findByMemberAndProduct(Member member,Product product);
	public void updateQuantity(int quantity,Member member,Product product);
	public void deleteByMemberAndProduct(Member member,Product product);
	public int addProductToCart(int quantity,Member member,Product product);
}
