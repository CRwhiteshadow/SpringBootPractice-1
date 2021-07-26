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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.practice.model.MarketingEventBean;
import com.example.practice.service.IMarketingEventService;



@Controller
@RequestMapping(value="/mevent")
public class MarketingEventController {
	private static final int EMPNO=1012;
	
	@Autowired
	private IMarketingEventService marketingEventService;
	
	@GetMapping("")
	public String showForm(Model m) {
		List<MarketingEventBean> mevents = marketingEventService.findAll();
		m.addAttribute("mevents", mevents);
		return "mevent/index";
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
		int typeid =Integer.parseInt(request.getParameter("typeid"));
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
        return "redirect:/mevent";
	}
	
	@PostMapping("/edit")
	public String editMEvent(@RequestParam("id") Integer id
			,@RequestParam("title") String title
			,@RequestParam("pic") MultipartFile pic 
			,@RequestParam("typeid") Integer typeid
			,@RequestParam("online") boolean online
			,@RequestParam("ownerid") Integer ownerid
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
        marketingEventService.save(mevent);
		return "redirect:/mevent";
	}

	@PostMapping("/delete")
	public String deleteMEvent(@RequestParam("id") String id
			){
		String[] idlist=id.split(",");
		List<Integer> meventids = new ArrayList<Integer>();
		for(String str:idlist) {
			meventids.add(Integer.parseInt(str));
		}
		marketingEventService.deleteAllById(meventids);
		return "redirect:/mevent";
	}
}
