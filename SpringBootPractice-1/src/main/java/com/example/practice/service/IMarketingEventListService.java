package com.example.practice.service;

import java.util.List;

import com.example.practice.model.MarketingEventListBean;

public interface IMarketingEventListService {

	public List<MarketingEventListBean> findAll();
	public MarketingEventListBean findById(Long meventlistid);
	public MarketingEventListBean save(MarketingEventListBean marketingEventListBean);
	public void delete(MarketingEventListBean marketingEventListBean);
	public void deleteById(Long meventlistid);
	
}
