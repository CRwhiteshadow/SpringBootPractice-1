package com.example.practice.service;

import java.sql.Timestamp;
import java.util.List;

import com.example.practice.model.MarketingEventBean;
import com.example.practice.model.MarketingEventProductListBean;

public interface IMarketingEventService {
	
	public List<MarketingEventBean> findAll();
	public List<MarketingEventBean> findByMeventnameContaining(String meventname);
	public List<MarketingEventBean> findByMeventstartdateBeforeAndMeventenddateAfterAndMeventonlineTrue(Timestamp time);
	public MarketingEventBean findById(Long meventid);
	public MarketingEventBean save(MarketingEventBean bean);
	public void delete(MarketingEventBean bean);
	public void deleteById(Long meventid);
	public void deleteAllById(List<Long> meventids);
	public long countByTitleContaining(String meventtitle);
	public List<MarketingEventProductListBean> findByMeventstartdateBeforeAndMeventenddateAfterAndMeventonlineTrueAndProductid(Timestamp time,Integer productid);

}
