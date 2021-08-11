package com.example.practice.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.practice.model.Member;
import com.example.practice.model.Product;
import com.example.practice.service.ICartItemService;
import com.example.practice.service.IMemberService;
import com.example.practice.service.IProductService;

@RestController
public class CartRestController {
	
	@Autowired private ICartItemService cartItemService;
	@Autowired private IMemberService memberService;
	@Autowired private IProductService productService;
	
	@PostMapping("/cart/add/{productid}/{quantity}")
	public  String addProductToCart(@PathVariable("productid") Integer pid,
			@PathVariable("quantity")int quantity,
			HttpServletRequest request) {
		if(request.getSession().getAttribute("memberid")==null) {
			return "請先登入";
		}else {
		Integer memberid =(Integer)request.getSession().getAttribute("memberid");
		Member member = memberService.findByMemberid(memberid);
		Product product = productService.findById(pid);
		int num = cartItemService.addProductToCart(quantity, member, product);
		return num+"個商品已加入購物車";
		}
		
	}

}
