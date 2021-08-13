package com.example.practice.model;

import java.util.Calendar;
import java.util.Date;

public class CheckoutInfo {
	private int productCost;
	private int productTotal;
	private int shippingCostTotal;
	private int paymentTotal;
	private int deliverDays;
	private Date deliverDate;
	
	public int getProductCost() {
		return productCost;
	}
	public void setProductCost(int productCost) {
		this.productCost = productCost;
	}
	public int getProductTotal() {
		return productTotal;
	}
	public void setProductTotal(int productTotal) {
		this.productTotal = productTotal;
	}
	public int getShippingCostTotal() {
		return shippingCostTotal;
	}
	public void setShippingCostTotal(int shippingCostTotal) {
		this.shippingCostTotal = shippingCostTotal;
	}
	public int getPaymentTotal() {
		return paymentTotal;
	}
	public void setPaymentTotal(int paymentTotal) {
		this.paymentTotal = paymentTotal;
	}
	public int getDeliverDays() {
		return deliverDays;
	}
	public void setDeliverDays(int deliverDays) {
		this.deliverDays = deliverDays;
	}
	public Date getDeliverDate() {
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.DATE, deliverDays);
		return calendar.getTime();
	}


}
