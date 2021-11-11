package com.neuron.spring.project.domain;

public class Project {
	
	private int projectNo;
	private String projectTitle;
	private String projectContents;
	private int projectMaster;
	private String projectInsertRequest;
	private String projectDeleteRequest;
	
	
	public Project() {
		
	}
	
	public int getProjectNo() {
		return projectNo;
	}
	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}
	public String getProjectTitle() {
		return projectTitle;
	}
	public void setProjectTitle(String projectTitle) {
		this.projectTitle = projectTitle;
	}
	public String getProjectContents() {
		return projectContents;
	}
	public void setProjectContents(String projectContents) {
		this.projectContents = projectContents;
	}
	public int getProjectMaster() {
		return projectMaster;
	}
	public void setProjectMaster(int projectMaster) {
		this.projectMaster = projectMaster;
	}
	public String getProjectInsertRequest() {
		return projectInsertRequest;
	}
	public void setProjectInsertRequest(String projectInsertRequest) {
		this.projectInsertRequest = projectInsertRequest;
	}
	public String getProjectDeleteRequest() {
		return projectDeleteRequest;
	}
	public void setProjectDeleteRequest(String projectDeleteRequest) {
		this.projectDeleteRequest = projectDeleteRequest;
	}
	@Override
	public String toString() {
		return "Project [projectNo=" + projectNo + ", projectTitle=" + projectTitle + ", projectContents="
				+ projectContents + ", projectMaster=" + projectMaster + ", projectInsertRequest="
				+ projectInsertRequest + ", projectDeleteRequest=" + projectDeleteRequest + "]";
	}

	
	
}
