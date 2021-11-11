package com.neuron.spring.employee.service;

import java.util.List;

import com.neuron.spring.employee.domain.Employee;

public interface EmployeeService {

	public Employee loginEmp(Employee empOne);

	public int registerEmp(Employee employee);

	public int modifyEmpInfo(Employee emp);

	public List<Employee> printAllEmp();

	public Employee printOneEmp(int eNo);

}
