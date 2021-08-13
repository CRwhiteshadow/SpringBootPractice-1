package com.example.practice.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.practice.model.CartItem;
import com.example.practice.model.CheckoutInfo;
import com.example.practice.model.Member;
import com.example.practice.model.Product;
import com.example.practice.service.ICartItemService;
import com.example.practice.service.ICheckoutService;
import com.example.practice.service.IMarketingEventService;
import com.example.practice.service.IMemberService;

@Controller
public class CheckoutController {

	@Autowired private ICartItemService cartItemService;
	@Autowired private IMarketingEventService marketingEventService;
	@Autowired private IMemberService memberService;
	@Autowired private ICheckoutService checkoutService;
	
	@GetMapping("/checkout")
	public String showPage(Model m,HttpServletRequest request) {
		Integer id=(Integer)(request.getSession().getAttribute("memberid"));
		Member member = memberService.findByMemberid(id);
		List<CartItem> cartItems = cartItemService.findByMember(member);
		List<Product> products = new ArrayList<Product>();
		for(int i=0;i<cartItems.size();i++) {
			Product product = cartItems.get(i).getProduct();
			products.add(product);
		}
		Map<Integer , Integer> productdcps = marketingEventService.productdcp(products);
		CheckoutInfo checkoutInfo = checkoutService.prepareCheckout(cartItems);
		m.addAttribute("cartItems", cartItems);
		m.addAttribute("productdcps", productdcps);
		m.addAttribute("checkoutInfo", checkoutInfo);
		m.addAttribute("postName", member.getPostname());
		m.addAttribute("postMobile", member.getPostmobile());
		m.addAttribute("postAddress", memberService.getPostAddress(member));
		return "checkout/checkout";
	}
}
