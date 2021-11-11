package com.neuron.spring.employee.store;

import java.util.List;

import com.neuron.spring.employee.domain.Employee;

public interface EmployeeStore {

	public Employee selectEmp(Employee empOne);

	public int insertEmp(Employee employee);

	public int updateEmpInfo(Employee emp);

	public List<Employee> selectAllEmp();

	public Employee selectOneEmp(int eName);

}
