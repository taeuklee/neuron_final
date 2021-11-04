package com.neuron.spring.employee.domain;

import java.io.File;

public class Employee {
	private int empNo;
	private String DeptCode;
	private String TempCode;
	private String empId;
	private String empPwd;
	private String empName;
	private String empBirth;
	private String empPhone;
	private String empJop;
	private String empEmail;
	private String empSubEmail;
	private int empExnum;
	private String empState;
	private int empVac;
	private int empMed;
	private int empExVac;
	private File empSign;
	
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

	public String getDeptCode() {
		return DeptCode;
	}

	public void setDeptCode(String deptCode) {
		DeptCode = deptCode;
	}

	public String getTempCode() {
		return TempCode;
	}

	public void setTempCode(String tempCode) {
		TempCode = tempCode;
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

	public String getEmpJop() {
		return empJop;
	}

	public void setEmpJop(String empJop) {
		this.empJop = empJop;
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

	public File getEmpSign() {
		return empSign;
	}

	public void setEmpSign(File empSign) {
		this.empSign = empSign;
	}

	@Override
	public String toString() {
		return "Employee [empNo=" + empNo + ", DeptCode=" + DeptCode + ", TempCode=" + TempCode + ", empId=" + empId
				+ ", empPwd=" + empPwd + ", empName=" + empName + ", empBirth=" + empBirth + ", empPhone=" + empPhone
				+ ", empJop=" + empJop + ", empEmail=" + empEmail + ", empSubEmail=" + empSubEmail + ", empExnum="
				+ empExnum + ", empState=" + empState + ", empVac=" + empVac + ", empMed=" + empMed + ", empExVac="
				+ empExVac + ", empSign=" + empSign + "]";
	}
	
	
}
