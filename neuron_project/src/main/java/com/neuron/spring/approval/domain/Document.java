package com.neuron.spring.approval.domain;

import java.io.BufferedReader;
import java.sql.Clob;
import java.sql.Date;

import com.neuron.spring.employee.domain.Employee;

public class Document {
	private int docNo;
	private int docWriterNo;
	private String docKind;
	private String docContents;
	private String docStatus;
	private String docReason;
	private Date dCreateDate;
	private Date dUpdateDate;
	private Date vStartDate;
	private Date vEndDate;
	private String vacKind;
	private Employee docWriter;
	

	
	public Document() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public String getVacKind() {
		return vacKind;
	}


	public void setVacKind(String vacKind) {
		this.vacKind = vacKind;
	}
	public int getDocNo() {
		return docNo;
	}
	public void setDocNo(int docNo) {
		this.docNo = docNo;
	}
	public int getDocWriterNo() {
		return docWriterNo;
	}
	public void setDocWriterNo(int docWriterNo) {
		this.docWriterNo = docWriterNo;
	}
	public String getDocKind() {
		return docKind;
	}
	public void setDocKind(String docKind) {
		this.docKind = docKind;
	}

	public String getDocContents() {
		return docContents;
	}

	public void setDocContents(String docContents) {
		this.docContents = docContents;
	}

	public String getDocStatus() {
		return docStatus;
	}
	public void setDocStatus(String docStatus) {
		this.docStatus = docStatus;
	}
	public String getDocReason() {
		return docReason;
	}
	public void setDocReason(String docReason) {
		this.docReason = docReason;
	}
	public Date getdCreateDate() {
		return dCreateDate;
	}
	public void setdCreateDate(Date dCreateDate) {
		this.dCreateDate = dCreateDate;
	}
	public Date getdUpdateDate() {
		return dUpdateDate;
	}
	public void setdUpdateDate(Date dUpdateDate) {
		this.dUpdateDate = dUpdateDate;
	}
	public Date getvStartDate() {
		return vStartDate;
	}
	public void setvStartDate(Date vStartDate) {
		this.vStartDate = vStartDate;
	}
	public Date getvEndDate() {
		return vEndDate;
	}
	public void setvEndDate(Date vEndDate) {
		this.vEndDate = vEndDate;
	}
	public Employee getDocWriter() {
		return docWriter;
	}
	public void setDocWriter(Employee docWriter) {
		this.docWriter = docWriter;
	}

	@Override
	public String toString() {
		return "Document [docNo=" + docNo + ", docWriterNo=" + docWriterNo + ", docKind=" + docKind + ", docContents="
				+ docContents + ", docStatus=" + docStatus + ", docReason=" + docReason + ", dCreateDate=" + dCreateDate
				+ ", dUpdateDate=" + dUpdateDate + ", vStartDate=" + vStartDate + ", vEndDate=" + vEndDate
				+ ", vacKind=" + vacKind + ", docWriter=" + docWriter + "]";
	}
	

	
}
