package com.neuron.spring.project.domain;

public class ProjectTaskDetail {
	
	private int taskDetailNo;
	private int empNo;
	private int taskNo;
	private String taskDetailId;
	private String taskDetailSucccess;
	private String taskDetailTitle;
	private int taskDetailProcessivity;
	
	public ProjectTaskDetail() {
		
	}

	public int getTaskDetailNo() {
		return taskDetailNo;
	}

	public void setTaskDetailNo(int taskDetailNo) {
		this.taskDetailNo = taskDetailNo;
	}

	public int getEmpNo() {
		return empNo;
	}

	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}

	public int getTaskNo() {
		return taskNo;
	}

	public void setTaskNo(int taskNo) {
		this.taskNo = taskNo;
	}

	public String getTaskDetailId() {
		return taskDetailId;
	}

	public void setTaskDetailId(String taskDetailId) {
		this.taskDetailId = taskDetailId;
	}

	public String getTaskDetailSucccess() {
		return taskDetailSucccess;
	}

	public void setTaskDetailSucccess(String taskDetailSucccess) {
		this.taskDetailSucccess = taskDetailSucccess;
	}

	public String getTaskDetailTitle() {
		return taskDetailTitle;
	}

	public void setTaskDetailTitle(String taskDetailTitle) {
		this.taskDetailTitle = taskDetailTitle;
	}

	public int getTaskDetailProcessivity() {
		return taskDetailProcessivity;
	}

	public void setTaskDetailProcessivity(int taskDetailProcessivity) {
		this.taskDetailProcessivity = taskDetailProcessivity;
	}

	@Override
	public String toString() {
		return "ProjectTaskDetail [taskDetailNo=" + taskDetailNo + ", empNo=" + empNo + ", taskNo=" + taskNo
				+ ", taskDetailId=" + taskDetailId + ", taskDetailSucccess=" + taskDetailSucccess + ", taskDetailTitle="
				+ taskDetailTitle + ", taskDetailProcessivity=" + taskDetailProcessivity + "]";
	}
	
	
	

	

}
