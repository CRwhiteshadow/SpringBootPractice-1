package com.example.practice.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.practice.model.Coupon;
import com.example.practice.service.ICouponDetailService;
import com.example.practice.service.ICouponService;

@Controller
@RequestMapping("/bs/coupon")
public class CouponController {
	
	@Autowired private ICouponService couponService;
	@Autowired private ICouponDetailService couponDetailService;
	
	@GetMapping("")
	public String showForm(Model m) {
		List<Coupon> coupons = couponService.findAll();
		m.addAttribute("coupons", coupons);
		return "coupon/index";
	}
	
	@GetMapping("/Form")
	public String addForm() {
		return "coupon/Form";
	}
	
	@GetMapping("/edit/{id}")
	public String eddidForm(@PathVariable("id") Long id,Model m) {
		Coupon coupon = couponService.findById(id);
		m.addAttribute("coupon", coupon);
		return "coupon/Form";
	}
	
	@GetMapping(value="/rest/find/{id}",produces=MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Coupon> find(@PathVariable("id") Long id){
		try {
			return new ResponseEntity<Coupon>(couponService.findById(id),HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Coupon>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@PostMapping("/insert")
	public String addCoupon(HttpServletRequest request) {
		String name = request.getParameter("name").trim();
		int amount = Integer.parseInt(request.getParameter("amount").trim());
		int per_limit = Integer.parseInt(request.getParameter("per_limit").trim());
		int min_point = Integer.parseInt(request.getParameter("min_point").trim());
		int use_type = Integer.parseInt(request.getParameter("use_type").trim());
		Timestamp start_time = Timestamp.valueOf(request.getParameter("startdate")+" "+request.getParameter("starttime"));
		Timestamp end_time = Timestamp.valueOf(request.getParameter("enddate")+" "+request.getParameter("endtime"));
		Timestamp enable_time = Timestamp.valueOf(request.getParameter("enabledate")+" "+request.getParameter("enabletime"));
		Coupon coupon = new Coupon();
		coupon.setName(name);
		coupon.setAmount(amount);
		coupon.setPer_limit(per_limit);
		coupon.setMin_point(min_point);
		coupon.setUse_type(use_type);
		coupon.setStart_time(start_time);
		coupon.setEnd_time(end_time);
		coupon.setEnable_time(enable_time);
		coupon.setPublish_count(0);
		coupon.setReceive_count(0);
		coupon.setUse_count(0);
		couponService.save(coupon);
		return "redirect:/bs/coupon";
	}
	
	@PostMapping("/edit")
	public String editMEvent(@RequestParam("id") Long id,HttpServletRequest request) {
		Coupon coupon = couponService.findById(id);
		String name = request.getParameter("name").trim();
		int amount = Integer.parseInt(request.getParameter("amount").trim());
		int per_limit = Integer.parseInt(request.getParameter("per_limit").trim());
		int min_point = Integer.parseInt(request.getParameter("min_point").trim());
		int use_type = Integer.parseInt(request.getParameter("use_type").trim());
		Timestamp start_time = Timestamp.valueOf(request.getParameter("startdate")+" "+request.getParameter("starttime"));
		Timestamp end_time = Timestamp.valueOf(request.getParameter("enddate")+" "+request.getParameter("endtime"));
		Timestamp enable_time = Timestamp.valueOf(request.getParameter("enabledate")+" "+request.getParameter("enabletime"));
		coupon.setName(name);
		coupon.setAmount(amount);
		coupon.setPer_limit(per_limit);
		coupon.setMin_point(min_point);
		coupon.setUse_type(use_type);
		coupon.setStart_time(start_time);
		coupon.setEnd_time(end_time);
		coupon.setEnable_time(enable_time);
		couponService.save(coupon);
		return "redirect:/bs/coupon";
	}
	
	@PostMapping("/delete")
	public String deleteCoupon(@RequestParam("id") String id
			){
		String[] idlist=id.split(",");
		List<Long> couponids = new ArrayList<Long>();
		for(String str:idlist) {
			couponids.add(Long.parseLong(str));
		}
		couponService.deleteAllById(couponids);
		return "redirect:/bs/coupon";
	}

}
