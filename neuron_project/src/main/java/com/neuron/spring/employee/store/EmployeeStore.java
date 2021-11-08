package com.neuron.spring.employee.store;

import com.neuron.spring.employee.domain.Employee;

public interface EmployeeStore {

	public Employee selectEmp(Employee empOne);

}
