package com.example.practice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.practice.model.MarketingEventListBean;
import com.example.practice.repository.IMarketingEventListRepository;

@Service("marketingEventListService")
@Transactional
public class MarketingEventListService implements IMarketingEventListService {

	@Autowired @Qualifier("marketingEventListDAO")
	private IMarketingEventListRepository marketingEventListDAO;
	
	@Override
	public List<MarketingEventListBean> findAll() {
		return marketingEventListDAO.findAll();
	}

	@Override
	public MarketingEventListBean findById(Long meventlistid) {
		return marketingEventListDAO.getById(meventlistid);
	}

	@Override
	public MarketingEventListBean save(MarketingEventListBean marketingEventListBean) {
		return marketingEventListDAO.save(marketingEventListBean);
	}

	@Override
	public void delete(MarketingEventListBean marketingEventListBean) {
		marketingEventListDAO.delete(marketingEventListBean);

	}

	@Override
	public void deleteById(Long meventlistid) {
		marketingEventListDAO.deleteById(meventlistid);

	}

}
