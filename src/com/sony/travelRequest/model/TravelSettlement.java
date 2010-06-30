package com.sony.travelRequest.model;

import java.util.ArrayList;
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
	private List<AdvanceAmount> advanceAmounts = new ArrayList<AdvanceAmount>();
	private List<Expense> lodgingExpenses = new ArrayList<Expense>();
	private List<Expense> travelingDailyAllowanceExpenses = new ArrayList<Expense>();
	private List<Expense> conveyanceExpenses = new ArrayList<Expense>();
	private List<Expense> othersExpenses = new ArrayList<Expense>();
	private List<Expense> entertainmentExpenses = new ArrayList<Expense>();
	private List<Expense> miscellaneousExpenses = new ArrayList<Expense>();
	private float totalAdvanceAmount;
//	private float totalAdvanceAmountINR;
	private float totalLodgingExpenses;
	private float totalLodgingExpensesINR;
	private float totalTravellingExpenses;
	private float totalTravellingExpensesINR;
	private float totalConveyanceExpenses;
	private float totalConveyanceExpensesINR;
	private float totalOtherExpenses;
	private float totalOtherExpensesINR;
	private float totalEntertainmentExpenses;
	private float totalEntertainmentExpensesINR;
	private float totalMiscellaneousExpenses;
	private float totalMiscellaneousExpensesINR;
	private float totalOfAllExpenses;
//	private float totalOfAllExpensesINR;
//	private float totalFinalDifferenceINR;
	private boolean disableAdvanceTableRowDelete;
	private boolean disableLodgingTableRowDelete;
	private boolean disableConveyanceTableRowDelete;
	private boolean disableOthersTableRowDelete;
	private boolean disableEntertainmentTableRowDelete;
	private boolean disableMiscellaneousTableRowDelete;
	
	
	TravelSettlement(){
		
		
		advanceAmounts.add(new AdvanceAmount());
		lodgingExpenses.add(new Expense());
		travelingDailyAllowanceExpenses.add(new Expense());
		conveyanceExpenses.add(new Expense());
		othersExpenses.add(new Expense());
		entertainmentExpenses.add(new Expense());
		miscellaneousExpenses.add(new Expense());
		
		disableAdvanceTableRowDelete=true;
		disableLodgingTableRowDelete=true;
		disableConveyanceTableRowDelete=true;
		disableOthersTableRowDelete=true;
		disableEntertainmentTableRowDelete=true;
		disableMiscellaneousTableRowDelete=true;
	}
	
	
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
	public List<Expense> getLodgingExpenses() {
		return lodgingExpenses;
	}
	public void setLodgingExpenses(List<Expense> lodgingExpenses) {
		this.lodgingExpenses = lodgingExpenses;
	}
	public List<Expense> getTravelingDailyAllowanceExpenses() {
		return travelingDailyAllowanceExpenses;
	}
	public void setTravelingDailyAllowanceExpenses(
			List<Expense> travelingDailyAllowanceExpenses) {
		this.travelingDailyAllowanceExpenses = travelingDailyAllowanceExpenses;
	}
	public List<Expense> getConveyanceExpenses() {
		return conveyanceExpenses;
	}
	public void setConveyanceExpenses(List<Expense> conveyanceExpenses) {
		this.conveyanceExpenses = conveyanceExpenses;
	}
	public List<Expense> getOthersExpenses() {
		return othersExpenses;
	}
	public void setOthersExpenses(List<Expense> othersExpenses) {
		this.othersExpenses = othersExpenses;
	}
	public List<Expense> getEntertainmentExpenses() {
		return entertainmentExpenses;
	}
	public void setEntertainmentExpenses(
			List<Expense> entertainmentExpenses) {
		this.entertainmentExpenses = entertainmentExpenses;
	}
	public List<Expense> getMiscellaneousExpenses() {
		return miscellaneousExpenses;
	}
	public void setMiscellaneousExpenses(
			List<Expense> miscellaneousExpenses) {
		this.miscellaneousExpenses = miscellaneousExpenses;
	}
	
	
	public float getTotalAdvanceAmount() {
		return totalAdvanceAmount;
	}
	public void setTotalAdvanceAmount(float totalAdvanceAmount) {
		this.totalAdvanceAmount = totalAdvanceAmount;
	}
	/*public float getTotalAdvanceAmountINR() {
		return totalAdvanceAmountINR;
	}
	public void setTotalAdvanceAmountINR(float totalAdvanceAmountINR) {
		this.totalAdvanceAmountINR = totalAdvanceAmountINR;
	}
	*/
	public float getTotalLodgingExpenses() {
		return totalLodgingExpenses;
	}
	public void setTotalLodgingExpenses(float totalLodgingExpenses) {
		this.totalLodgingExpenses = totalLodgingExpenses;
	}
	public float getTotalLodgingExpensesINR() {
		return totalLodgingExpensesINR;
	}
	public void setTotalLodgingExpensesINR(float totalLodgingExpensesINR) {
		this.totalLodgingExpensesINR = totalLodgingExpensesINR;
	}
	
	public float getTotalTravellingExpenses() {
		return totalTravellingExpenses;
	}
	public void setTotalTravellingExpenses(float totalTravellingExpenses) {
		this.totalTravellingExpenses = totalTravellingExpenses;
	}
	public float getTotalTravellingExpensesINR() {
		return totalTravellingExpensesINR;
	}
	public void setTotalTravellingExpensesINR(float totalTravellingExpensesINR) {
		this.totalTravellingExpensesINR = totalTravellingExpensesINR;
	}
	
	public float getTotalConveyanceExpenses() {
		return totalConveyanceExpenses;
	}
	public void setTotalConveyanceExpenses(float totalConveyanceExpenses) {
		this.totalConveyanceExpenses = totalConveyanceExpenses;
	}
	public float getTotalConveyanceExpensesINR() {
		return totalConveyanceExpensesINR;
	}
	public void setTotalConveyanceExpensesINR(float totalConveyanceExpensesINR) {
		this.totalConveyanceExpensesINR = totalConveyanceExpensesINR;
	}
	
	public float getTotalOtherExpenses() {
		return totalOtherExpenses;
	}
	public void setTotalOtherExpenses(float totalOtherExpenses) {
		this.totalOtherExpenses = totalOtherExpenses;
	}
	public float getTotalOtherExpensesINR() {
		return totalOtherExpensesINR;
	}
	public void setTotalOtherExpensesINR(float totalOtherExpensesINR) {
		this.totalOtherExpensesINR = totalOtherExpensesINR;
	}
	
	public float getTotalEntertainmentExpenses() {
		return totalEntertainmentExpenses;
	}
	public void setTotalEntertainmentExpenses(float totalEntertainmentExpenses) {
		this.totalEntertainmentExpenses = totalEntertainmentExpenses;
	}
	public float getTotalEntertainmentExpensesINR() {
		return totalEntertainmentExpensesINR;
	}
	public void setTotalEntertainmentExpensesINR(float totalEntertainmentExpensesINR) {
		this.totalEntertainmentExpensesINR = totalEntertainmentExpensesINR;
	}
	
	public float getTotalMiscellaneousExpenses() {
		return totalMiscellaneousExpenses;
	}
	public void setTotalMiscellaneousExpenses(float totalMiscellaneousExpenses) {
		this.totalMiscellaneousExpenses = totalMiscellaneousExpenses;
	}
	public float getTotalMiscellaneousExpensesINR() {
		return totalMiscellaneousExpensesINR;
	}
	public void setTotalMiscellaneousExpensesINR(float totalMiscellaneousExpensesINR) {
		this.totalMiscellaneousExpensesINR = totalMiscellaneousExpensesINR;
	}
	
	
	public float getTotalOfAllExpenses() {
		return totalOfAllExpenses;
	}
	public void setTotalOfAllExpenses(float totalOfAllExpenses) {
		this.totalOfAllExpenses = totalOfAllExpenses;
	}
	/*public float getTotalOfAllExpensesINR() {
		return totalOfAllExpensesINR;
	}
	public void setTotalOfAllExpensesINR(float totalOfAllExpensesINR) {
		this.totalOfAllExpensesINR = totalOfAllExpensesINR;
	}
	
	public float getTotalFinalDifferenceINR() {
		return totalFinalDifferenceINR;
	}
	public void setTotalFinalDifferenceINR(float totalFinalDifferenceINR) {
		this.totalFinalDifferenceINR = totalFinalDifferenceINR;
	}*/
	
	
	public void addAdvanceTableRow() {
		advanceAmounts.add(new AdvanceAmount());
		System.out.println("\nInside add row\n");
	}
	
	public void addLodgingTableRow() {
		lodgingExpenses.add(new Expense());
	}
	
	public void addConveyanceTableRow() {
		conveyanceExpenses.add(new Expense());
	}
	
	public void addOthersTableRow() {
		othersExpenses.add(new Expense());
	}
	
	public void addEntertainmentTableRow() {
		entertainmentExpenses.add(new Expense());
	}
	
	public void addMiscellaneousTableRow() {
		miscellaneousExpenses.add(new Expense());
	}
	
	
	
	public boolean getDisableAdvanceTableRowDelete() {
		return disableAdvanceTableRowDelete;
	}

	public void setDisableAdvanceTableRowDelete(boolean disableAdvanceTableRowDelete) {
		this.disableAdvanceTableRowDelete = disableAdvanceTableRowDelete;
	}
	
	public boolean getDisableLodgingTableRowDelete() {
		return disableLodgingTableRowDelete;
	}

	public void setDisableLodgingTableRowDelete(boolean disableLodgingTableRowDelete) {
		this.disableLodgingTableRowDelete = disableLodgingTableRowDelete;
	}
	
	public boolean getDisableConveyanceTableRowDelete() {
		return disableConveyanceTableRowDelete;
	}

	public void setDisableConveyanceTableRowDelete(boolean disableConveyanceTableRowDelete) {
		this.disableConveyanceTableRowDelete = disableConveyanceTableRowDelete;
	}
	
	public boolean getDisableOthersTableRowDelete() {
		return disableOthersTableRowDelete;
	}

	public void setDisableOthersTableRowDelete(boolean disableOthersTableRowDelete) {
		this.disableOthersTableRowDelete = disableOthersTableRowDelete;
	}
	
	public boolean getDisableEntertainmentTableRowDelete() {
		return disableEntertainmentTableRowDelete;
	}

	public void setDisableEntertainmentTableRowDelete(boolean disableEntertainmentTableRowDelete) {
		this.disableEntertainmentTableRowDelete = disableEntertainmentTableRowDelete;
	}
	
	public boolean getDisableMiscellaneousTableRowDelete() {
		return disableMiscellaneousTableRowDelete;
	}

	public void setDisableMiscellaneousTableRowDelete(boolean disableMiscellaneousTableRowDelete) {
		this.disableMiscellaneousTableRowDelete = disableMiscellaneousTableRowDelete;
	}
}
