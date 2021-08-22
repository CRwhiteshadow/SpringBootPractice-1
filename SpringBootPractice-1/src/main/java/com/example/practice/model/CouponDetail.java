package com.example.practice.model;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "coupondetail")
public class CouponDetail {
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@ManyToOne
	@JoinColumn(name = "member_id")
	private Member member;
	
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "coupon_id")
	private Coupon coupon;
	
	@OneToOne
	@JoinColumn(name = "order_id")
	private Order order;
	
	private int get_type; //獲取類型 0:後台發放 1:主動獲取
	
	private Timestamp create_time; //建立時間
	
	private int use_status; //使用狀態 0:未使用 1:已使用 2:已過期
	
	private Timestamp use_time; //使用時間

	private String code; //coupon號碼
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Coupon getCoupon() {
		return coupon;
	}

	public void setCoupon(Coupon coupon) {
		this.coupon = coupon;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public int getGet_type() {
		return get_type;
	}

	public void setGet_type(int get_type) {
		this.get_type = get_type;
	}

	public Timestamp getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Timestamp create_time) {
		this.create_time = create_time;
	}

	public int getUse_status() {
		return use_status;
	}

	public void setUse_status(int use_status) {
		this.use_status = use_status;
	}

	public Timestamp getUse_time() {
		return use_time;
	}

	public void setUse_time(Timestamp use_time) {
		this.use_time = use_time;
	}
	
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
	
}
