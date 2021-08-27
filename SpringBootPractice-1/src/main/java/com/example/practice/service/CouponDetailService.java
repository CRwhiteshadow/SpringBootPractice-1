package com.example.practice.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.example.practice.model.Coupon;
import com.example.practice.model.CouponDetail;
import com.example.practice.model.Member;
import com.example.practice.repository.ICouponDetailRepository;

@Service
@Transactional
public class CouponDetailService implements ICouponDetailService{
	
	@Autowired private ICouponDetailRepository repo;

	@Override
	public List<CouponDetail> findAll() {
		return repo.findAll();
	}

	@Override
	public CouponDetail findById(Long id) {
		return repo.getById(id);
	}

	@Override
	public CouponDetail save(CouponDetail couponDetail) {
		return repo.save(couponDetail);
	}

	@Override
	public void delete(CouponDetail couponDetail) {
		repo.delete(couponDetail);
		
	}

	@Override
	public boolean isReceived(Member member, Coupon coupon) {
		CouponDetail couponDetail = repo.findByMemberAndCoupon(member, coupon);
		if(couponDetail==null) {
			return false;
		}else {
			return true;
		}
	}

	@Override
	public boolean checkCode(String code) {
		CouponDetail couponDetail = repo.findByCode(code);
		if(couponDetail==null) {
			return false;
		}else {
			return true;
		}
	}

	@Override
	public List<CouponDetail> findByCoupon(Coupon coupon) {
		return repo.findByCoupon(coupon);
	}

	@Override
	public List<CouponDetail> findByMemberAndUseStatus(Member member, int use_status,int productTotal) {
		return repo.findByMemberAndUseStatus(member, use_status,productTotal);
	}

	@Override
	public Page<CouponDetail> QueryAllPage(int pageNum, String sortField, String sortDir,Coupon coupon) {
		int pageSize = 5;
		Pageable pageable = PageRequest.of(pageNum - 1, pageSize,
				  sortDir.equals("asc") ? Sort.by(sortField).ascending()
                          : Sort.by(sortField).descending()
                          );//因為由0開始
		return repo.findByCoupon(pageable, coupon);
	}

}
