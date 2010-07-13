//
//
//  Generated by StarUML(tm) Java Add-In
//
//  @ Project : Untitled
//  @ File Name : TravelRequest.java
//  @ Date : 09-04-2010
//  @ Author : 
//
//
package com.sony.travelRequest.model;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.hibernate.validator.NotEmpty;

import org.hibernate.validator.NotNull;
import com.sony.travelRequest.util.*;
public class TravelRequest implements RequestStatus{
	
	private String status;
	private int id;
	@NotNull
	private float amount;
	@NotEmpty
	private String type;
	@NotEmpty
	private String chargeableType;
	private String payment;
	private Date date;
	private boolean control;
	
	private float conversionRateLocal=(float)1.0;
	
	private float conversionRateLocaltoINR=(float)1.0;
	
	private float conversionRateINR=(float)1.0;
	private List<HotelResv> hotelResv = new ArrayList<HotelResv>();
	private List<HotelResv> apartmentResv = new ArrayList<HotelResv>();
	private List<TravelResv> travelResv = new ArrayList<TravelResv>();
	private List<RequestApproval> requestApprovals = new ArrayList<RequestApproval>();
	private TravelDetails travelDetails = new TravelDetails();
	private Employee employee = new Employee();
	private boolean showTravelApproval;
	private String country;
	private boolean disable1;
	private boolean disable2;
	private boolean disable3;
	private boolean disable4;
	private boolean disable5;
	private boolean disableCountry;
	private boolean renderForm;
	private TravelSettlement travelSettlement = new TravelSettlement();
	public TravelSettlement getTravelSettlement() {
		return travelSettlement;
	}
	public void setTravelSettlement(TravelSettlement travelSettlement) {
		this.travelSettlement = travelSettlement;
	}
/*
	public void setOptions(String[] options) {
		this.options = options;
	}
	*/
	public String getStatus()
	{
		return this.status;
	}
	public void setStatus(String status)
	{
		this.status = status;
	}
	public float getConversionRateLocal()
	{
		return this.conversionRateLocal;
	}
	public void setConversionRateLocal(float conversionRateLocal)
	{
		this.conversionRateLocal = conversionRateLocal;
	}
	public float getConversionRateLocaltoINR()
	{
		return this.conversionRateLocaltoINR;
	}
	public void setConversionRateLocaltoINR(float conversionRateLocaltoINR)
	{
		this.conversionRateLocaltoINR = conversionRateLocaltoINR;
	}
	public float getConversionRateINR()
	{
		return this.conversionRateINR;
	}
	public void setConversionRateINR(float conversionRateINR)
	{
		this.conversionRateINR = conversionRateINR;
	}
	public void enableAllFields()
	{
		disable1=false;
		disable2=false;
		//disable3=false;
		//disable4=false;
		disable5=false;
		disableCountry=false;
		renderForm=false;
	}
	public boolean getDisableCountry() {
		return disableCountry;
	}

	public void setDisableCountry(boolean disableCountry) {
		this.disableCountry = disableCountry;
	}
	public boolean getRenderForm() {
		return renderForm;
	}

	public void setRenderForm(boolean renderForm) {
		this.renderForm = renderForm;
	}
	public boolean getDisable1() {
		return disable1;
	}

	public void setDisable1(boolean disable1) {
		this.disable1 = disable1;
	}
	
	public boolean getDisable2() {
		return disable2;
	}

	public void setDisable2(boolean disable2) {
		this.disable2 = disable2;
	}
	
	public boolean getDisable3() {
		return disable3;
	}

	public void setDisable3(boolean disable3) {
		this.disable3 = disable3;
	}
	public boolean getDisable4() {
		return disable4;
	}

	public void setDisable4(boolean disable4) {
		this.disable4 = disable4;
	}
	
	public boolean getDisable5() {
		return disable5;
	}

	public void setDisable5(boolean disable5) {
		this.disable5 = disable5;
	}
	public TravelRequest() {
		this.date = Calendar.getInstance().getTime();
		hotelResv.add(new HotelResv());
		travelResv.add(new TravelResv());
		travelResv.add(new TravelResv());
		chargeableType="chargeable";
		payment="client";
		disable1=true;
		disable2=true;
		disable3=true;
		disable4=true;
		disable5=true;
		disableCountry=true;
		renderForm=false;
		System.out.println("\n\n\ntttttttttttttttttttttttttttt\n\n");
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public float getAmount() {
		return amount;
	}

	public void setAmount(float amount) {
		this.amount = amount;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	public String getChargeableType() {
		return chargeableType;
	}

	public void setChargeableType(String chargeableType) {
		this.chargeableType = chargeableType;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public boolean isControl() {
		return control;
	}

	public void setControl(boolean control) {
		this.control = control;
	}

	public List<HotelResv> getHotelResv() {
		return hotelResv;
	}

	public void setHotelResv(List<HotelResv> hotelResv) {
		this.hotelResv = hotelResv;
	}
	public List<HotelResv> getApartmentResv() {
		return apartmentResv;
	}

	public void setApartmentResv(List<HotelResv> apartmentResv) {
		this.apartmentResv = apartmentResv;
	}

	public List<TravelResv> getTravelResv() {
		return travelResv;
	}

	public void setTravelResv(List<TravelResv> travelResv) {
		this.travelResv = travelResv;
	}

	public List<RequestApproval> getRequestApprovals() {
		return requestApprovals;
	}

	public void setRequestApprovals(List<RequestApproval> requestApprovals) {
		this.requestApprovals = requestApprovals;
	}

	public TravelDetails getTravelDetails() {
		return travelDetails;
	}

	public void setTravelDetails(TravelDetails travelDetails) {
		this.travelDetails = travelDetails;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	
	public String getCountry() {
		return country;
	}
	
	public void setCountry(String country) {
		this.country = country;
	}

	public void calcStatus() {
	
	}
	
	public void calcAmount() {
	
	}
	
	public void addTravelResvRow() {
		travelResv.add(new TravelResv());
	}
	
	public void addHotelResvRow() {

		hotelResv.add(new HotelResv());
	}

	public void removeHotelResvRow() {

		hotelResv.removeAll(hotelResv);
	}
	
	public void removeTravelResvRow() {

		//int index=travelResv
	//	travelResv.remove(index);
	}
	
	public boolean isShowTravelApproval() {
		return showTravelApproval;
	}

	public void setShowTravelApproval(boolean showTravelApproval) {
		this.showTravelApproval = showTravelApproval;
	}

	public String getEmailBodyForEmployeeInitiation() {
		StringBuilder emailBody = new StringBuilder("You initiated a new travel request. Please click this url to see the summary and status of your request:");
		emailBody.append(" http://localhost:8080/travel/summary/employee/").append(getId());
		System.out.println("\nMessage\n\n"+emailBody.toString());
		return emailBody.toString();
	}
	
	public String getEmailSubjectForEmployeeInitiation() {
		StringBuilder emailHeader = new StringBuilder("Travel Request initiated with Id:").append(getId());
		return emailHeader.toString();
	}

	public String getEmailBodyForEmployeeTravelDeskApproved(String approved, String comments) {
		String approvedStr = null;
		if(approved==REQUEST_APPROVED_BY_FINANCE) {
			approvedStr = "approved";
		}else if(approved==REQUEST_REJECTED_BY_FINANCE){ 
			approvedStr = "rejected";
		}

		StringBuilder emailBody = new StringBuilder("Your travel request with id:").append(getId()).append(" has been ");
		emailBody.append(approvedStr)/*.append( with the following comments:")*/;
		emailBody.append(". Please click this url to see the details of your request:");
		emailBody.append(" http://localhost:8080/travel/summary/employee/").append(getId());
		System.out.println("\nMessage\n\n"+emailBody.toString());
		return emailBody.toString();
	}
	
	public String getEmailSubjectForEmployeeTravelDeskApproved(String approved) {
		String approvedStr = null;
		if(approved.equals(REQUEST_APPROVED_BY_FINANCE)) {
			approvedStr = "approved";
		}else if(approved.equals(REQUEST_REJECTED_BY_FINANCE)){ 
			approvedStr = "rejected";
		}

		StringBuilder emailHeader = new StringBuilder("Travel Request ").append(approvedStr).append(" for Id:"+getId());
		return emailHeader.toString();
	}

	public String getEmailBodyForTravelDesk() {
		StringBuilder emailBody = new StringBuilder("A new Travel request is awaiting for your approval. Please click this url to work on this request:");
		emailBody.append(" http://localhost:8080/travel/summary/finance/").append(getId());
		System.out.println("\nMessage\n\n"+emailBody.toString());
		return emailBody.toString();
	}
	
	public String getEmailSubjectForTravelDesk() {
		StringBuilder emailBody = new StringBuilder("Travel request Id ").append(getId()).append(" waiting for your action");
		return emailBody.toString();
	}
}
