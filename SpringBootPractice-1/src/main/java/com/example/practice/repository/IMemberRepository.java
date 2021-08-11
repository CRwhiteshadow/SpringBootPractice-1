package com.example.practice.repository;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.practice.model.Member;

@Repository("memberDAO")
@Transactional
public interface IMemberRepository extends JpaRepository<Member, Integer> {
	
	public Member findByEmail(String email);

}
