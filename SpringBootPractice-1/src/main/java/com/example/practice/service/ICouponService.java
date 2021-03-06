package com.example.practice.service;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.data.domain.Page;

import com.example.practice.model.Coupon;

public interface ICouponService {
	
	public List<Coupon> findAll();
	public Coupon findById(Long id);
	public Coupon save(Coupon coupon);
	public void delete(Coupon coupon);
	public void deleteAllById(List<Long> couponids);
	public List<Coupon> findByEnableTimeAfter(Timestamp timestamp);
	public Page<Coupon> QueryAllPage(int pageNum,String sortField, String sortDir);
	
}
