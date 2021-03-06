package com.sony.travelRequest.util;

public interface RequestStatus {
	String REQUEST_INITIATED_BY_EMPLOYEE="REQUEST_INITIATED_BY_EMPLOYEE";
	String REQUEST_APPROVED_BY_FINANCE = "REQUEST_APPROVED_BY_FINANCE"; 
	String REQUEST_REJECTED_BY_FINANCE ="REQUEST_REJECTED_BY_FINANCE";
	String REQUEST_APPROVED_BY_TRAVEL="REQUEST_APPROVED_BY_TRAVEL";
	String REQUEST_REJECTED_BY_TRAVEL="REQUEST_REJECTED_BY_TRAVEL";
	String SETTLEMENT_INITIATED_BY_FINANCE="SETTLEMENT_INITIATED_BY_FINANCE";
	String SETTLEMENT_FILLED_BY_EMPLOYEE="SETTLEMENT_FILLED_BY_EMPLOYEE";
	String SETTLEMENT_APPROVED_BY_FINANCE="SETTLEMENT_APPROVED_BY_FINANCE";
	String SETTLEMENT_REJECTED_BY_FINANCE="SETTLEMENT_REJECTED_BY_FINANCE";
}
