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

	@Override
	public Member save(Member member) {
		return repo.save(member);
	}

	@Override
	public boolean havePostAddress(Member member) {
		String postalcode = member.getPostalcode();
		String city = member.getCity();
		String region = member.getRegion();
		String address = member.getAddress();
		String postname = member.getPostname();
		String postmobile = member.getPostmobile();
		if(postalcode!=null && city!=null && region!=null && address!=null && postname!=null && postmobile!=null) {
			return true;
		}else {
			return false;
		}
		
	}

	@Override
	public String getPostAddress(Member member) {
		String postalcode = member.getPostalcode();
		String city = member.getCity();
		String region = member.getRegion();
		String address = member.getAddress();
		String postAddress = postalcode + city + region + address;
		return postAddress;
	}

	
	
}
