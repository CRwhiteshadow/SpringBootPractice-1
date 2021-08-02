package com.example.practice.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "marketingeventproductlist")
@Component(value = "marketingEventProductListBean")
public class MarketingEventProductListBean implements java.io.Serializable{
	@Transient
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long meplid;

	@JsonIgnore
	@ManyToOne(targetEntity = MarketingEventListBean.class,fetch = FetchType.LAZY,optional = false)
	@JoinColumn(name = "MEVENTLISTID",insertable = false,updatable = false)
	private MarketingEventListBean marketingEventListBean;
	@Column(name = "MEVENTLISTID")
	private Long meventlistid;

	@ManyToOne(targetEntity = Product.class,fetch = FetchType.LAZY,optional = false)
	@JoinColumn(name = "PRODUCTID",insertable = false,updatable = false)
	private Product product;
	@Column(name = "PRODUCTID")
	private int productid;
	
	@Column(name = "MEVENTPRODUCTDISCOUNTPRICE")
	private int meventproductdiscountprice;
	
	@Column(name = "MEVENTPRODUCTQUANTITYLIMIT")
	private boolean meventproductquantitylimit;
	
	@Column(name = "MEVENTPRODUCTQUANTITY")
	private int meventproductquantity;
	
	

	public int getProductid() {
		return productid;
	}
	public void setProductid(int productid) {
		this.productid = productid;
	}
	public int getMeventproductdiscountprice() {
		return meventproductdiscountprice;
	}
	public void setMeventproductdiscountprice(int meventproductdiscountprice) {
		this.meventproductdiscountprice = meventproductdiscountprice;
	}
	public boolean isMeventproductquantitylimit() {
		return meventproductquantitylimit;
	}
	public void setMeventproductquantitylimit(boolean meventproductquantitylimit) {
		this.meventproductquantitylimit = meventproductquantitylimit;
	}
	public int getMeventproductquantity() {
		return meventproductquantity;
	}
	public void setMeventproductquantity(int meventproductquantity) {
		this.meventproductquantity = meventproductquantity;
	}
	public Long getMeplid() {
		return meplid;
	}
	public void setMeplid(Long meplid) {
		this.meplid = meplid;
	}
	public MarketingEventListBean getMarketingEventListBean() {
		return marketingEventListBean;
	}
	public void setMarketingEventListBean(MarketingEventListBean marketingEventListBean) {
		this.marketingEventListBean = marketingEventListBean;
	}
	public Long getMeventlistid() {
		return meventlistid;
	}
	public void setMeventlistid(Long meventlistid) {
		this.meventlistid = meventlistid;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}


	
	

}
