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
@Table(name="marketingeventtype")
@Component(value = "marketingEventTypeBean")
public class MarketingEventTypeBean implements java.io.Serializable{
	@Transient
	private static final long serialVersionUID = 1L;
	
	@Id @Column(name="MEVENTTYPEID")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long meventtypeid;
	
	@Column(name="MEVENTTYPE")
	private String meventtype;
	
	public Long getMeventtypeid() {
		return meventtypeid;
	}
	public void setMeventtypeid(Long meventtypeid) {
		this.meventtypeid = meventtypeid;
	}
	public String getMeventtype() {
		return meventtype;
	}
	public void setMeventtype(String meventtype) {
		this.meventtype = meventtype;
	}
	
	

}
