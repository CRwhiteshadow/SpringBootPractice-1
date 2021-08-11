package com.example.practice.service;

import java.util.List;

import com.example.practice.model.CartItem;
import com.example.practice.model.Member;

public interface ICartItemService {
	
	public List<CartItem> findByMember(Member member);
	public CartItem save(CartItem cartitme);

}
