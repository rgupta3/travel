package com.sony.travelRequest.model;

import java.util.Date;

public class AdvanceAmount {

	private Date date;
	private String type;
	private String currency;
	private String billNo;
	private float forexAmount;
	private float conversionRate;
	private float INRAmount;
	private String remarks;
	
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public String getBillNo() {
		return billNo;
	}
	public void setBillNo(String billNo) {
		this.billNo = billNo;
	}
	public float getForexAmount() {
		return forexAmount;
	}
	public void setForexAmount(float forexAmount) {
		this.forexAmount = forexAmount;
	}
	public float getConversionRate() {
		return conversionRate;
	}
	public void setConversionRate(float conversionRate) {
		this.conversionRate = conversionRate;
	}
	public float getINRAmount() {
		return INRAmount;
	}
	public void setINRAmount(float iNRAmount) {
		INRAmount = iNRAmount;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
}
