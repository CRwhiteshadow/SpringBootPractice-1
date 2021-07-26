package com.example.practice.service;

import java.util.List;

import com.example.practice.model.MarketingEventBean;

public interface IMarketingEventService {
	
	public List<MarketingEventBean> findAll();
	public List<MarketingEventBean> findByMeventnameContaining(String meventname);
	public MarketingEventBean findById(Integer meventid);
	public MarketingEventBean save(MarketingEventBean bean);
	public void delete(MarketingEventBean bean);
	public void deleteById(Integer meventid);
	public void deleteAllById(List<Integer> meventids);
	public long countByTitleContaining(String meventtitle);

}
