package com.neuron.spring.employee.domain;

import java.io.File;

public class Employee {
	private int empNo;
	private int DeptNo;
	private int TeamNo;
	private String empId;
	private String empPwd;
	private String empName;
	private String empBirth;
	private String empPhone;
	private String empJob;
	private String empEmail;
	private String empSubEmail;
	private int empExnum;
	private String empState;
	private int empVac;
	private int empMed;
	private int empExVac;
	private String empSign;
	private String empFileName;
	private File empFileReName;
	
	public Employee() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getEmpNo() {
		return empNo;
	}

	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}

	public int getDeptNo() {
		return DeptNo;
	}

	public void setDeptNo(int deptNo) {
		DeptNo = deptNo;
	}

	public int getTeamNo() {
		return TeamNo;
	}

	public void setTeamNo(int teamNo) {
		TeamNo = teamNo;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getEmpPwd() {
		return empPwd;
	}

	public void setEmpPwd(String empPwd) {
		this.empPwd = empPwd;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getEmpBirth() {
		return empBirth;
	}

	public void setEmpBirth(String empBirth) {
		this.empBirth = empBirth;
	}

	public String getEmpPhone() {
		return empPhone;
	}

	public void setEmpPhone(String empPhone) {
		this.empPhone = empPhone;
	}

	public String getEmpJob() {
		return empJob;
	}

	public void setEmpJob(String empJob) {
		this.empJob = empJob;
	}

	public String getEmpEmail() {
		return empEmail;
	}

	public void setEmpEmail(String empEmail) {
		this.empEmail = empEmail;
	}

	public String getEmpSubEmail() {
		return empSubEmail;
	}

	public void setEmpSubEmail(String empSubEmail) {
		this.empSubEmail = empSubEmail;
	}

	public int getEmpExnum() {
		return empExnum;
	}

	public void setEmpExnum(int empExnum) {
		this.empExnum = empExnum;
	}

	public String getEmpState() {
		return empState;
	}

	public void setEmpState(String empState) {
		this.empState = empState;
	}

	public int getEmpVac() {
		return empVac;
	}

	public void setEmpVac(int empVac) {
		this.empVac = empVac;
	}

	public int getEmpMed() {
		return empMed;
	}

	public void setEmpMed(int empMed) {
		this.empMed = empMed;
	}

	public int getEmpExVac() {
		return empExVac;
	}

	public void setEmpExVac(int empExVac) {
		this.empExVac = empExVac;
	}

	public String getEmpSign() {
		return empSign;
	}

	public void setEmpSign(String empSign) {
		this.empSign = empSign;
	}

	public String getEmpFileName() {
		return empFileName;
	}

	public void setEmpFileName(String empFileName) {
		this.empFileName = empFileName;
	}

	public File getEmpFileReName() {
		return empFileReName;
	}

	public void setEmpFileReName(File empFileReName) {
		this.empFileReName = empFileReName;
	}

	@Override
	public String toString() {
		return "Employee [empNo=" + empNo + ", DeptNo=" + DeptNo + ", TeamNo=" + TeamNo + ", empId=" + empId
				+ ", empPwd=" + empPwd + ", empName=" + empName + ", empBirth=" + empBirth + ", empPhone=" + empPhone
				+ ", empJop=" + empJob + ", empEmail=" + empEmail + ", empSubEmail=" + empSubEmail + ", empExnum="
				+ empExnum + ", empState=" + empState + ", empVac=" + empVac + ", empMed=" + empMed + ", empExVac="
				+ empExVac + ", empSign=" + empSign + ", empFileName=" + empFileName + ", empFileReName="
				+ empFileReName + "]";
	}
	
	

}
