package com.example.practice.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.practice.model.CartItem;
import com.example.practice.model.CheckoutInfo;
import com.example.practice.model.Product;

@Service
public class CheckoutService implements ICheckoutService {

	@Autowired private IMarketingEventService meventService;
	private static final int SHIPPINGCOSTPERORDER = 100; //每張訂單運費
	private static final int SHIPPINGCOSTPERITEM =30; //每一項商品的運費
	private static final int DELIVERDAYS = 3; //貨運時間算3天
	
	@Override
	public CheckoutInfo prepareCheckout(List<CartItem> cartItems) {
		CheckoutInfo checkoutInfo = new CheckoutInfo();
		
		List<Product> products = new ArrayList<Product>();
		int productCost = 0; 
		for(int i=0;i<cartItems.size();i++) {
			products.add(cartItems.get(i).getProduct());
			productCost = productCost + 
					cartItems.get(i).getProduct().getProductcost() *
					cartItems.get(i).getQuantity();
		}
		checkoutInfo.setProductCost(productCost);
		
		Map<Integer,Integer> productdcps =meventService.productdcp(products);
		int productTotal = 0;
		for(int i=0;i<cartItems.size();i++) {
			if(productdcps.containsKey(cartItems.get(i).getProduct().getProductid())) {
				productTotal = productTotal + 
						productdcps.get(cartItems.get(i).getProduct().getProductid()) *
						cartItems.get(i).getQuantity();
			}else {
				productTotal = productTotal +
						cartItems.get(i).getProduct().getProductprice() *
						cartItems.get(i).getQuantity();
			}
		}
		checkoutInfo.setProductTotal(productTotal);
		
		int shippingCostTotal = SHIPPINGCOSTPERORDER + SHIPPINGCOSTPERITEM * cartItems.size();
		checkoutInfo.setShippingCostTotal(shippingCostTotal);
		
		int paymentTotal = productTotal + shippingCostTotal;
		checkoutInfo.setPaymentTotal(paymentTotal);
		
		checkoutInfo.setDeliverDays(DELIVERDAYS);
		
		return checkoutInfo;
	}

}
