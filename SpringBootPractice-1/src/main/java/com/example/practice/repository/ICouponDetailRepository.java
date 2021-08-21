package com.example.practice.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.practice.model.CouponDetail;

public interface ICouponDetailRepository extends JpaRepository<CouponDetail, Long> {

}
