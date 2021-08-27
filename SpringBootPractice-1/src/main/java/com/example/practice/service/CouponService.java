package com.example.practice.service;

import java.sql.Timestamp;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.example.practice.model.Coupon;
import com.example.practice.repository.ICouponRepository;

@Service
@Transactional
public class CouponService implements ICouponService {
	
	@Autowired private ICouponRepository couponRepository;

	@Override
	public List<Coupon> findAll() {
		return couponRepository.findAll();
	}

	@Override
	public Coupon findById(Long id) {
		return couponRepository.getById(id);
	}

	@Override
	public Coupon save(Coupon coupon) {
		return couponRepository.save(coupon);
	}

	@Override
	public void delete(Coupon coupon) {
		couponRepository.delete(coupon);

	}

	@Override
	public void deleteAllById(List<Long> couponids) {
		couponRepository.deleteAllById(couponids);
		
	}

	@Override
	public List<Coupon> findByEnableTimeAfter(Timestamp timestamp) {
		return couponRepository.findByEnableTimeAfter(timestamp);
	}

	@Override
	public Page<Coupon> QueryAllPage(int pageNum, String sortField, String sortDir) {
		int pageSize = 5;
		Pageable pageable = PageRequest.of(pageNum - 1, pageSize,
				  sortDir.equals("asc") ? Sort.by(sortField).ascending()
                          : Sort.by(sortField).descending()
                          );//因為由0開始
		return couponRepository.findAll(pageable);
	}

}
