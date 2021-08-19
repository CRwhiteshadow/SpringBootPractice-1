package com.example.practice.controller;

import java.util.Enumeration;
import java.util.Hashtable;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.practice.model.EcpayReturn;
import com.example.practice.model.Member;
import com.example.practice.model.Order;
import com.example.practice.model.OrderStatus;
import com.example.practice.model.Product;
import com.example.practice.service.ICartItemService;
import com.example.practice.service.IEcpayReturnService;
import com.example.practice.service.IMemberService;
import com.example.practice.service.IOrderService;
import com.example.practice.service.IProductService;

import ecpay.payment.integration.AllInOne;

@RestController
public class CartRestController {
	
	@Autowired private ICartItemService cartItemService;
	@Autowired private IMemberService memberService;
	@Autowired private IProductService productService;
	@Autowired private IEcpayReturnService ecpayReturnService;
	@Autowired private IOrderService orderService;
	
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
	
	@PostMapping("/cart/update/{productid}/{quantity}")
	public  void updateQuantity(@PathVariable("productid") Integer pid,
			@PathVariable("quantity")int quantity,
			HttpServletRequest request) {
		try {
		Integer memberid =(Integer)request.getSession().getAttribute("memberid");
		Member member = memberService.findByMemberid(memberid);
		Product product = productService.findById(pid);
		cartItemService.updateQuantity(quantity, member, product);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@DeleteMapping("/cart/delete/{productid}")
	public void deleteProduct(@PathVariable("productid") Integer pid,
			HttpServletRequest request) {
		try {
			Integer memberid =(Integer)request.getSession().getAttribute("memberid");
			Member member = memberService.findByMemberid(memberid);
			Product product = productService.findById(pid);
			cartItemService.deleteByMemberAndProduct(member, product);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@GetMapping("/cart/getcount")
	public int countCartItems(HttpServletRequest request) {
		if(request.getSession().getAttribute("memberid")==null) {
			return 0;
		}else {
		Integer memberid =(Integer)request.getSession().getAttribute("memberid");
		Member member = memberService.findByMemberid(memberid);

		int num = cartItemService.countCartItems(member);
		return num;
		}
	}

	@PostMapping("/ecpayreturn")
	public String ecpayreturn(HttpServletRequest request) {
		System.out.println("test");
		Enumeration<String> attrNamesList = request.getParameterNames();
		Hashtable<String, String> params = new Hashtable<String, String>();
		AllInOne all =new AllInOne("");
		while(attrNamesList.hasMoreElements()) {
			String para = attrNamesList.nextElement();
			params.put(para,request.getParameter(para));
		}
		if(all.compareCheckMacValue(params)) {
			EcpayReturn ecpayReturn = new EcpayReturn();
			ecpayReturn.setEcpayMerchantTradeNo(request.getParameter("MerchantTradeNo"));
			ecpayReturn.setRtnCode(Integer.parseInt(request.getParameter("RtnCode")));
			ecpayReturn.setRtnMsg(request.getParameter("RtnMsg"));
			ecpayReturn.setTradeNo(request.getParameter("TradeNo"));
			ecpayReturn.setPaymentDate(request.getParameter("PaymentDate"));
			ecpayReturn.setPaymentTypeChargeFee(request.getParameter("PaymentTypeChargeFee"));
			ecpayReturn.setTradeDate(request.getParameter("TradeDate"));
			ecpayReturn.setSimulatePaid(Integer.parseInt(request.getParameter("SimulatePaid")));
			ecpayReturn.setPaymentType(request.getParameter("PaymentType"));
			ecpayReturnService.save(ecpayReturn);
			
			Order order=orderService.findByEcpayMerchantTradeNo(request.getParameter("MerchantTradeNo"));
			if(Integer.parseInt(request.getParameter("RtnCode"))==1 && Integer.parseInt(request.getParameter("SimulatePaid"))==0) {				
				order.setStatus(OrderStatus.PAID);				
			}else {
				order.setStatus(OrderStatus.UNPAID);
			}
			orderService.save(order);
			System.out.println("test if");
			return "1|OK";
		}else {
			return "";
		}
		
	}
	
}
