package com.example.practice.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.practice.model.CouponDetail;
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

}
