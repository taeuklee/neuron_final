package com.neuron.spring.employee.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neuron.spring.employee.domain.Employee;
import com.neuron.spring.employee.service.EmployeeService;
import com.neuron.spring.employee.store.EmployeeStore;

@Service
public class EmployeeSerivceImpl implements EmployeeService{
	
	@Autowired
	private EmployeeStore store;

	@Override
	public Employee loginEmp(Employee empOne) {
		Employee eOne = store.selectEmp(empOne);
		return eOne;
	}

	@Override
	public int registerEmp(Employee employee) {
		int result = store.insertEmp(employee);
		return result;
	}


	@Override
	public int modifyEmpInfo(Employee emp) {
		int result = store.updateEmpInfo(emp);
		return result;
	}


	@Override
	public List<Employee> printAllEmp() {
		List<Employee> eList = store.selectAllEmp();
		return eList;
	}

	@Override
	public Employee printOneEmp(int eNo) {
		Employee employee = store.selectOneEmp(eNo);
		return employee;
	}


}
