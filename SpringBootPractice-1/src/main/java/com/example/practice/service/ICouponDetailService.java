package com.example.practice.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.example.practice.model.Coupon;
import com.example.practice.model.CouponDetail;
import com.example.practice.model.Member;

public interface ICouponDetailService {
	
	public List<CouponDetail> findAll();
	public CouponDetail findById(Long id);
	public CouponDetail save(CouponDetail couponDetail);
	public void delete(CouponDetail couponDetail);
	public boolean isReceived(Member member,Coupon coupon);
	public boolean checkCode(String code);
	public List<CouponDetail> findByCoupon(Coupon coupon);
	public List<CouponDetail> findByMemberAndUseStatus(Member member,int use_status,int productTotal);
	public Page<CouponDetail> QueryAllPage(int pageNum,String sortField, String sortDir,Coupon coupon);

}
