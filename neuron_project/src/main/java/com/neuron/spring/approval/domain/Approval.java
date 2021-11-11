package com.neuron.spring.approval.domain;

import java.sql.Date;

public class Approval {
	private int approvalNo;
	private int documentNo;
	private int approvalEmpNo;
	private String approvalType;
	private String approvalStatus;
	private String approvalOpinion;
	private Date approvalEndDate;
	private Date approvalStartDate;
	private int signFileNo;
	
	
	
	public Approval() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getApprovalNo() {
		return approvalNo;
	}
	public void setApprovalNo(int approvalNo) {
		this.approvalNo = approvalNo;
	}
	public int getDocumentNo() {
		return documentNo;
	}
	public void setDocumentNo(int documentNo) {
		this.documentNo = documentNo;
	}
	public int getApprovalEmpNo() {
		return approvalEmpNo;
	}
	public void setApprovalEmpNo(int approvalEmpNo) {
		this.approvalEmpNo = approvalEmpNo;
	}
	public String getApprovalType() {
		return approvalType;
	}
	public void setApprovalType(String approvalType) {
		this.approvalType = approvalType;
	}
	public String getApprovalStatus() {
		return approvalStatus;
	}
	public void setApprovalStatus(String approvalStatus) {
		this.approvalStatus = approvalStatus;
	}
	public String getApprovalOpinion() {
		return approvalOpinion;
	}
	public void setApprovalOpinion(String approvalOpinion) {
		this.approvalOpinion = approvalOpinion;
	}
	public Date getApprovalEndDate() {
		return approvalEndDate;
	}
	public void setApprovalEndDate(Date approvalEndDate) {
		this.approvalEndDate = approvalEndDate;
	}
	public Date getApprovalStartDate() {
		return approvalStartDate;
	}
	public void setApprovalStartDate(Date approvalStartDate) {
		this.approvalStartDate = approvalStartDate;
	}
	public int getSignFileNo() {
		return signFileNo;
	}
	public void setSignFileNo(int signFileNo) {
		this.signFileNo = signFileNo;
	}
	
	@Override
	public String toString() {
		return "Approval [approvalNo=" + approvalNo + ", documentNo=" + documentNo + ", approvalEmpNo=" + approvalEmpNo
				+ ", approvalType=" + approvalType + ", approvalStatus=" + approvalStatus + ", approvalOpinion="
				+ approvalOpinion + ", approvalEndDate=" + approvalEndDate + ", approvalStartDate=" + approvalStartDate
				+ ", signFileNo=" + signFileNo + "]";
	}
	
	
}
