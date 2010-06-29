package com.sony.travelRequest.model;

import java.util.Date;
import java.util.List;

public class TravelSettlement {

	private int id;
	private Date departureDate;
	private Date arrivalDate;
	private int noOfDays;
	private Date submissionDate;
	private float advanceTaken;
	private float totlaExpenses;
	private float difference;
	private List<AdvanceAmount> advanceAmounts;
	private List<LodgingExpense> lodgingExpenses;
	private TravelingDailyAllowanceExpense travelingDailyAllowanceExpenses;
	private List<ConveyanceExpense> conveyanceExpenses;
	private List<OthersExpense> othersExpenses;
	private List<EntertainmentExpense> entertainmentExpenses;
	private List<MiscellaneousExpense> miscellaneousExpenses;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getDepartureDate() {
		return departureDate;
	}
	public void setDepartureDate(Date departureDate) {
		this.departureDate = departureDate;
	}
	public Date getArrivalDate() {
		return arrivalDate;
	}
	public void setArrivalDate(Date arrivalDate) {
		this.arrivalDate = arrivalDate;
	}
	public int getNoOfDays() {
		return noOfDays;
	}
	public void setNoOfDays(int noOfDays) {
		this.noOfDays = noOfDays;
	}
	public Date getSubmissionDate() {
		return submissionDate;
	}
	public void setSubmissionDate(Date submissionDate) {
		this.submissionDate = submissionDate;
	}
	public float getAdvanceTaken() {
		return advanceTaken;
	}
	public void setAdvanceTaken(float advanceTaken) {
		this.advanceTaken = advanceTaken;
	}
	public float getTotlaExpenses() {
		return totlaExpenses;
	}
	public void setTotlaExpenses(float totlaExpenses) {
		this.totlaExpenses = totlaExpenses;
	}
	public float getDifference() {
		return difference;
	}
	public void setDifference(float difference) {
		this.difference = difference;
	}
	public List<AdvanceAmount> getAdvanceAmounts() {
		return advanceAmounts;
	}
	public void setAdvanceAmounts(List<AdvanceAmount> advanceAmounts) {
		this.advanceAmounts = advanceAmounts;
	}
	public List<LodgingExpense> getLodgingExpenses() {
		return lodgingExpenses;
	}
	public void setLodgingExpenses(List<LodgingExpense> lodgingExpenses) {
		this.lodgingExpenses = lodgingExpenses;
	}
	public TravelingDailyAllowanceExpense getTravelingDailyAllowanceExpenses() {
		return travelingDailyAllowanceExpenses;
	}
	public void setTravelingDailyAllowanceExpenses(
			TravelingDailyAllowanceExpense travelingDailyAllowanceExpenses) {
		this.travelingDailyAllowanceExpenses = travelingDailyAllowanceExpenses;
	}
	public List<ConveyanceExpense> getConveyanceExpenses() {
		return conveyanceExpenses;
	}
	public void setConveyanceExpenses(List<ConveyanceExpense> conveyanceExpenses) {
		this.conveyanceExpenses = conveyanceExpenses;
	}
	public List<OthersExpense> getOthersExpenses() {
		return othersExpenses;
	}
	public void setOthersExpenses(List<OthersExpense> othersExpenses) {
		this.othersExpenses = othersExpenses;
	}
	public List<EntertainmentExpense> getEntertainmentExpenses() {
		return entertainmentExpenses;
	}
	public void setEntertainmentExpenses(
			List<EntertainmentExpense> entertainmentExpenses) {
		this.entertainmentExpenses = entertainmentExpenses;
	}
	public List<MiscellaneousExpense> getMiscellaneousExpenses() {
		return miscellaneousExpenses;
	}
	public void setMiscellaneousExpenses(
			List<MiscellaneousExpense> miscellaneousExpenses) {
		this.miscellaneousExpenses = miscellaneousExpenses;
	}
	
}
