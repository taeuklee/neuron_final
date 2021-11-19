package com.neuron.spring.employee.domain;

public class DeptTeam {
	
	private String deptCode;
	private String deptName;
	private String teamCode;
	private String teamName;
	
	public DeptTeam() {}

	public DeptTeam(String deptCode, String deptName, String teamCode, String teamName) {
		super();
		this.deptCode = deptCode;
		this.deptName = deptName;
		this.teamCode = teamCode;
		this.teamName = teamName;
	}

	public String getDeptCode() {
		return deptCode;
	}

	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getTeamCode() {
		return teamCode;
	}

	public void setTeamCode(String teamCode) {
		this.teamCode = teamCode;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	@Override
	public String toString() {
		return "DeptTeam [deptCode=" + deptCode + ", deptName=" + deptName + ", teamCode=" + teamCode + ", teamName="
				+ teamName + "]";
	};
	
	
	
	
	
	

}
