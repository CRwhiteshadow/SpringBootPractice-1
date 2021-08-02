package com.example.practice.model;

import java.sql.Timestamp;

public class MarketingEventMemberRegistrationListBean implements java.io.Serializable{
	private static final long serialVersionUID = 1L;
	private int meventid;
	private int meventlistid;
	private int memberid;
	private int orderid;
	private Timestamp meventregistrationdate;
	private boolean meventwinprize;
	private boolean meventprizedelivery;
	
	public int getMeventid() {
		return meventid;
	}
	public void setMeventid(int meventid) {
		this.meventid = meventid;
	}
	public int getMeventlistid() {
		return meventlistid;
	}
	public void setMeventlistid(int meventlistid) {
		this.meventlistid = meventlistid;
	}
	public int getMemberid() {
		return memberid;
	}
	public void setMemberid(int memberid) {
		this.memberid = memberid;
	}
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	public Timestamp getMeventregistrationdate() {
		return meventregistrationdate;
	}
	public void setMeventregistrationdate(Timestamp meventregistrationdate) {
		this.meventregistrationdate = meventregistrationdate;
	}
	public boolean isMeventwinprize() {
		return meventwinprize;
	}
	public void setMeventwinprize(boolean meventwinprize) {
		this.meventwinprize = meventwinprize;
	}
	public boolean isMeventprizedelivery() {
		return meventprizedelivery;
	}
	public void setMeventprizedelivery(boolean meventprizedelivery) {
		this.meventprizedelivery = meventprizedelivery;
	}
	
}
