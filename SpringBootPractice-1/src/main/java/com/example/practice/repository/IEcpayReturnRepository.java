package com.example.practice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.practice.model.EcpayReturn;

@Repository
public interface IEcpayReturnRepository extends JpaRepository<EcpayReturn, Integer> {

}
