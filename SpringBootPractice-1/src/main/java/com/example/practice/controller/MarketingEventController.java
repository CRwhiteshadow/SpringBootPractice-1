package com.example.practice.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.practice.model.MarketingEventBean;
import com.example.practice.model.MarketingEventListBean;
import com.example.practice.model.MarketingEventProductListBean;
import com.example.practice.service.IMarketingEventListService;
import com.example.practice.service.IMarketingEventService;



@Controller
@RequestMapping(value="/mevent")
public class MarketingEventController {
	private static final int EMPNO=1012;
	
	@Autowired
	private IMarketingEventService marketingEventService;
	
	@Autowired
	private IMarketingEventListService marketingEventListService;
	
	@GetMapping("")
	public String showForm(Model m) {
		List<MarketingEventBean> mevents = marketingEventService.findAll();
		m.addAttribute("mevents", mevents);
		return "mevent/index_MPA";
	}
	
	@GetMapping("/MEventForm_MPA")
	public String addForm() {
		return "mevent/MEventForm_MPA";
	}
	
	@GetMapping("/edit/{id}")
	public String eddidForm(@PathVariable("id") Long id,Model m) {
		MarketingEventBean mevent = marketingEventService.findById(id);
		m.addAttribute("mevent", mevent);
		for(int i=0;i<mevent.getMarketingEventListBean().size();i++) {
			MarketingEventListBean mlbean = marketingEventListService.findById(mevent.getMarketingEventListBean().get(i).getMeventlistid());
			m.addAttribute("mlbean"+i, mlbean);
		}
		return "mevent/MEventForm_MPA";
	}
	
	@PostMapping("/insert")
	public String insertMEvent(@RequestParam("pic") MultipartFile pic,HttpServletRequest request, Model m) {
		String title = new SimpleDateFormat("yyyyMMdd").format(new Date()) + "ME";
		long num = marketingEventService.countByTitleContaining(title);
		title = title + (num + 1);
		Timestamp startdate = Timestamp.valueOf(request.getParameter("startdate")+" "+request.getParameter("starttime"));
		Timestamp enddate = Timestamp.valueOf(request.getParameter("enddate")+" "+request.getParameter("endtime"));
		String name = request.getParameter("name").trim();
		String description = request.getParameter("description").trim();
		long typeid =Long.parseLong(request.getParameter("typeid"));
		int ownerid = EMPNO;
		boolean online = Boolean.valueOf(request.getParameter("online"));
        MarketingEventBean mevent = new MarketingEventBean();
        mevent.setMeventtitle(title);
        if(pic.isEmpty()) {mevent.setMeventpicture(null);}else {try {
			mevent.setMeventpicture(pic.getBytes());
		} catch (IOException e) {
			e.printStackTrace();
		}}
        if(pic.isEmpty()) {mevent.setMeventpicturename(null);}else {
			mevent.setMeventpicturename(pic.getOriginalFilename());
		}
        mevent.setMeventstartdate(startdate);
        mevent.setMeventenddate(enddate);
        mevent.setMeventname(name);
        mevent.setMeventdescription(description);
        mevent.setMeventtypeid(typeid);
        mevent.setMeventownerid(ownerid);
        mevent.setMeventonline(online);	
        marketingEventService.save(mevent);
        MarketingEventListBean mEventListBean = new MarketingEventListBean();
        mEventListBean.setMeventid(mevent.getMeventid());
        mEventListBean.setMeventlisttypeid(Long.parseLong("1"));
        List<MarketingEventListBean> mEventListBeans = new ArrayList<MarketingEventListBean>();
        mEventListBeans.add(mEventListBean);
        mevent.setMarketingEventListBean(mEventListBeans);
        marketingEventService.save(mevent);
        mEventListBean = marketingEventListService.findById(mevent.getMarketingEventListBean().get(0).getMeventlistid());
        List<MarketingEventProductListBean> mEventPListBeans = new ArrayList<MarketingEventProductListBean>();
        for(int i=1;i<=8;i++) {
			if(request.getParameter("product_"+i)!=null) {
		        MarketingEventProductListBean mEventPListBean = new MarketingEventProductListBean();
				mEventPListBean.setMeventlistid(mEventListBean.getMeventlistid());
				mEventPListBean.setProductid(Integer.parseInt(request.getParameter("product_"+i).trim()));
				if(!request.getParameter("productdcp_"+i).isEmpty()){
					mEventPListBean.setMeventproductdiscountprice(Integer.parseInt(request.getParameter("productdcp_"+i).trim()));
				}	
				mEventPListBeans.add(mEventPListBean);       
			}
		}
        mEventListBean.setMarketingEventProductListBean(mEventPListBeans);
        marketingEventListService.save(mEventListBean);
        return "redirect:/mevent";
	}
	
	@PostMapping("/edit")
	public String editMEvent(@RequestParam("id") Long id
			,@RequestParam("title") String title
			,@RequestParam("pic") MultipartFile pic 
			,@RequestParam("typeid") Long typeid
			,@RequestParam("online") boolean online
			,@RequestParam("ownerid") Integer ownerid
			,@RequestParam("meventlistid") Long meventlistid
			,HttpServletRequest request, Model m) {
		Timestamp startdate = Timestamp.valueOf(request.getParameter("startdate")+" "+request.getParameter("starttime"));
		Timestamp enddate = Timestamp.valueOf(request.getParameter("enddate")+" "+request.getParameter("endtime"));
		String name = request.getParameter("name").trim();
		String description = request.getParameter("description").trim();
		MarketingEventBean mevent = new MarketingEventBean();
        mevent.setMeventid(id);
        mevent.setMeventtitle(title);
        if(pic.isEmpty()) {
        	if(marketingEventService.findById(id).getMeventpicture()==null) {mevent.setMeventpicture(null);
        	}else{mevent.setMeventpicture(marketingEventService.findById(id).getMeventpicture());}
        }else {try {
			mevent.setMeventpicture(pic.getBytes());
		} catch (IOException e) {
			e.printStackTrace();
		}}
        if(pic.isEmpty()) {
        	if(marketingEventService.findById(id).getMeventpicturename()==null) {mevent.setMeventpicturename(null);
        	}else{mevent.setMeventpicturename(marketingEventService.findById(id).getMeventpicturename());}
        }else {
			mevent.setMeventpicturename(pic.getOriginalFilename());
		}
        mevent.setMeventstartdate(startdate);
        mevent.setMeventenddate(enddate);
        mevent.setMeventname(name);
        mevent.setMeventdescription(description);
        mevent.setMeventtypeid(typeid);
        mevent.setMeventownerid(ownerid);
        mevent.setMeventonline(online);
        List<MarketingEventListBean> mEventListBeans = marketingEventService.findById(id).getMarketingEventListBean();
        MarketingEventListBean mEventListBean = marketingEventListService.findById(meventlistid);
        List<MarketingEventProductListBean> mEventPListBeans = mEventListBean.getMarketingEventProductListBean();
        for(int i=0;i<mEventPListBeans.size();i++) {
        	MarketingEventProductListBean mEventPListBean = mEventPListBeans.get(i);
        	mEventPListBean.setProductid(Integer.parseInt(request.getParameter("product_"+(i+1)).trim()));
			if(!request.getParameter("productdcp_"+(i+1)).isEmpty()){
				mEventPListBean.setMeventproductdiscountprice(Integer.parseInt(request.getParameter("productdcp_"+(i+1)).trim()));
			}	
        	mEventPListBeans.set(i, mEventPListBean);
        }
        mEventListBean.setMarketingEventProductListBean(mEventPListBeans);
        mEventListBeans.set(0, mEventListBean);
        mevent.setMarketingEventListBean(mEventListBeans);
        marketingEventService.save(mevent);
		return "redirect:/mevent";
	}

	@PostMapping("/delete")
	public String deleteMEvent(@RequestParam("id") String id
			){
		System.out.println(id);
		String[] idlist=id.split(",");
		List<Long> meventids = new ArrayList<Long>();
		for(String str:idlist) {
			meventids.add(Long.parseLong(str));
		}
		marketingEventService.deleteAllById(meventids);
		return "redirect:/mevent";
	}
	
	@GetMapping("/edm/{id}")
	public String showEdm(@PathVariable("id") Long id,Model m) {
		MarketingEventBean mevent = marketingEventService.findById(id);
		m.addAttribute("mevent", mevent);
		return "mevent/edm";
	}
}
