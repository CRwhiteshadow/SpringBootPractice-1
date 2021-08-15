package com.example.practice.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.example.practice.model.CartItem;
import com.example.practice.model.CheckoutInfo;
import com.example.practice.model.Order;
import com.example.practice.model.OrderDetail;
import com.example.practice.model.OrderStatus;
import com.example.practice.model.PaymentMethod;
import com.example.practice.model.Product;
import com.example.practice.repository.IOrderRepository;

@Service("OrderService")
@Transactional
public class OrderService implements IOrderService {
	
	@Autowired private IOrderRepository orderRepository;
	@Autowired private IMemberService memberService;
	@Autowired private IMarketingEventService meventService;
	private static final int SHIPPINGCOSTPERITEM =30; //每一項商品的運費

	@Override
	public Order addNewOrder(Integer memberid,List<CartItem> cartItems,PaymentMethod paymentMethod,CheckoutInfo checkoutInfo) {
		Order newOreder = new Order();
		newOreder.setOrdertime(new Date());
		newOreder.setStatus(OrderStatus.NEW);
		newOreder.setMember(memberService.findByMemberid(memberid));
		newOreder.setProductCost(checkoutInfo.getProductCost());
		newOreder.setSubtotal(checkoutInfo.getProductTotal());
		newOreder.setShippongCost(checkoutInfo.getShippingCostTotal());
		newOreder.setTax(0);
		newOreder.setTotal(checkoutInfo.getPaymentTotal());
		newOreder.setPaymentMethod(paymentMethod);
		newOreder.setDeliverDate(checkoutInfo.getDeliverDate());
		newOreder.setAddress(memberService.getPostAddress(memberService.findByMemberid(memberid)));
		newOreder.setPostname(memberService.findByMemberid(memberid).getPostname());
		newOreder.setPostmobile(memberService.findByMemberid(memberid).getPostmobile());
		
		Set<OrderDetail> orderDetails = newOreder.getOrderDetails();
		List<Product> products = new ArrayList<Product>();
		for(int i=0;i<cartItems.size();i++) {
			products.add(cartItems.get(i).getProduct());
		}
		Map<Integer,Integer> productdcps =meventService.productdcp(products);
		for(int i=0;i<cartItems.size();i++) {
			Product product = cartItems.get(i).getProduct();
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setOrder(newOreder);
			orderDetail.setProduct(product);
			orderDetail.setQuantity(cartItems.get(i).getQuantity());
			if(productdcps.containsKey(product.getProductid())) {
				orderDetail.setUnitPrice(productdcps.get(product.getProductid())); 
			}else {
				orderDetail.setUnitPrice(product.getProductprice());					
			}
			orderDetail.setProductCost(product.getProductcost() * cartItems.get(i).getQuantity());
			orderDetail.setSubtotal(orderDetail.getUnitPrice() * cartItems.get(i).getQuantity());
			orderDetail.setShippongCost(SHIPPINGCOSTPERITEM);
			orderDetails.add(orderDetail);
		}
		
		return orderRepository.save(newOreder);

	}

	@Override
	public void listOrder() {
		Iterable<Order> order= orderRepository.findAll();
		order.forEach(System.out::println);

	}

	@Override
	public Page<Order> orderQueryAllPage(int pageNum, String sortField, String sortDir) {
		int pageSize = 8;
		Pageable pageable = PageRequest.of(pageNum - 1, pageSize,
				  sortDir.equals("asc") ? Sort.by(sortField).ascending()
                          : Sort.by(sortField).descending()
                          );//因為由0開始
		return orderRepository.findAll(pageable);
	}

	@Override
	public Order get(Integer id) throws NoSuchElementException {
		try {
			return orderRepository.findById(id).get();
		}catch (NoSuchElementException ex) {
			throw new NoSuchElementException(id+"is not found");
		}
	}

}
