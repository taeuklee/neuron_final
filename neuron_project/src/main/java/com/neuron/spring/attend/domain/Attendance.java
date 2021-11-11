package com.neuron.spring.attend.domain;

import java.util.Date;

public class Attendance {
	private int attendNo;
	private int empNo;
	private Date attendDate;
	private int startTime;
	private int finishTime;
	private int totalWorkhour;
	private String division;
	private String note;
	
	public Attendance() {}
	
	public Attendance(int attendNo, int empNo, Date attendDate, int startTime, int finishTime, int totalWorkhour,
			String division, String note) {
		super();
		this.attendNo = attendNo;
		this.empNo = empNo;
		this.attendDate = attendDate;
		this.startTime = startTime;
		this.finishTime = finishTime;
		this.totalWorkhour = totalWorkhour;
		this.division = division;
		this.note = note;
	}

	public int getAttendNo() {
		return attendNo;
	}

	public void setAttendNo(int attendNo) {
		this.attendNo = attendNo;
	}

	public int getEmpNo() {
		return empNo;
	}

	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}

	public Date getAttendDate() {
		return attendDate;
	}

	public void setAttendDate(Date attendDate) {
		this.attendDate = attendDate;
	}

	public int getStartTime() {
		return startTime;
	}

	public void setStartTime(int startTime) {
		this.startTime = startTime;
	}

	public int getFinishTime() {
		return finishTime;
	}

	public void setFinishTime(int finishTime) {
		this.finishTime = finishTime;
	}

	public int getTotalWorkhour() {
		return totalWorkhour;
	}

	public void setTotalWorkhour(int totalWorkhour) {
		this.totalWorkhour = totalWorkhour;
	}

	public String getDivision() {
		return division;
	}

	public void setDivision(String division) {
		this.division = division;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	@Override
	public String toString() {
		return "Attendance [attendNo=" + attendNo + ", empNo=" + empNo + ", attendDate=" + attendDate + ", startTime="
				+ startTime + ", finishTime=" + finishTime + ", totalWorkhour=" + totalWorkhour + ", division="
				+ division + ", note=" + note + "]";
	}
	
	
}
