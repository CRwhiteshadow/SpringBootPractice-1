package com.example.practice.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.practice.model.CartItem;
import com.example.practice.model.Member;

@Repository("cartItemDAO")
@Transactional
public interface ICartItemRepository extends JpaRepository<CartItem, Integer> {
	
	public List<CartItem> findByMember(Member member);

}
