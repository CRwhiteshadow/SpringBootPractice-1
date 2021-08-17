package com.example.practice.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.practice.model.CartItem;
import com.example.practice.model.Member;
import com.example.practice.model.Product;

@Repository("cartItemDAO")
@Transactional
public interface ICartItemRepository extends JpaRepository<CartItem, Integer> {
	
	public List<CartItem> findByMember(Member member);
	
	public CartItem findByMemberAndProduct(Member member,Product product);

	@Modifying
	@Query("UPDATE CartItem c SET c.quantity=?1 WHERE c.member=?2 AND c.product=?3")
	public void updateQuantity(int quantity,Member member,Product product);
	
	public void deleteByMemberAndProduct(Member member,Product product);
	
	public void deleteByMember(Member member);
	
	@Query("select count(*) from CartItem c where c.member=?1")
	public int countCartItems(Member member);
	
}
