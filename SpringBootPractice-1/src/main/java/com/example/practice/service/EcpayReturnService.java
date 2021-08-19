package com.example.practice.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.practice.model.EcpayReturn;
import com.example.practice.repository.IEcpayReturnRepository;

@Service
@Transactional
public class EcpayReturnService implements IEcpayReturnService {

	@Autowired private IEcpayReturnRepository repo;
	
	@Override
	public EcpayReturn save(EcpayReturn ecpayReturn) {
		return repo.save(ecpayReturn);
	}

}
