package com.example.practice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.practice.model.MarketingEventBean;
import com.example.practice.repository.IMarketingEventRepository;

@Service("marketingEventService")
@Transactional
public class MarketingEventService implements IMarketingEventService {

	@Autowired @Qualifier("marketingEventDAO")
	private IMarketingEventRepository marketingEventDAO;

	@Override
	public List<MarketingEventBean> findAll() {
		return marketingEventDAO.findAll();
	}

	@Override
	public List<MarketingEventBean> findByMeventnameContaining(String meventname) {
		return marketingEventDAO.findByMeventnameContaining(meventname);
	}

	@Override
	public MarketingEventBean findById(Integer meventid) {
		return marketingEventDAO.getById(meventid);
	}

	@Override
	public MarketingEventBean save(MarketingEventBean bean) {
		return marketingEventDAO.save(bean);
	}

	@Override
	public void delete(MarketingEventBean bean) {
		marketingEventDAO.delete(bean);
		
	}

	@Override
	public void deleteById(Integer meventid) {
		marketingEventDAO.deleteById(meventid);
		
	}

	@Override
	public long countByTitleContaining(String meventtitle) {
		return marketingEventDAO.countByTitleContaining(meventtitle);
	}

	@Override
	public void deleteAllById(List<Integer> meventids) {
		marketingEventDAO.deleteAllById(meventids);
		
	}
	
	

}
