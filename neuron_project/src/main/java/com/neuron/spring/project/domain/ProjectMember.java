package com.neuron.spring.project.domain;

public class ProjectMember {
	
	private int empNo;
	private int projectNo;
	private String empName;
	private String deptName;
	private String empJob;
	private String empFileReName;
	private String empAuth;
	private String taskDetailSuccess;
	
	public ProjectMember() {
		
	}

	public int getEmpNo() {
		return empNo;
	}

	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getEmpJob() {
		return empJob;
	}

	public void setEmpJob(String empJob) {
		this.empJob = empJob;
	}

	public String getEmpAuth() {
		return empAuth;
	}

	public void setEmpAuth(String empAuth) {
		this.empAuth = empAuth;
	}

	
	public int getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}

	public String getEmpFileReName() {
		return empFileReName;
	}

	public void setEmpFileReName(String empFileReName) {
		this.empFileReName = empFileReName;
	}

	
	
	public String getTaskDetailSuccess() {
		return taskDetailSuccess;
	}

	public void setTaskDetailSuccess(String taskDetailSuccess) {
		this.taskDetailSuccess = taskDetailSuccess;
	}

	@Override
	public String toString() {
		return "ProjectMember [empNo=" + empNo + ", projectNo=" + projectNo + ", empName=" + empName + ", deptName="
				+ deptName + ", empJob=" + empJob + ", empFileReName=" + empFileReName + ", empAuth=" + empAuth
				+ ", taskDetailSuccess=" + taskDetailSuccess + "]";
	}

	
		

	


	

	

}
