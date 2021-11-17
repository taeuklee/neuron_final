package com.neuron.spring.mail.domain;

public class MailAttach {
	private int mfileNo;
	private int mailNo;
	private String mfileName;
	private int mfileSize;
	private String mfilePath;
	
	public MailAttach() {}

	public MailAttach(int mfileNo, int mailNo, String mfileName, int mfileSize, String mfilePath) {
		super();
		this.mfileNo = mfileNo;
		this.mailNo = mailNo;
		this.mfileName = mfileName;
		this.mfileSize = mfileSize;
		this.mfilePath = mfilePath;
	}

	public int getMfileNo() {
		return mfileNo;
	}

	public void setMfileNo(int mfileNo) {
		this.mfileNo = mfileNo;
	}

	public int getMailNo() {
		return mailNo;
	}

	public void setMailNo(int mailNo) {
		this.mailNo = mailNo;
	}

	public String getMfileName() {
		return mfileName;
	}

	public void setMfileName(String mfileName) {
		this.mfileName = mfileName;
	}

	public int getMfileSize() {
		return mfileSize;
	}

	public void setMfileSize(int mfileSize) {
		this.mfileSize = mfileSize;
	}

	public String getMfilePath() {
		return mfilePath;
	}

	public void setMfilePath(String mfilePath) {
		this.mfilePath = mfilePath;
	}

	@Override
	public String toString() {
		return "Attach [mfileNo=" + mfileNo + ", mailNo=" + mailNo + ", mfileName=" + mfileName + ", mfileSize="
				+ mfileSize + ", mfilePath=" + mfilePath + "]";
	}
	
	
}
