package com.example.practice.service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.practice.model.MarketingEventBean;
import com.example.practice.model.MarketingEventProductListBean;
import com.example.practice.model.Product;
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
	public MarketingEventBean findById(Long meventid) {
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
	public void deleteById(Long meventid) {
		marketingEventDAO.deleteById(meventid);
		
	}

	@Override
	public long countByTitleContaining(String meventtitle) {
		return marketingEventDAO.countByTitleContaining(meventtitle);
	}

	@Override
	public void deleteAllById(List<Long> meventids) {
		marketingEventDAO.deleteAllById(meventids);
		
	}

	@Override
	public List<MarketingEventBean> findByMeventstartdateBeforeAndMeventenddateAfterAndMeventonlineTrue(Timestamp time) {
		return marketingEventDAO.findByMeventstartdateBeforeAndMeventenddateAfterAndMeventonlineTrue(time);
	}

	@Override
	public List<MarketingEventProductListBean> findByMeventstartdateBeforeAndMeventenddateAfterAndMeventonlineTrueAndProductid(
			Timestamp time, Integer productid) {
		return marketingEventDAO.findByMeventstartdateBeforeAndMeventenddateAfterAndMeventonlineTrueAndProductid(time, productid);
	}

	@Override
	public Map<Integer, Integer> productdcp(List<Product> products) {
		Map<Integer , Integer> dcpMap = new HashMap<Integer, Integer>(); 
		for (int i=0;i<products.size();i++) {
			Timestamp time = Timestamp.valueOf(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			List<MarketingEventProductListBean> mepls = findByMeventstartdateBeforeAndMeventenddateAfterAndMeventonlineTrueAndProductid(time, products.get(i).getProductid());
			for (int j=0;j<mepls.size();j++) {
				TreeSet<Integer> dcp = new TreeSet<Integer>();
				if(mepls.get(j).getMeventproductdiscountprice()!=0) {
					dcp.add(mepls.get(j).getMeventproductdiscountprice());
				}
			if(dcp.size()!=0) {
				dcpMap.put(products.get(i).getProductid(), dcp.first());
			}
			}
		}
		return dcpMap;
	}

	@Override
	public MarketingEventBean findByMeventtile(String meventtitle) {
		return marketingEventDAO.findByMeventtile(meventtitle);
	}
	
	

}
