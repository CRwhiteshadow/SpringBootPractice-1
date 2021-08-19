package com.example.practice.repository;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.practice.model.Order;




@Repository("OrderRepository")
@Transactional
public interface IOrderRepository extends JpaRepository<Order,Integer> {
	public Page<Order> findAll(Pageable pageable);
	
	@Query("select count(*) from Order where ecpayMerchantTradeNo like ?1%")
	public int countByEcpayMerchantTradeNoContaining(String ecpayMerchantTradeNo);
	
	public Order findByEcpayMerchantTradeNo(String ecpayMerchantTradeNo);

}