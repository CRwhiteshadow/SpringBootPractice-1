package com.example.practice.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "marketingeventcouponlist")
public class MarketingEventCouponList implements java.io.Serializable{

	@Transient
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long meclid;
	
	@JsonIgnore
	@ManyToOne(targetEntity = MarketingEventListBean.class,fetch = FetchType.LAZY,optional = false)
	@JoinColumn(name = "meventlist_id",insertable = false,updatable = false)
	private MarketingEventListBean marketingEventListBean;
	private Long meventlist_id;
	
	@ManyToOne(targetEntity = Coupon.class,fetch = FetchType.LAZY,optional = false)
	@JoinColumn(name = "coupon_id",insertable = false,updatable = false)
	private Coupon coupon;
	private Long coupon_id;

	public Long getMeclid() {
		return meclid;
	}

	public void setMeclid(Long meclid) {
		this.meclid = meclid;
	}

	public MarketingEventListBean getMarketingEventListBean() {
		return marketingEventListBean;
	}

	public void setMarketingEventListBean(MarketingEventListBean marketingEventListBean) {
		this.marketingEventListBean = marketingEventListBean;
	}

	public Coupon getCoupon() {
		return coupon;
	}

	public void setCoupon(Coupon coupon) {
		this.coupon = coupon;
	}

	public Long getMeventlist_id() {
		return meventlist_id;
	}

	public void setMeventlist_id(Long meventlist_id) {
		this.meventlist_id = meventlist_id;
	}

	public Long getCoupon_id() {
		return coupon_id;
	}

	public void setCoupon_id(Long coupon_id) {
		this.coupon_id = coupon_id;
	}
	
	

}
