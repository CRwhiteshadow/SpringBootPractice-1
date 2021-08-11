package com.example.practice.repository;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.example.practice.model.MarketingEventBean;
import com.example.practice.model.MarketingEventProductListBean;

@Repository("marketingEventDAO")
@Transactional
public interface IMarketingEventRepository extends JpaRepository<MarketingEventBean, Long> {
	@Query("select m from MarketingEventBean m where m.meventname like %?1%")
	public List<MarketingEventBean> findByMeventnameContaining(String meventname);
	
	@Query("select count(*) from MarketingEventBean where meventtitle like ?1%")
	public long countByTitleContaining(String meventtitle);

	@Query("select m from MarketingEventBean m where m.meventstartdate <?1 and m.meventenddate >?1 and m.meventonline=true")
	public List<MarketingEventBean> findByMeventstartdateBeforeAndMeventenddateAndMeventonlineTrue(Timestamp time);
	
	@Query("select mepl from MarketingEventProductListBean mepl join MarketingEventListBean mel on mepl.meventlistid = mel.meventlistid join MarketingEventBean me on mel.meventid = me.meventid where me.meventstartdate <?1 and me.meventenddate >?1 and me.meventonline=true and mepl.productid=?2")
	public List<MarketingEventProductListBean> findByMeventstartdateBeforeAndMeventenddateAndMeventonlineTrueAndProductid(Timestamp time,Integer productid);

}
