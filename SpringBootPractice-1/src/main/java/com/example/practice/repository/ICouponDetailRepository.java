package com.example.practice.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.practice.model.Coupon;
import com.example.practice.model.CouponDetail;
import com.example.practice.model.Member;

public interface ICouponDetailRepository extends JpaRepository<CouponDetail, Long> {
	
	public CouponDetail findByMemberAndCoupon(Member member, Coupon coupon);
	
	public List<CouponDetail> findByMember(Member member);
	
	public CouponDetail findByCode(String code);
	
	public List<CouponDetail> findByCoupon(Coupon coupon);
	
	@Query("select c from CouponDetail c where c.member=?1 and c.use_status=?2")
	public List<CouponDetail> findByMemberAndUseStatus(Member member,int use_status);

}
