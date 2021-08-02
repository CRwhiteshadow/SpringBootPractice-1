package com.example.practice.service;

import java.util.List;


import com.example.practice.model.MarketingEventTypeBean;



public interface IMarketingEventTypeService {
	
	public List<MarketingEventTypeBean> findAll();
	public MarketingEventTypeBean findById(Long meventtypeid);
	public MarketingEventTypeBean save(MarketingEventTypeBean bean);
	public void delete(MarketingEventTypeBean bean);
	public void deleteById(Long meventtypeid);

}
