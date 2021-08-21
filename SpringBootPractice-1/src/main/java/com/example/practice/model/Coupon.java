package com.example.practice.model;

import java.sql.Timestamp;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "coupons")
public class Coupon {

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private String name;
		
	private int amount; //coupon面額
	
	private int per_limit; //每人限領張數
	
	private int min_point; //使用門檻
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	private Timestamp start_time;
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	private Timestamp end_time;
	
	private int use_type; //使用類型 0:通用 1:限商品分類
	
	private int publish_count; //發行數量
	
	private int use_count; //使用數量
	
	private int receive_count; //領取數量
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	private Timestamp enable_time; //可領取日期
	

	
	@OneToMany(mappedBy = "coupon",cascade = CascadeType.ALL,fetch = FetchType.LAZY)
	private Set<CouponDetail> couponDetails;
	
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getPer_limit() {
		return per_limit;
	}

	public void setPer_limit(int per_limit) {
		this.per_limit = per_limit;
	}

	public int getMin_point() {
		return min_point;
	}

	public void setMin_point(int min_point) {
		this.min_point = min_point;
	}

	public Timestamp getStart_time() {
		return start_time;
	}

	public void setStart_time(Timestamp start_time) {
		this.start_time = start_time;
	}

	public Timestamp getEnd_time() {
		return end_time;
	}

	public void setEnd_time(Timestamp end_time) {
		this.end_time = end_time;
	}

	public int getUse_type() {
		return use_type;
	}

	public void setUse_type(int use_type) {
		this.use_type = use_type;
	}

	public int getPublish_count() {
		return publish_count;
	}

	public void setPublish_count(int publish_count) {
		this.publish_count = publish_count;
	}

	public int getUse_count() {
		return use_count;
	}

	public void setUse_count(int use_count) {
		this.use_count = use_count;
	}

	public int getReceive_count() {
		return receive_count;
	}

	public void setReceive_count(int receive_count) {
		this.receive_count = receive_count;
	}

	public Timestamp getEnable_time() {
		return enable_time;
	}

	public void setEnable_time(Timestamp enable_time) {
		this.enable_time = enable_time;
	}



	public Set<CouponDetail> getCouponDetails() {
		return couponDetails;
	}

	public void setCouponDetails(Set<CouponDetail> couponDetails) {
		this.couponDetails = couponDetails;
	}
	
	
	
	
}
