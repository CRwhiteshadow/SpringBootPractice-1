package com.example.practice.repository;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.practice.model.Coupon;

@Repository
public interface ICouponRepository extends JpaRepository<Coupon,Long> {
	
	@Query("select c from Coupon c where c.enable_time>?1")
	public List<Coupon> findByEnableTimeAfter(Timestamp timestamp);

}
