package com.example.practice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.example.practice.model.MarketingEventTypeBean;

@Repository("marketingEventTypeDAO")
@Transactional
public interface IMarketingEventTypeRepository extends JpaRepository<MarketingEventTypeBean, Long> {

}
