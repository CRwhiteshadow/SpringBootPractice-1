package com.example.practice.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ecapyreturns")
public class EcpayReturn {
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	
	private String ecpayMerchantTradeNo;
	
	private int rtnCode;
	
	private String rtnMsg;
	
	private String tradeNo;
	
	private String paymentDate;
	
	private String paymentTypeChargeFee;
	
	private String tradeDate;
	
	private int simulatePaid;
	
	private String paymentType;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEcpayMerchantTradeNo() {
		return ecpayMerchantTradeNo;
	}

	public void setEcpayMerchantTradeNo(String ecpayMerchantTradeNo) {
		this.ecpayMerchantTradeNo = ecpayMerchantTradeNo;
	}

	public int getRtnCode() {
		return rtnCode;
	}

	public void setRtnCode(int rtnCode) {
		this.rtnCode = rtnCode;
	}

	public String getRtnMsg() {
		return rtnMsg;
	}

	public void setRtnMsg(String rtnMsg) {
		this.rtnMsg = rtnMsg;
	}

	public String getTradeNo() {
		return tradeNo;
	}

	public void setTradeNo(String tradeNo) {
		this.tradeNo = tradeNo;
	}

	public String getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}

	public String getPaymentTypeChargeFee() {
		return paymentTypeChargeFee;
	}

	public void setPaymentTypeChargeFee(String paymentTypeChargeFee) {
		this.paymentTypeChargeFee = paymentTypeChargeFee;
	}

	public String getTradeDate() {
		return tradeDate;
	}

	public void setTradeDate(String tradeDate) {
		this.tradeDate = tradeDate;
	}

	public int getSimulatePaid() {
		return simulatePaid;
	}

	public void setSimulatePaid(int simulatePaid) {
		this.simulatePaid = simulatePaid;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}
	
	

}
