package com.example.practice.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "product")
@Component(value = "product")
public class Product implements java.io.Serializable{
	@Transient
	private static final long serialVersionUID = 1L;

	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Id @Column(name = "PRODUCTID")
	private int productid;
	
	@Column(name = "PRODUCTNAME")
	private String productname;
	
	@Column(name = "PRODUCTPRICE")
	private int productprice;

	@OneToMany(cascade = {CascadeType.PERSIST,CascadeType.MERGE})
	@JoinColumn(name = "PRODUCTID")
	protected Set<MarketingEventProductListBean> mEventProductListBean = new HashSet<MarketingEventProductListBean>();
	
	public int getProductid() {
		return productid;
	}

	public void setProductid(int productid) {
		this.productid = productid;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public int getProductprice() {
		return productprice;
	}

	public void setProductprice(int productprice) {
		this.productprice = productprice;
	}
	
	

}
