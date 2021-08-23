package com.example.practice.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.lang.Nullable;

@Entity
@Table(name = "orders")
public class Order {
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	
	@Column(name = "order_address", nullable = true)
	private String address;
	
	private String postname; //收件人姓名
	private String postmobile;
	private Date ordertime;
	private int productCost;	
	private int subtotal;
	private int tax;
	private int shippongCost;
	@Nullable
	private int couponAmount;
	private int total;
	private  Date deliverDate;
	
	@Enumerated(EnumType.STRING)
	private PaymentMethod paymentMethod;
	
	@Enumerated(EnumType.STRING)
	private OrderStatus status;
	
	@ManyToOne
	@JoinColumn (name= "memberid")
	private Member member;
	
	@OneToMany(mappedBy ="order",  cascade = {CascadeType.PERSIST, CascadeType.MERGE}  )
	private Set<OrderDetail> orderDetails = new HashSet<>();
	
	@Nullable
	private String ecpayMerchantTradeNo;
	
	@OneToOne
	private CouponDetail couponDetails;
	

	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPostname() {
		return postname;
	}

	public void setPostname(String postname) {
		this.postname = postname;
	}

	public String getPostmobile() {
		return postmobile;
	}

	public void setPostmobile(String postmobile) {
		this.postmobile = postmobile;
	}

	public int getShippongCost() {
		return shippongCost;
	}

	public void setShippongCost(int shippongCost) {
		this.shippongCost = shippongCost;
	}
	
	public Date getOrdertime() {
		return ordertime;
	}

	public void setOrdertime(Date ordertime) {
		this.ordertime = ordertime;
	}

	public int getProductCost() {
		return productCost;
	}

	public void setProductCost(int productCost) {
		this.productCost = productCost;
	}

	public int getSubtotal() {
		return subtotal;
	}

	public void setSubtotal(int subtotal) {
		this.subtotal = subtotal;
	}

	public int getTax() {
		return tax;
	}

	public void setTax(int tax) {
		this.tax = tax;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public Date getDeliverDate() {
		return deliverDate;
	}

	public void setDeliverDate(Date deliverDate) {
		this.deliverDate = deliverDate;
	}

	public PaymentMethod getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(PaymentMethod paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public OrderStatus getStatus() {
		return status;
	}

	public void setStatus(OrderStatus status) {
		this.status = status;
	}
	
	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Set<OrderDetail> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(Set<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}
	
	public String getEcpayMerchantTradeNo() {
		return ecpayMerchantTradeNo;
	}

	public void setEcpayMerchantTradeNo(String ecpayMerchantTradeNo) {
		this.ecpayMerchantTradeNo = ecpayMerchantTradeNo;
	}	
	
	public CouponDetail getCouponDetails() {
		return couponDetails;
	}

	public void setCouponDetails(CouponDetail couponDetails) {
		this.couponDetails = couponDetails;
	}

	public int getCouponAmount() {
		return couponAmount;
	}

	public void setCouponAmount(int couponAmount) {
		this.couponAmount = couponAmount;
	}

	@Override
	public String toString() {
		return "OrderBean [id=" + id + ", address=" + address + ", postname=" + postname + ", ordertime="
				+ ordertime + ", productCost=" + productCost + ", subtotal=" + subtotal + ", tax=" + tax
				+ ", shippongCost=" + shippongCost + ", total=" + total + ", deliverDate=" + deliverDate
				+ ", paymentMethod=" + paymentMethod + ", status=" + status + ", member=" + member
				+ ", orderDetails=" + orderDetails + ", ecpayMerchantTradeNo=" + ecpayMerchantTradeNo 
				+ ", couponDetails=" + couponDetails + ", couponAmount=" + couponAmount +"]";
	}

}
