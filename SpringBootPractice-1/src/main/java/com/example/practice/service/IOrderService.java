package com.example.practice.service;

import java.util.List;
import java.util.NoSuchElementException;

import org.springframework.data.domain.Page;

import com.example.practice.model.CartItem;
import com.example.practice.model.CheckoutInfo;
import com.example.practice.model.Order;
import com.example.practice.model.PaymentMethod;

public interface IOrderService {
	
	public Order addNewOrder(Integer memberid,List<CartItem> cartItems,PaymentMethod paymentMethod
							,CheckoutInfo checkoutInfo,Long couponDetailId);
	public void listOrder();
	public Page<Order> orderQueryAllPage(int pageNum, String sortField, String sortDir);
	public Order get(Integer id ) throws NoSuchElementException;
	public int countByEcpayMerchantTradeNoContaining(String ecpayMerchantTradeNo);
	public Order save(Order order);
	public Order findByEcpayMerchantTradeNo(String ecpayMerchantTradeNo);
	
}
