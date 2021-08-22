package com.example.practice.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.practice.model.Coupon;
import com.example.practice.model.CouponDetail;
import com.example.practice.model.Member;

public interface ICouponDetailRepository extends JpaRepository<CouponDetail, Long> {
	
	public CouponDetail findByMemberAndCoupon(Member member, Coupon coupon);
	
	public List<CouponDetail> findByMember(Member member);
	
	public CouponDetail findByCode(String code);

}
