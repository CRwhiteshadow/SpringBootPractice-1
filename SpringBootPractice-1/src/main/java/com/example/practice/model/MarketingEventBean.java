package com.example.practice.model;

import java.sql.Timestamp;
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

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name="marketingevent")
@Component("marketingEventBean")
public class MarketingEventBean implements java.io.Serializable {
	@Transient
	private static final long serialVersionUID = 1L;
	
	@Id @Column(name="MEVENTID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long meventid;
	
	@Column(name="MEVENTTITLE")
	private String meventtitle;	

	@Column(name="MEVENTPICTURE")
	private byte[] meventpicture;
	
	@Column(name = "MEVENTPICTURENAME")
	private String meventpicturename;
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	@Column(name = "MEVENTSTARTDATE")
	private Timestamp meventstartdate;
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	@Column(name = "MEVENTENDDATE")
	private Timestamp meventenddate;
	
	@Column(name = "MEVENTNAME")
	private String meventname;
	
	@Column(name = "MEVENTDESCRIPTION")
	private String meventdescription;
	
	@ManyToOne(targetEntity = MarketingEventTypeBean.class,fetch = FetchType.LAZY,optional = false)
	@JoinColumn(name = "MEVENTTYPEID",insertable = false,updatable = false)
	private MarketingEventTypeBean marketingEventTypeBean;
	@Column(name = "MEVENTTYPEID")
	private Long meventtypeid;
	
	@Column(name = "MEVENTOWNERID")
	private Integer meventownerid;
	
	@Column(name = "MEVENTONLINE")
	private boolean meventonline;

	@OneToMany(cascade = CascadeType.ALL)
//	@JoinColumn(name="MEVENTID")
	private List<MarketingEventListBean> marketingEventListBean;
	
	public Long getMeventid() {
		return meventid;
	}

	public void setMeventid(Long meventid) {
		this.meventid = meventid;
	}

	public String getMeventtitle() {
		return meventtitle;
	}

	public void setMeventtitle(String meventtitle) {
		this.meventtitle = meventtitle;
	}

	public byte[] getMeventpicture() {
		return meventpicture;
	}

	public void setMeventpicture(byte[] meventpicture) {
		this.meventpicture = meventpicture;
	}

	public String getMeventpicturename() {
		return meventpicturename;
	}

	public void setMeventpicturename(String meventpicturename) {
		this.meventpicturename = meventpicturename;
	}
	
	public Timestamp getMeventstartdate() {
		return meventstartdate;
	}

	public void setMeventstartdate(Timestamp meventstartdate) {
		this.meventstartdate = meventstartdate;
	}

	public Timestamp getMeventenddate() {
		return meventenddate;
	}

	public void setMeventenddate(Timestamp meventenddate) {
		this.meventenddate = meventenddate;
	}

	public String getMeventname() {
		return meventname;
	}

	public void setMeventname(String meventname) {
		this.meventname = meventname;
	}

	public String getMeventdescription() {
		return meventdescription;
	}

	public void setMeventdescription(String meventdescription) {
		this.meventdescription = meventdescription;
	}

	public Long getMeventtypeid() {
		return meventtypeid;
	}

	public void setMeventtypeid(Long meventtypeid) {
		this.meventtypeid = meventtypeid;
	}

	public Integer getMeventownerid() {
		return meventownerid;
	}

	public void setMeventownerid(Integer meventownerid) {
		this.meventownerid = meventownerid;
	}

	public boolean isMeventonline() {
		return meventonline;
	}

	public void setMeventonline(boolean meventonline) {
		this.meventonline = meventonline;
	}

	public List<MarketingEventListBean> getMarketingEventListBean() {
		return marketingEventListBean;
	}

	public void setMarketingEventListBean(List<MarketingEventListBean> marketingEventListBean) {
		this.marketingEventListBean = marketingEventListBean;
	}
	
	
	
	
}

