package com.neuron.spring.employee.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.neuron.spring.employee.domain.DeptTeam;
import com.neuron.spring.employee.domain.Employee;
import com.neuron.spring.employee.domain.PageInfo;
import com.neuron.spring.employee.domain.Search;

public interface EmployeeService {

	public Employee loginEmp(Employee empOne);

	public int registerEmp(Employee employee);

	public int modifyEmpInfo(Employee emp);

	public List<Employee> printAllEmp();

	public Employee printOneEmp(int eNo);

	public int modifyEmpAdmin(Employee employee);

	public List<Employee> printSearchAll(Search search);

	public int getListCount();

	public List<Employee> printAll(PageInfo pi);

	public List<DeptTeam> printAllDtList();
	
	//이메일발송
//	public void sendEmail(Employee employee, String div) throws Exception;
//
//	public void findPwd(HttpServletResponse response, Employee employee);

}
