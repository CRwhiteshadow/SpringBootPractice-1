package com.example.practice.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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
	
	@Query("select cd from CouponDetail cd join Coupon c on cd.coupon = c where cd.member=?1 and cd.use_status=?2 and (c.min_point<?3 or c.min_point=0)")
	public List<CouponDetail> findByMemberAndUseStatus(Member member,int use_status,int productTotal);

	public Page<CouponDetail> findByCoupon(Pageable pageable,Coupon coupon);
}
