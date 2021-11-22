package com.neuron.spring.main.domain;

import java.sql.Date;

public class Notice {
	
	private int noticeNo;
	private String noticeTitle;
	private String noticeContents;
	private String noticeWriter;
	private String noticeFilePath;
	private Date regDate;
	private int noticehits;
	private String noticeCategory;
	
	public Notice() {}

	public Notice(int noticeNo, String noticeTitle, String noticeContents, String noticeWriter, String noticeFilePath,
			Date regDate, int noticehits, String noticeCategory) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContents = noticeContents;
		this.noticeWriter = noticeWriter;
		this.noticeFilePath = noticeFilePath;
		this.regDate = regDate;
		this.noticehits = noticehits;
		this.noticeCategory = noticeCategory;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContents() {
		return noticeContents;
	}

	public void setNoticeContents(String noticeContents) {
		this.noticeContents = noticeContents;
	}

	public String getNoticeWriter() {
		return noticeWriter;
	}

	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}

	public String getNoticeFilePath() {
		return noticeFilePath;
	}

	public void setNoticeFilePath(String noticeFilePath) {
		this.noticeFilePath = noticeFilePath;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getNoticehits() {
		return noticehits;
	}

	public void setNoticehits(int noticehits) {
		this.noticehits = noticehits;
	}

	public String getNoticeCategory() {
		return noticeCategory;
	}

	public void setNoticeCategory(String noticeCategory) {
		this.noticeCategory = noticeCategory;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContents=" + noticeContents
				+ ", noticeWriter=" + noticeWriter + ", noticeFilePath=" + noticeFilePath + ", regDate=" + regDate
				+ ", noticehits=" + noticehits + ", noticeCategory=" + noticeCategory + "]";
	};
	
	

}
