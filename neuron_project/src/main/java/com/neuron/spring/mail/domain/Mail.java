package com.neuron.spring.mail.domain;

import java.util.Date;

public class Mail {
	private int mailNo;
	private String mailTitle;
	private String mailContents;
	private String senderId;
	private String receiverId;
	private String receiverId2;
	private Date sendTime;
	private Date readTime;
	private String mailFileName;
	private long mailFileSize;
	private String readYn;
	private String sStatus;
	private String rStatus;
	
	public Mail () {}

	public Mail(int mailNo, String mailTitle, String mailContents, String senderId, String receiverId,
			String receiverId2, Date sendTime, Date readTime, String mailFileName, long mailFileSize, String readYn,
			String sStatus, String rStatus) {
		super();
		this.mailNo = mailNo;
		this.mailTitle = mailTitle;
		this.mailContents = mailContents;
		this.senderId = senderId;
		this.receiverId = receiverId;
		this.receiverId2 = receiverId2;
		this.sendTime = sendTime;
		this.readTime = readTime;
		this.mailFileName = mailFileName;
		this.mailFileSize = mailFileSize;
		this.readYn = readYn;
		this.sStatus = sStatus;
		this.rStatus = rStatus;
	}

	public int getMailNo() {
		return mailNo;
	}

	public void setMailNo(int mailNo) {
		this.mailNo = mailNo;
	}

	public String getMailTitle() {
		return mailTitle;
	}

	public void setMailTitle(String mailTitle) {
		this.mailTitle = mailTitle;
	}

	public String getMailContents() {
		return mailContents;
	}

	public void setMailContents(String mailContents) {
		this.mailContents = mailContents;
	}

	public String getSenderId() {
		return senderId;
	}

	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}

	public String getReceiverId() {
		return receiverId;
	}

	public void setReceiverId(String receiverId) {
		this.receiverId = receiverId;
	}

	public String getReceiverId2() {
		return receiverId2;
	}

	public void setReceiverId2(String receiverId2) {
		this.receiverId2 = receiverId2;
	}

	public Date getSendTime() {
		return sendTime;
	}

	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}

	public Date getReadTime() {
		return readTime;
	}

	public void setReadTime(Date readTime) {
		this.readTime = readTime;
	}

	public String getMailFileName() {
		return mailFileName;
	}

	public void setMailFileName(String mailFileName) {
		this.mailFileName = mailFileName;
	}

	public long getMailFileSize() {
		return mailFileSize;
	}

	public void setMailFileSize(long mailFileSize) {
		this.mailFileSize = mailFileSize;
	}

	public String getReadYn() {
		return readYn;
	}

	public void setReadYn(String readYn) {
		this.readYn = readYn;
	}

	public String getsStatus() {
		return sStatus;
	}

	public void setsStatus(String sStatus) {
		this.sStatus = sStatus;
	}

	public String getrStatus() {
		return rStatus;
	}

	public void setrStatus(String rStatus) {
		this.rStatus = rStatus;
	}

	@Override
	public String toString() {
		return "Mail [mailNo=" + mailNo + ", mailTitle=" + mailTitle + ", mailContents=" + mailContents + ", senderId="
				+ senderId + ", receiverId=" + receiverId + ", receiverId2=" + receiverId2 + ", sendTime=" + sendTime
				+ ", readTime=" + readTime + ", mailFileName=" + mailFileName + ", mailFileSize=" + mailFileSize
				+ ", readYn=" + readYn + ", sStatus=" + sStatus + ", rStatus=" + rStatus + "]";
	}


	
}
