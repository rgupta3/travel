//
//
//  Generated by StarUML(tm) Java Add-In
//
//  @ Project : Untitled
//  @ File Name : RequestApprovals.java
//  @ Date : 09-04-2010
//  @ Author : 
//
//

package com.sony.travelRequest.model;
import java.util.Date;

import com.sony.travelRequest.util.*;

public class RequestApproval {

	private String status;
	private String comments;
	private String approvorType;
	private Date timestamp;

	public Date getTimestamp()
	{
		return this.timestamp;
	}
	public void setTimestamp(Date timestamp)
	{
		this.timestamp = timestamp;
	}
	public String getStatus() {
		return this.status;
	}
	public void setStatus(String status){
		this.status = status;
	}
	
	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getApprovorType() {
		return approvorType;
	}

	public void setApprovorType(String approvorType) {
		this.approvorType = approvorType;
	}

}
