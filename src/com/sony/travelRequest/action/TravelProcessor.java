//
//
//  Generated by StarUML(tm) Java Add-In
//
//  @ Project : Untitled
//  @ File Name : TravelProcessor.java
//  @ Date : 09-04-2010
//  @ Author : 
//
//

package com.sony.travelRequest.action;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.event.AbortProcessingException;
import javax.faces.event.ActionEvent;
import javax.faces.event.ValueChangeEvent;

import org.springframework.context.support.GenericApplicationContext;
import org.springframework.web.context.support.GenericWebApplicationContext;
import org.springframework.web.jsf.FacesContextUtils;

import com.ocpsoft.pretty.util.FacesElUtils;
import com.sony.travelRequest.dao.TravelRequestDao;
import com.sony.travelRequest.model.Allowance;
import com.sony.travelRequest.model.EmailConstants;
import com.sony.travelRequest.model.HotelResv;
import com.sony.travelRequest.model.RequestApproval;
import com.sony.travelRequest.model.TravelDetails;
import com.sony.travelRequest.model.TravelParamBean;
import com.sony.travelRequest.model.TravelRequest;
import com.sony.travelRequest.model.TravelResv;
import com.sony.travelRequest.util.EmailComponent;

public class TravelProcessor {

	private TravelRequest travelRequest;
	private TravelRequestDao travelRequestDao;
	private String focusField;
	private String focusFieldSize;
	private EmailComponent emailComponent;
	private TravelParamBean travelParamBean;
	private String countryClassA[]={"Japan","Europe","Russia","USA","UK","Canada"};
	private String countryClassB[]={"North America ex. USA & Canada","South America","Australia","New Zealand","Middle-East/Gulf Countries"};
	private String countryClassC[]={"Singapore","HongKong","Malaysia","Thailand","Phillipines","Indonesia","Vietnam","China","South Korea","Taiwan","North Korea","SAARC Countries","Afghanistan","Africa"};
	
	public TravelProcessor() {
		focusField = "travel";
		focusFieldSize = "0";
	}

	public TravelRequestDao getTravelRequestDao() {
		return travelRequestDao;
	}

	public void setTravelRequestDao(TravelRequestDao travelRequestDao) {
		this.travelRequestDao = travelRequestDao;
	}

	public String getFocusField() {
		return focusField;
	}

	public void setFocusField(String focusField) {
		this.focusField = focusField;
	}

	public String getFocusFieldSize() {
		return focusFieldSize;
	}

	public void setFocusFieldSize(String focusFieldSize) {
		this.focusFieldSize = focusFieldSize;
	}

	public TravelRequest getTravelRequest() {
		return travelRequest;
	}

	public void setTravelRequest(TravelRequest travelRequest) {
		this.travelRequest = travelRequest;
	}
	
	public String errorInvalidReqId() {
		System.out.println("Invalid request Id");
		return print();
	}

	public String errorInvalidRole() {
		System.out.println("Invalid role Id");
		return print();
	}
	
	public char findClass(String country)
	{
		for(int i=0;i<countryClassA.length;i++)
		{
			if(countryClassA[i].equals(country))
			{
				return 'A';
			}
		}
		for(int i=0;i<countryClassB.length;i++)
		{
			if(countryClassB[i].equals(country))
			{
				return 'B';
			}
		}
		for(int i=0;i<countryClassC.length;i++)
		{
			if(countryClassC[i].equals(country))
			{
				return 'C';
			}
		}
		return 'X';
	}
	
	//business or economy
	public void findClass()
	{
		String grade=travelRequest.getEmployee().getGrade().trim();
		if(grade.equals("SM2") || grade.equals("SM3"))
		{
			//travelRequest.getTravelResv().
		}
	}
	
	public void processAllowance() {
		String grade=travelRequest.getEmployee().getGrade().trim();
		float dailyAllowance=0;
		if(travelRequest.getType().trim().equals("international"))
		{
			switch(findClass(travelRequest.getCountry().trim()))
			{
				case 'A':	
				if(grade.equals("SM3"))
					dailyAllowance=80;	
				else if(grade.equals("SM2"))
					dailyAllowance=70;
				else if(grade.equals("SM1") || grade.equals("M3")|| grade.equals("M4"))
					dailyAllowance=60;
				else if(grade.equals("M2") || grade.equals("M1"))
					dailyAllowance=50;	
				break;
				
				case 'B':
				if(grade.equals("SM3"))
					dailyAllowance=55;	
				else if(grade.equals("SM2"))
					dailyAllowance=50;
				else if(grade.equals("SM1") || grade.equals("M3")|| grade.equals("M4"))
					dailyAllowance=45;
				else if(grade.equals("M2") || grade.equals("M1"))
					dailyAllowance=40;	
				break;
			
				case 'C':
				if(grade.equals("SM3"))
					dailyAllowance=50;	
				else if(grade.equals("SM2"))
					dailyAllowance=40;
				else if(grade.equals("SM1") || grade.equals("M3")|| grade.equals("M4"))
					dailyAllowance=35;
				else if(grade.equals("M2") || grade.equals("M1"))
					dailyAllowance=30;	
				break;
			}
		}
		
		//domestic
		else
		{
			if(grade.equals("SM3") || grade.equals("SM2") || grade.equals("SM1"))
				dailyAllowance=1000;	
			else if(grade.equals("M3") || grade.equals("M4"))
				dailyAllowance=800;
			else if(grade.equals("M1") || grade.equals("M2"))
				dailyAllowance=600;	
		}
		travelRequest.getTravelDetails().getAllowance().setDailyAllowance(dailyAllowance);
		//total allowances
		
	}

	public void enableFields1(ValueChangeEvent event)throws AbortProcessingException {
		travelRequest.setDisable1(false);
	}
	
	public void enableFields2(ValueChangeEvent event)throws AbortProcessingException {
		travelRequest.setDisable2(false);
	}
	
	public String print() {
		System.out.println("In waeqwe");
		if (travelRequest.getDate() == null
				|| travelRequest.getEmployee().getName().trim().equals("")
				|| travelRequest.getEmployee().getUnit() == null
				|| travelRequest.getEmployee().getDesignation() == null
				|| travelRequest.getEmployee().getEmailId() == null
				|| travelRequest.getEmployee().getDepartment() == null
				|| travelRequest.getEmployee().getProjectName() == null
				|| travelRequest.getEmployee().getMobileNumber() == null
				|| travelRequest.getTravelDetails().getPurpose() == null
				|| travelRequest.getTravelDetails().getStartDate() == null
				|| travelRequest.getTravelDetails().getEndDate() == null
				|| travelRequest.getType() == null
				|| travelRequest.getEmployee().getGrade() == null
				/*|| travelRequest.getTravelDetails().getAllowance().getDays() == 0
				|| travelRequest.getTravelDetails().getAllowance()
						.getPerDayAllowance() == 0
				|| travelRequest.getTravelDetails().getAllowance()
						.getDailyAllowance() == 0
				|| travelRequest.getTravelDetails().getAllowance()
						.getMiscAllowance() == 0*/) {
			FacesContext.getCurrentInstance().addMessage(
					"travelForm:initiator",
					new FacesMessage("Invalid inputs", "Invalid inputs"));
			return "invalid";
		}
		Iterator itr = travelRequest.getTravelResv().iterator();

		while (itr.hasNext()) {
			TravelResv resv1 = (TravelResv) itr.next();
			if (resv1.getTravelDate() == null || resv1.getTravelFrom() == null
					|| resv1.getTravelTo() == null
					|| resv1.getModeType() == null
					|| resv1.getClassType() == null
					|| resv1.getDepTime() == null || resv1.getArrTime() == null
					|| resv1.getAmount() == 0) {
				FacesContext.getCurrentInstance().addMessage(
						"travelForm:initiator",
						new FacesMessage("Invalid travel inputs",
								"Invalid travel inputs"));
				return "invalid";
			}
		}

		itr = travelRequest.getHotelResv().iterator();

		while (itr.hasNext()) {
			HotelResv resv2 = (HotelResv) itr.next();
			if (resv2.getPlace() == null || resv2.getCheckIn() == null
					|| resv2.getCheckOut() == null || resv2.getName() == null
					|| resv2.getAmount() == 0) {
				FacesContext.getCurrentInstance().addMessage(
						"travelForm:initiator",
						new FacesMessage("Invalid hotel inputs",
								"Invalid hotel inputs"));
				return "invalid";
			}
		}

		System.out.println("hello.... hi "
				+ travelRequest.getDate()
				+ " "
				+ travelRequest.getEmployee().getName()
				+ " "
				+ travelRequest.getEmployee().getDesignation()
				+ " "
				+ travelRequest.getEmployee().getEmailId()
				+ " "
				+ travelRequest.getEmployee().getTelephoneExt()
				+ " "
				+ travelRequest.getEmployee().getDepartment()
				+ " "
				+ travelRequest.getTravelDetails().getPurpose()
				+ " "
				+ travelRequest.getTravelDetails().getStartDate()
				+ " "
				+ travelRequest.getTravelDetails().getEndDate()
				+ " "
				+ travelRequest.getType()
				+ " "
				+ travelRequest.getEmployee().getGrade()
				+ " "
				+ travelRequest.getTravelDetails().getAllowance().getDays()
				+ " "
				+ travelRequest.getTravelDetails().getAllowance()
						.getPerDayAllowance()
				+ " "
				+ travelRequest.getTravelDetails().getAllowance()
						.getDailyAllowance()
				+ " "
				+ travelRequest.getTravelDetails().getAllowance()
						.getMiscAllowance() + " ");

		itr = travelRequest.getTravelResv().iterator();

		while (itr.hasNext()) {
			TravelResv resv1 = (TravelResv) itr.next();
			System.out.println("travel .... " + resv1.getTravelDate() + " "
					+ resv1.getTravelFrom() + " " + resv1.getTravelTo() + " "
					+ resv1.getModeType() + " " + resv1.getClassType() + " "
					+ resv1.getDepTime() + " " + resv1.getArrTime() + " "
					+ resv1.getAmount() + " ");
		}

		itr = travelRequest.getHotelResv().iterator();

		while (itr.hasNext()) {
			HotelResv resv2 = (HotelResv) itr.next();
			System.out.println("hotel .... " + resv2.getPlace() + " "
					+ resv2.getCheckIn() + " " + resv2.getCheckOut() + " "
					+ resv2.getName() + " " + resv2.getAmount() + " ");
		}

		RequestApproval approval = new RequestApproval();
		approval.setApprovorType("finance");
		travelRequest.getRequestApprovals().add(approval);
		processAllowance();
		float amount = (float) (
				travelRequest.getTravelDetails().getAllowance()
						.getDailyAllowance() )
				* travelRequest.getTravelDetails().getAllowance().getDays()+travelRequest.getTravelDetails().getAllowance()
				.getPerDayAllowance()+ travelRequest.getTravelDetails()
				.getAllowance().getMiscAllowance();

		itr = travelRequest.getTravelResv().iterator();
		while (itr.hasNext()) {
			TravelResv resv1 = (TravelResv) itr.next();
			amount += resv1.getAmount();
		}

		if (travelRequest.getPayment().equals("company")) {
			itr = travelRequest.getHotelResv().iterator();
			while (itr.hasNext()) {
				HotelResv resv2 = (HotelResv) itr.next();
				amount += resv2.getAmount();
			}
		}
		travelRequest.setAmount(amount);

		travelRequestDao.persist(travelRequest);
		travelRequest.setControl(true);

		boolean processSuccess = true;

		if (processSuccess) {
			System.out.println("Sending email");
			sendEmailForRequestInitiation();
		}

		// Send email
		
		return "result";
	}

	public String financeAccept() {
		setFinanceRequestApproval(Boolean.TRUE);
		travelRequestDao.persist(travelRequest);
		return "travelSummary";
	}

	public String financeReject() {
		setFinanceRequestApproval(Boolean.FALSE);
		travelRequestDao.persist(travelRequest);
		return "travelSummary";
	}

	private void setFinanceRequestApproval(Boolean val) {
		travelRequest.setShowTravelApproval(false);
		RequestApproval financeApproval = null;
		if (travelRequest.getRequestApprovals() != null) {
			for (RequestApproval approval : travelRequest.getRequestApprovals()) {
				if (approval != null
						&& "finance".equals(approval.getApprovorType())) {
					financeApproval = approval;
				}
			}
			if (financeApproval != null) {
				financeApproval.setApproved(val);
				financeApproval.setProcessed(Boolean.TRUE);
				sendEmailForRequesrApproved(financeApproval);
			}
		}
	}

	private void sendEmailForRequestInitiation() {
		// 1. Send email to employee
		List<String> emailIds = new ArrayList<String>();
		emailIds.add(travelRequest.getEmployee().getEmailId());
		this.emailComponent.sendMails(emailIds, travelRequest
				.getEmailSubjectForEmployeeInitiation(), travelRequest
				.getEmailBodyForEmployeeInitiation());
		// 2. Send email to Travel Desk
		emailIds = new ArrayList<String>();
		emailIds.add(EmailConstants.FINANCE_DESK_EMAIL);
		this.emailComponent.sendMails(emailIds, travelRequest
				.getEmailSubjectForTravelDesk(), travelRequest
				.getEmailBodyForTravelDesk());
	}

	private void sendEmailForRequesrApproved(RequestApproval financeApproval) {
		// 1. Send email to employee
		List<String> emailIds = new ArrayList<String>();
		emailIds.add(travelRequest.getEmployee().getEmailId());
		this.emailComponent.sendMails(emailIds, travelRequest
				.getEmailSubjectForEmployeeTravelDeskApproved(financeApproval
						.getApproved()), travelRequest
				.getEmailBodyForEmployeeTravelDeskApproved(financeApproval
						.getApproved(), financeApproval.getComments()));
	}

	public void submit() {

	}

	public void sendMail() {

	}

	public String sendReqId() {
		System.out.println(" Inside TravelProcessor");
		System.out.println("TravelParamBean is null:"+travelParamBean);

		// travelRequestDao.findById(reqId);
		System.out.println("TravelParamBean: role"+travelParamBean.getRole());
		System.out.println("TravelParamBean: reqId"+travelParamBean.getReqId());
		travelRequest = travelRequestDao.findById(travelParamBean.getReqId());
		new FacesElUtils().setValue(FacesContext.getCurrentInstance(), "#{travelRequest}", travelRequest);
		return "travelSummary";

	}

	public void addTravelResvRow() {

		travelRequest.addTravelResvRow();
		focusField = "travel";
		int size = travelRequest.getTravelResv().size() - 1;
		focusFieldSize = "" + size;
	}

	public void addHotelResvRow() {

		travelRequest.addHotelResvRow();
		focusField = "hotel";
		int size = travelRequest.getHotelResv().size() - 1;
		focusFieldSize = "" + size;
	}

	public EmailComponent getEmailComponent() {
		return emailComponent;
	}

	public void setEmailComponent(EmailComponent emailComponent) {
		this.emailComponent = emailComponent;
	}

	public TravelParamBean getTravelParamBean() {
		return travelParamBean;
	}

	public void setTravelParamBean(TravelParamBean travelParamBean) {
		this.travelParamBean = travelParamBean;
	}

}
