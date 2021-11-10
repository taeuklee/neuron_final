package com.neuron.spring.empCalendar.domain;

import java.sql.Date;

public class EmpCalendar {

	
	private int empNo;
	private int empCalendarNo;
	private String empCalendarEventTitle;
	private String empCalendarStartTime;
	private String empCalendarEndTime;
	
	public EmpCalendar() {
		
	}
	
	public int getEmpNo() {
		return empNo;
	}
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	public int getEmpCalendarNo() {
		return empCalendarNo;
	}
	public void setEmpCalendarNo(int empCalendarNo) {
		this.empCalendarNo = empCalendarNo;
	}
	public String getEmpCalendarEventTitle() {
		return empCalendarEventTitle;
	}
	public void setEmpCalendarEventTitle(String empCalendarEventTitle) {
		this.empCalendarEventTitle = empCalendarEventTitle;
	}
	public String getEmpCalendarStartTime() {
		return empCalendarStartTime;
	}
	public void setEmpCalendarStartTime(String startTime) {
		this.empCalendarStartTime = startTime;
	}
	public String getEmpCalendarEndTime() {
		return empCalendarEndTime;
	}
	public void setEmpCalendarEndTime(String empCalendarEndTime) {
		this.empCalendarEndTime = empCalendarEndTime;
	}
	@Override
	public String toString() {
		return "EmpCalendar [empNo=" + empNo + ", empCalendarNo=" + empCalendarNo + ", empCalendarEventTitle="
				+ empCalendarEventTitle + ", empCalendarStartTime=" + empCalendarStartTime + ", empCalendarEndTime="
				+ empCalendarEndTime + "]";
	}
	
	
	
}
