package com.neuron.spring.project.domain;

public class ProjectCalendar {
	
	private int projectNo;
	private int projectCalendarNo;
	private String projectCalendarEventTitle;
	private String projectCalendarStartTime;
	private String projectCalendarEndTime;
	
	
	public ProjectCalendar() {
		
	}
	
	public int getProjectNo() {
		return projectNo;
	}
	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}
	public int getProjectCalendarNo() {
		return projectCalendarNo;
	}
	public void setProjectCalendarNo(int projectCalendarNo) {
		this.projectCalendarNo = projectCalendarNo;
	}
	public String getProjectCalendarEventTitle() {
		return projectCalendarEventTitle;
	}
	public void setProjectCalendarEventTitle(String projectCalendarEventTitle) {
		this.projectCalendarEventTitle = projectCalendarEventTitle;
	}
	public String getProjectCalendarStartTime() {
		return projectCalendarStartTime;
	}
	public void setProjectCalendarStartTime(String projectCalendarStartTime) {
		this.projectCalendarStartTime = projectCalendarStartTime;
	}
	public String getProjectCalendarEndTime() {
		return projectCalendarEndTime;
	}
	public void setProjectCalendarEndTime(String projectCalendarEndTime) {
		this.projectCalendarEndTime = projectCalendarEndTime;
	}

	@Override
	public String toString() {
		return "ProjectCalendar [projectNo=" + projectNo + ", projectCalendarNo=" + projectCalendarNo
				+ ", projectCalendarEventTitle=" + projectCalendarEventTitle + ", projectCalendarStartTime="
				+ projectCalendarStartTime + ", projectCalendarEndTime=" + projectCalendarEndTime + "]";
	}
	
	
	

}
