package com.example.practice.service;

import java.util.List;

import com.example.practice.model.Coupon;

public interface ICouponService {
	
	public List<Coupon> findAll();
	public Coupon findById(Long id);
	public Coupon save(Coupon coupon);
	public void delete(Coupon coupon);
	public void deleteAllById(List<Long> couponids);
	
}
