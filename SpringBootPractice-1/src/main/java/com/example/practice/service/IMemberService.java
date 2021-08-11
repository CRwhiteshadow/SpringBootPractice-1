package com.example.practice.service;

import java.util.List;

import com.example.practice.model.Member;

public interface IMemberService {
	
	public List<Member> findAll();
	public Member findByMemberid(Integer id);
	public Member findByEmail(String email);

}
