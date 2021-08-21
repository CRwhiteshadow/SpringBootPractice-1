package com.example.practice.model;

import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "marketingeventlist")
@Component(value = "marketingEventListBean")
public class MarketingEventListBean implements java.io.Serializable{
	@Transient
	private static final long serialVersionUID = 1L;
	
	@Id 
	@Column(name = "MEVENTLISTID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long meventlistid;
	
	@ManyToOne(targetEntity = MarketingEventListTypeBean.class,fetch = FetchType.LAZY,optional = false)
	@JoinColumn(name = "MEVENTLISTTYPEID",insertable = false,updatable = false)
	private MarketingEventListTypeBean marketingEventListTypeBean;
	@Column(name = "MEVENTLISTTYPEID")
	private Long meventlisttypeid;
	
	@ManyToOne(targetEntity = MarketingEventBean.class,fetch = FetchType.LAZY,optional = false)
	@JoinColumn(name = "MEVENTID",insertable = false,updatable = false)
	private MarketingEventBean marketingEventBean;
	@Column(name = "MEVENTID")
	private Long meventid;
	
	@OneToMany(cascade = CascadeType.ALL)
//	@JoinColumn(name="MEVENTLISTID")
	private List<MarketingEventProductListBean> marketingEventProductListBean;
	
	@OneToMany(cascade = CascadeType.ALL)
	private List<MarketingEventCouponList> marketingEventCouponLists;
	
	public Long getMeventlistid() {
		return meventlistid;
	}
	public void setMeventlistid(Long meventlistid) {
		this.meventlistid = meventlistid;
	}
	public Long getMeventlisttypeid() {
		return meventlisttypeid;
	}
	public void setMeventlisttypeid(Long meventlisttypeid) {
		this.meventlisttypeid = meventlisttypeid;
	}
	public Long getMeventid() {
		return meventid;
	}
	public void setMeventid(Long meventid) {
		this.meventid = meventid;
	}
	public List<MarketingEventProductListBean> getMarketingEventProductListBean() {
		return marketingEventProductListBean;
	}
	public void setMarketingEventProductListBean(List<MarketingEventProductListBean> marketingEventProductListBean) {
		this.marketingEventProductListBean = marketingEventProductListBean;
	}
	public List<MarketingEventCouponList> getMarketingEventCouponLists() {
		return marketingEventCouponLists;
	}
	public void setMarketingEventCouponLists(List<MarketingEventCouponList> marketingEventCouponLists) {
		this.marketingEventCouponLists = marketingEventCouponLists;
	}
	
	
	
}
