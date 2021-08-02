package com.example.practice.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "marketingeventlisttype")
@Component(value = "marketingEventListTypeBean")
public class MarketingEventListTypeBean implements java.io.Serializable{
	@Transient
	private static final long serialVersionUID = 1L;
	
	@Id @Column(name = "MEVENTLISTTYPEID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long meventlisttypeid;
	
	@Column(name = "MEVENTLISTTYPE")
	private String meventlisttype;
	
	public Long getMeventlisttypeid() {
		return meventlisttypeid;
	}
	public void setMeventlisttypeid(Long meventlisttypeid) {
		this.meventlisttypeid = meventlisttypeid;
	}
	public String getMeventlisttype() {
		return meventlisttype;
	}
	public void setMeventlisttype(String meventlisttype) {
		this.meventlisttype = meventlisttype;
	}
	
	
	
}
