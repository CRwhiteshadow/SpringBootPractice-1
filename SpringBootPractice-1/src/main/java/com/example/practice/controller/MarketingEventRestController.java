package com.example.practice.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.practice.model.MarketingEventBean;
import com.example.practice.model.MarketingEventProductListBean;
import com.example.practice.service.IMarketingEventService;

@RestController
@RequestMapping("/mevent/rest")
public class MarketingEventRestController {
	
	@Autowired
	private IMarketingEventService marketingEventService;
	
	@GetMapping(value="/find/{id}",produces=MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<MarketingEventBean> find(@PathVariable("id") Long id){
		try {
			return new ResponseEntity<MarketingEventBean>(marketingEventService.findById(id),HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<MarketingEventBean>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@GetMapping(value = "/findOnlineMevent",produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public List<MarketingEventBean> findOnlineMvent() {
		Timestamp time = Timestamp.valueOf(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		return marketingEventService.findByMeventstartdateBeforeAndMeventenddateAfterAndMeventonlineTrue(time);
	}
	
	@GetMapping(value = "/findOnlineMeventProduct/{id}",produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public List<MarketingEventProductListBean> findOnlineMeventProduct(@PathVariable("id") Integer pid) {
		Timestamp time = Timestamp.valueOf(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		return marketingEventService.findByMeventstartdateBeforeAndMeventenddateAfterAndMeventonlineTrueAndProductid(time, pid);
	}

}
