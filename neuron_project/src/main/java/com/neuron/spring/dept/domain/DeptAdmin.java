package com.neuron.spring.dept.domain;

public class DeptAdmin {
	
	private String deptCode; 
	private String deptName;
	private String teamCode;
	private String teamName;
	private String empName;
	private String empMaster;
	
	public DeptAdmin() {}

	public DeptAdmin(String deptCode, String deptName, String teamCode, String teamName, String empName,
			String empMaster) {
		super();
		this.deptCode = deptCode;
		this.deptName = deptName;
		this.teamCode = teamCode;
		this.teamName = teamName;
		this.empName = empName;
		this.empMaster = empMaster;
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

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getEmpMaster() {
		return empMaster;
	}

	public void setEmpMaster(String empMaster) {
		this.empMaster = empMaster;
	}

	@Override
	public String toString() {
		return "DeptAdmin [deptCode=" + deptCode + ", deptName=" + deptName + ", teamCode=" + teamCode + ", teamName="
				+ teamName + ", empName=" + empName + ", empMaster=" + empMaster + "]";
	};
	
	

}
