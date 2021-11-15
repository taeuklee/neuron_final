package com.neuron.spring.project.domain;

public class ProjectTask {

	private int taskNo;
	private int projectNo;
	private String taskTitle;
	private String taskEndDate;
	private int taskProcessivity;
	
	public ProjectTask() {
		
	}
	
	public int getTaskNo() {
		return taskNo;
	}

	public void setTaskNo(int taskNo) {
		this.taskNo = taskNo;
	}

	public int getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}

	public String getTaskTitle() {
		return taskTitle;
	}

	public void setTaskTitle(String taskTitle) {
		this.taskTitle = taskTitle;
	}

	public String getTaskEndDate() {
		return taskEndDate;
	}

	public void setTaskEndDate(String taskEndDate) {
		this.taskEndDate = taskEndDate;
	}

	public int getTaskProcessivity() {
		return taskProcessivity;
	}

	public void setTaskProcessivity(int taskProcessivity) {
		this.taskProcessivity = taskProcessivity;
	}

	@Override
	public String toString() {
		return "ProjectTask [taskNo=" + taskNo + ", projectNo=" + projectNo + ", taskTitle=" + taskTitle
				+ ", taskEndDate=" + taskEndDate + ", taskProcessivity=" + taskProcessivity + "]";
	}
	
	
	
}
