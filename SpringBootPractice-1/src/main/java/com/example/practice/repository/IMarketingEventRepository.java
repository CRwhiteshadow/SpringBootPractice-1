package com.example.practice.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.example.practice.model.MarketingEventBean;

@Repository("marketingEventDAO")
@Transactional
public interface IMarketingEventRepository extends JpaRepository<MarketingEventBean, Integer> {
	@Query("select m from MarketingEventBean m where m.meventname like %?1%")
	public List<MarketingEventBean> findByMeventnameContaining(String meventname);
	
	@Query("select count(*) from MarketingEventBean where meventtitle like ?1%")
	public long countByTitleContaining(String meventtitle);



}
