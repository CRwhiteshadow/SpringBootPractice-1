package com.example.practice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.practice.model.Coupon;

@Repository
public interface ICouponRepository extends JpaRepository<Coupon,Long> {

}
