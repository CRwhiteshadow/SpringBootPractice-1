package com.example.practice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.example.practice.model.MarketingEventListBean;

@Repository("marketingEventListDAO")
@Transactional
public interface IMarketingEventListRepository extends JpaRepository<MarketingEventListBean, Long>  {

}
