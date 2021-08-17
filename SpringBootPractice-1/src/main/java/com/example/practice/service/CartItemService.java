package com.example.practice.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.practice.model.CartItem;
import com.example.practice.model.Member;
import com.example.practice.model.Product;
import com.example.practice.repository.ICartItemRepository;

@Service("cartItemService")
@Transactional
public class CartItemService implements ICartItemService {

	@Autowired private ICartItemRepository repo;
	
	@Override
	public List<CartItem> findByMember(Member member) {
		return repo.findByMember(member);
	}

	@Override
	public CartItem save(CartItem cartitem) {
		return repo.save(cartitem);
	}

	@Override
	public CartItem findByMemberAndProduct(Member member, Product product) {
		return repo.findByMemberAndProduct(member, product);
	}

	@Override
	public void updateQuantity(int quantity,Member member,Product product) {
		repo.updateQuantity(quantity, member, product);
		
	}

	@Override
	public void deleteByMemberAndProduct(Member member, Product product) {
		repo.deleteByMemberAndProduct(member, product);
		
	}

	@Override
	public int addProductToCart(int quantity,Member member,Product product) {
		int updateQuantity = quantity;
		CartItem cartItem = repo.findByMemberAndProduct(member, product);
		if(cartItem != null) {
			updateQuantity = cartItem.getQuantity()+quantity;
		}else {
			cartItem = new CartItem();
			cartItem.setMember(member);
			cartItem.setProduct(product);
		}
		cartItem.setQuantity(updateQuantity);
		
		repo.save(cartItem);
		
		return updateQuantity;
	}

	@Override
	public void deleteByMember(Member member) {
		repo.deleteByMember(member);		
	}
	
	@Override
	public int countCartItems(Member member) {
		return repo.countCartItems(member);
	}

}
