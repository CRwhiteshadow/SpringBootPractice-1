package com.example.practice.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeSet;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.practice.model.CartItem;
import com.example.practice.model.MarketingEventProductListBean;
import com.example.practice.model.Member;
import com.example.practice.model.Product;
import com.example.practice.service.ICartItemService;
import com.example.practice.service.IMarketingEventService;
import com.example.practice.service.IMemberService;
import com.example.practice.service.IProductService;

@Controller
public class CartController {

	@Autowired private IMarketingEventService marketingEventService;
	@Autowired private IMemberService memberService;
	@Autowired private IProductService productService;
	@Autowired private ICartItemService cartItemService;
	
	@GetMapping("/cart")
	public String cart(HttpServletRequest request,Model m) {
		Integer id=(Integer)(request.getSession().getAttribute("memberid"));
		Member member = memberService.findByMemberid(id);
		List<CartItem> cartItems = cartItemService.findByMember(member);
		List<Product> products = new ArrayList<Product>();
		for(int i=0;i<cartItems.size();i++) {
			Product product = cartItems.get(i).getProduct();
			products.add(product);
		}
		Map<Integer , Integer> productdcps = productdcp(products);
		m.addAttribute("cartItems", cartItems);
		m.addAttribute("productdcps", productdcps);
		return "/cart/test";
	}
	
	public Map<Integer , Integer> productdcp(List<Product> products){
		Map<Integer , Integer> dcpMap = new HashMap<Integer, Integer>(); 
		for (int i=0;i<products.size();i++) {
			Timestamp time = Timestamp.valueOf(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			List<MarketingEventProductListBean> mepls = marketingEventService.findByMeventstartdateBeforeAndMeventenddateAfterAndMeventonlineTrueAndProductid(time, products.get(i).getProductid());
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
}
