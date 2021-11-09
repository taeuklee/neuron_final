package com.neuron.spring.employee.domain;

public class Team {
	private int teamNo;
	private int deptNo;
	private String teamName;
	
	public int getTeamNo() {
		return teamNo;
	}
	public void setTeamNo(int teamNo) {
		this.teamNo = teamNo;
	}
	public int getDeptNo() {
		return deptNo;
	}
	public void setDeptNo(int deptNo) {
		this.deptNo = deptNo;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	@Override
	public String toString() {
		return "Team [teamNo=" + teamNo + ", deptNo=" + deptNo + ", teamName=" + teamName + "]";
	}
	
}
