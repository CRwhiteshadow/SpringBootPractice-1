package com.example.practice.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.practice.model.CartItem;
import com.example.practice.model.CheckoutInfo;
import com.example.practice.model.CouponDetail;
import com.example.practice.model.Member;
import com.example.practice.model.Order;
import com.example.practice.model.PaymentMethod;
import com.example.practice.model.Product;
import com.example.practice.service.ICartItemService;
import com.example.practice.service.ICheckoutService;
import com.example.practice.service.ICouponDetailService;
import com.example.practice.service.IMarketingEventService;
import com.example.practice.service.IMemberService;
import com.example.practice.service.IOrderService;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutOneTime;

@Controller
public class CheckoutController {

	@Autowired private ICartItemService cartItemService;
	@Autowired private IMarketingEventService marketingEventService;
	@Autowired private IMemberService memberService;
	@Autowired private ICheckoutService checkoutService;
	@Autowired private IOrderService orderService;
	@Autowired private ICouponDetailService couponDetailService;
	
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
		List<CouponDetail> couponDetails = couponDetailService.findByMemberAndUseStatus(member, 0,checkoutInfo.getPaymentTotal());
		m.addAttribute("cartItems", cartItems);
		m.addAttribute("productdcps", productdcps);
		m.addAttribute("checkoutInfo", checkoutInfo);
		m.addAttribute("postName", member.getPostname());
		m.addAttribute("postMobile", member.getPostmobile());
		m.addAttribute("couponDetails", couponDetails);
		m.addAttribute("postAddress", memberService.getPostAddress(member));
		return "checkout/checkout";
	}
	
	@PostMapping("/place_order")
	public String placeOrder(HttpServletRequest request,Model m) {
		String paymentway = request.getParameter("paymentway");
		switch(paymentway) {
		case "COD":
			PaymentMethod paymentMethod = PaymentMethod.COD;
			place(request, paymentMethod);
			break;
		case "Card":
			PaymentMethod paymentMethod2 = PaymentMethod.CREDIT_CARD;
			Order newOrder = place(request, paymentMethod2);
			String ecpay = callECPay(request,newOrder);
			m.addAttribute("ecpay", ecpay);
			return "checkout/callecpay";
		case "Paypal":
			PaymentMethod paymentMethod3 = PaymentMethod.PayPal;
			break;
		}
		
		return "checkout/order_completed";
	}
	
	public Order place(HttpServletRequest request,PaymentMethod paymentMethod) {
		Integer id=(Integer)(request.getSession().getAttribute("memberid"));
		Member member = memberService.findByMemberid(id);
		List<CartItem> cartItems = cartItemService.findByMember(member);
		CheckoutInfo checkoutInfo = checkoutService.prepareCheckout(cartItems);
		Order newOrder = orderService.addNewOrder(id, cartItems, paymentMethod, checkoutInfo);
		cartItemService.deleteByMember(member);
		return newOrder;
	}
	
	public String callECPay(HttpServletRequest request,Order order) {		
			String pathString = null;
			AllInOne all = new AllInOne(pathString);
			AioCheckOutOneTime domain = new AioCheckOutOneTime();
			String MerchantTradeNo = new SimpleDateFormat("yyyyMMddHHmmss").format(order.getOrdertime()) + "PP";
			int num = orderService.countByEcpayMerchantTradeNoContaining(MerchantTradeNo);
			MerchantTradeNo = MerchantTradeNo + (num+1);
			
			domain.setMerchantID("2000132");
			domain.setMerchantTradeNo(MerchantTradeNo);
			domain.setMerchantTradeDate(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(order.getOrdertime()));
			domain.setTotalAmount(Integer.toString(order.getTotal()));
			domain.setTradeDesc("petpet寵物網");
			domain.setItemName("petpet寵物網商品一批(含運費)共"+order.getTotal()+"元");
			domain.setReturnURL(request.getScheme()+"://"+request.getServerName()+request.getContextPath()+"/ecpayreturn"); //依個人IP位置跟專案更改
			domain.setOrderResultURL(request.getScheme()+"://"+request.getServerName()+request.getContextPath()+"/ecpayclientreturn"); //依個人IP位置跟專案更改
			String ecpay = all.aioCheckOut(domain, null);
			
			order.setEcpayMerchantTradeNo(MerchantTradeNo);
			orderService.save(order);
			return ecpay;	
	}
	
	@PostMapping("/ecpayclientreturn")
	public String ecpayclientreturn() {
		return "checkout/order_completed";
	}
}
