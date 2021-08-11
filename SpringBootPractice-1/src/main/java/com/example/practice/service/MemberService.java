package com.example.practice.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.practice.model.Member;
import com.example.practice.repository.IMemberRepository;

@Service("memberService")
@Transactional
public class MemberService implements IMemberService {

	@Autowired private IMemberRepository repo;
	
	@Override
	public List<Member> findAll() {
		return repo.findAll();
	}

	@Override
	public Member findByMemberid(Integer id) {
		return repo.getById(id);
	}

	@Override
	public Member findByEmail(String email) {
		return repo.findByEmail(email);
	}

}
