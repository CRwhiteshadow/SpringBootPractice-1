package com.example.practice.service;

import java.util.List;

import com.example.practice.model.CartItem;
import com.example.practice.model.CheckoutInfo;

public interface ICheckoutService {
	
	public CheckoutInfo prepareCheckout(List<CartItem> cartItems);

}
