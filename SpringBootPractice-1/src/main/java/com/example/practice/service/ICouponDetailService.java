package com.example.practice.service;

import java.util.List;

import com.example.practice.model.CouponDetail;

public interface ICouponDetailService {
	
	public List<CouponDetail> findAll();
	public CouponDetail findById(Long id);
	public CouponDetail save(CouponDetail couponDetail);
	public void delete(CouponDetail couponDetail);
	

}
