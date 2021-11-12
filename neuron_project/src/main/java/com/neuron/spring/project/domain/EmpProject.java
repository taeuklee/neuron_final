package com.neuron.spring.project.domain;

public class EmpProject {

	private int projectNo;
	private int empNo;
	private String empAuth;
	private String projectTitle;
	private String projectInsertInfo;
	private String projectDeleteInfo;
	
	public EmpProject() {
		
	}
	
	public int getProjectNo() {
		return projectNo;
	}
	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}
	public int getEmpNo() {
		return empNo;
	}
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	public String getEmpAuth() {
		return empAuth;
	}
	public void setEmpAuth(String empAuth) {
		this.empAuth = empAuth;
	}
	public String getProjectTitle() {
		return projectTitle;
	}
	public void setProjectTitle(String projectTitle) {
		this.projectTitle = projectTitle;
	}
	public String getProjectInsertInfo() {
		return projectInsertInfo;
	}
	public void setProjectInsertInfo(String projectInsertInfo) {
		this.projectInsertInfo = projectInsertInfo;
	}
	public String getProjectDeleteInfo() {
		return projectDeleteInfo;
	}
	public void setProjectDeleteInfo(String projectDeleteInfo) {
		this.projectDeleteInfo = projectDeleteInfo;
	}

	@Override
	public String toString() {
		return "EmpProject [projectNo=" + projectNo + ", empNo=" + empNo + ", empAuth=" + empAuth + ", projectTitle="
				+ projectTitle + ", projectInsertInfo=" + projectInsertInfo + ", projectDeleteInfo=" + projectDeleteInfo
				+ "]";
	}
	
	
}
