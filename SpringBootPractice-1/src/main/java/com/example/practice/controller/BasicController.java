package com.example.practice.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.practice.model.MarketingEventBean;
import com.example.practice.model.Member;
import com.example.practice.model.Product;
import com.example.practice.service.ICartItemService;
import com.example.practice.service.IMarketingEventService;
import com.example.practice.service.IMemberService;
import com.example.practice.service.IProductService;

@Controller
public class BasicController {
	
	@Autowired private IMarketingEventService marketingEventService;
	@Autowired private IMemberService memberService;
	@Autowired private IProductService productService;
	@Autowired private ICartItemService cartItemService;
	
	@GetMapping("/")
	public String showIndex(Model m) {
		Timestamp time = Timestamp.valueOf(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		List<MarketingEventBean> mevents = marketingEventService.findByMeventstartdateBeforeAndMeventenddateAfterAndMeventonlineTrue(time);
		m.addAttribute("mevents", mevents);
		return "index";
	}
	

	
	@GetMapping("/logout")
	public String Logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return "redirect:/";
	}
	
	@PostMapping("/login")
	public String Login(Model m,HttpServletRequest request) {
		String email = request.getParameter("email");
		Member member = memberService.findByEmail(email);
			request.getSession().setAttribute("memberid", member.getMemberid());
			request.getSession().setAttribute("membername", member.getFirstname()+member.getLastname());
		List<Product> products = productService.findAll();
		Map<Integer , Integer> productdcps = marketingEventService.productdcp(products);
		m.addAttribute("products", products);
		m.addAttribute("productdcps", productdcps);
		return "/product/productlist";
	}
	
}
