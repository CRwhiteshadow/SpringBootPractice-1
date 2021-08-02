package com.example.practice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.practice.model.MarketingEventTypeBean;
import com.example.practice.repository.IMarketingEventTypeRepository;

@Service("marketingEventTyprService")
@Transactional
public class MarketingEventTypeService implements IMarketingEventTypeService {

	@Autowired @Qualifier("marketingEventTypeDAO")
	private IMarketingEventTypeRepository marketingEventTypeDAO;
	
	@Override
	public List<MarketingEventTypeBean> findAll() {
		return marketingEventTypeDAO.findAll();
	}

	@Override
	public MarketingEventTypeBean findById(Long meventtypeid) {
		return marketingEventTypeDAO.getById(meventtypeid);
	}

	@Override
	public MarketingEventTypeBean save(MarketingEventTypeBean bean) {
		return marketingEventTypeDAO.save(bean);
	}

	@Override
	public void delete(MarketingEventTypeBean bean) {
		marketingEventTypeDAO.delete(bean);

	}

	@Override
	public void deleteById(Long meventtypeid) {
		marketingEventTypeDAO.deleteById(meventtypeid);

	}

}
