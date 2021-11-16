package com.neuron.spring.dept.domain;

import java.io.File;

public class Employee {
	
	private int empNo;
	private String deptCode;
	private String teamCode;
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
	private String empFileReName;
	private String empMaster;
	
	public Employee() {}

	public Employee(int empNo, String deptCode, String teamCode, String empId, String empPwd, String empName,
			String empBirth, String empPhone, String empJob, String empEmail, String empSubEmail, int empExnum,
			String empState, int empVac, int empMed, int empExVac, String empSign, String empFileName,
			String empFileReName, String empMaster) {
		super();
		this.empNo = empNo;
		this.deptCode = deptCode;
		this.teamCode = teamCode;
		this.empId = empId;
		this.empPwd = empPwd;
		this.empName = empName;
		this.empBirth = empBirth;
		this.empPhone = empPhone;
		this.empJob = empJob;
		this.empEmail = empEmail;
		this.empSubEmail = empSubEmail;
		this.empExnum = empExnum;
		this.empState = empState;
		this.empVac = empVac;
		this.empMed = empMed;
		this.empExVac = empExVac;
		this.empSign = empSign;
		this.empFileName = empFileName;
		this.empFileReName = empFileReName;
		this.empMaster = empMaster;
	}

	public int getEmpNo() {
		return empNo;
	}

	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}

	public String getDeptCode() {
		return deptCode;
	}

	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}

	public String getTeamCode() {
		return teamCode;
	}

	public void setTeamCode(String teamCode) {
		this.teamCode = teamCode;
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

	public String getEmpFileReName() {
		return empFileReName;
	}

	public void setEmpFileReName(String empFileReName) {
		this.empFileReName = empFileReName;
	}

	public String getEmpMaster() {
		return empMaster;
	}

	public void setEmpMaster(String empMaster) {
		this.empMaster = empMaster;
	}

	@Override
	public String toString() {
		return "Employee [empNo=" + empNo + ", deptCode=" + deptCode + ", teamCode=" + teamCode + ", empId=" + empId
				+ ", empPwd=" + empPwd + ", empName=" + empName + ", empBirth=" + empBirth + ", empPhone=" + empPhone
				+ ", empJob=" + empJob + ", empEmail=" + empEmail + ", empSubEmail=" + empSubEmail + ", empExnum="
				+ empExnum + ", empState=" + empState + ", empVac=" + empVac + ", empMed=" + empMed + ", empExVac="
				+ empExVac + ", empSign=" + empSign + ", empFileName=" + empFileName + ", empFileReName="
				+ empFileReName + ", empMaster=" + empMaster + ", getEmpNo()=" + getEmpNo() + ", getDeptCode()="
				+ getDeptCode() + ", getTeamCode()=" + getTeamCode() + ", getEmpId()=" + getEmpId() + ", getEmpPwd()="
				+ getEmpPwd() + ", getEmpName()=" + getEmpName() + ", getEmpBirth()=" + getEmpBirth()
				+ ", getEmpPhone()=" + getEmpPhone() + ", getEmpJob()=" + getEmpJob() + ", getEmpEmail()="
				+ getEmpEmail() + ", getEmpSubEmail()=" + getEmpSubEmail() + ", getEmpExnum()=" + getEmpExnum()
				+ ", getEmpState()=" + getEmpState() + ", getEmpVac()=" + getEmpVac() + ", getEmpMed()=" + getEmpMed()
				+ ", getEmpExVac()=" + getEmpExVac() + ", getEmpSign()=" + getEmpSign() + ", getEmpFileName()="
				+ getEmpFileName() + ", getEmpFileReName()=" + getEmpFileReName() + ", getEmpMaster()=" + getEmpMaster()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	};
	
	



}
