package com.sony.travelRequest.model;

import org.hibernate.validator.Email;

import org.hibernate.validator.Length;

import org.hibernate.validator.Max;

import org.hibernate.validator.Min;

import org.hibernate.validator.NotEmpty;

import org.hibernate.validator.NotNull;

import org.hibernate.validator.Pattern;


public class Employee {

	private int id;
	@NotEmpty
    @Pattern(regex=".*[^\\s].*", message="Invalid Name")
	private String name;
	private String unit;
	@NotEmpty
	private String designation;	
	private String department;
	@NotEmpty
	private String projectName;
	@NotEmpty
	@Pattern(regex="^([0-9]+)*$", message="Invalid Number")
	private String telephoneExt;
	@NotEmpty
	@Pattern(regex="^([0-9]+)*$", message="Invalid Number")
	@Length(min=10,max=12)
	private String mobileNumber;
	@NotEmpty
	@Pattern(regex="^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$", message="Invalid Email")
	private String emailId;
	private String grade;
	private String projectCode;
	private String slaNumber;
	
	public String getProjectCode() {
		return projectCode;
	}
	public void setProjectCode(String projectCode) {
		this.projectCode = projectCode;
	}
	public String getSlaNumber() {
		return slaNumber;
	}
	public void setSlaNumber(String slaNumber) {
		this.slaNumber = slaNumber;
	}
	
	public Employee() {
		grade="Select";
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String destination) {
		this.designation = destination;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getTelephoneExt() {
		return telephoneExt;
	}
	public void setTelephoneExt(String telephoneExt) {
		this.telephoneExt = telephoneExt;
	}
	public String getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
}
