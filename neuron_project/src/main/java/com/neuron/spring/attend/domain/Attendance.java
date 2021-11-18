package com.neuron.spring.attend.domain;

import java.util.Date;

public class Attendance {
	private int attendNo;
	private int empNo;
	private Date attendDate;
	private String startTime;
	private String finishTime;
	private String totalWorkhour;
	private String division;
	private String note;
	private int count;
	private int countLate;
	private int countAbs;
	
	public Attendance() {}

	public Attendance(int attendNo, int empNo, Date attendDate, String startTime, String finishTime,
			String totalWorkhour, String division, String note, int count, int countLate, int countAbs) {
		super();
		this.attendNo = attendNo;
		this.empNo = empNo;
		this.attendDate = attendDate;
		this.startTime = startTime;
		this.finishTime = finishTime;
		this.totalWorkhour = totalWorkhour;
		this.division = division;
		this.note = note;
		this.count = count;
		this.countLate = countLate;
		this.countAbs = countAbs;
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

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getFinishTime() {
		return finishTime;
	}

	public void setFinishTime(String finishTime) {
		this.finishTime = finishTime;
	}

	public String getTotalWorkhour() {
		return totalWorkhour;
	}

	public void setTotalWorkhour(String totalWorkhour) {
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

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getCountLate() {
		return countLate;
	}

	public void setCountLate(int countLate) {
		this.countLate = countLate;
	}

	public int getCountAbs() {
		return countAbs;
	}

	public void setCountAbs(int countAbs) {
		this.countAbs = countAbs;
	}

	@Override
	public String toString() {
		return "Attendance [attendNo=" + attendNo + ", empNo=" + empNo + ", attendDate=" + attendDate + ", startTime="
				+ startTime + ", finishTime=" + finishTime + ", totalWorkhour=" + totalWorkhour + ", division="
				+ division + ", note=" + note + ", count=" + count + ", countLate=" + countLate + ", countAbs="
				+ countAbs + "]";
	}

	
}
