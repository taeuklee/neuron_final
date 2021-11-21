package com.neuron.spring.admin.project.domain;

public class Project {
	
	private int projectNo;
	private String projectTitle;
	private String projectContents;
	private int projectMaster;
	private String projectInsertRequest;
	private String projectDeleteRequest;
	
	public Project() {}

	public Project(int projectNo, String projectTitle, String projectContents, int projectMaster,
			String projectInsertRequest, String projectDeleteRequest) {
		super();
		this.projectNo = projectNo;
		this.projectTitle = projectTitle;
		this.projectContents = projectContents;
		this.projectMaster = projectMaster;
		this.projectInsertRequest = projectInsertRequest;
		this.projectDeleteRequest = projectDeleteRequest;
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
	};
	
	
}
