package com.neuron.spring.employee.store;

import java.util.List;

import com.neuron.spring.employee.domain.Employee;
import com.neuron.spring.employee.domain.PageInfo;
import com.neuron.spring.employee.domain.Search;

public interface EmployeeStore {

	public Employee selectEmp(Employee empOne);

	public int insertEmp(Employee employee);

	public int updateEmpInfo(Employee emp);

	public List<Employee> selectAllEmp();

	public Employee selectOneEmp(int eName);

	public int updateEmpAdmin(Employee employee);

	public List<Employee> selectSearchAll(Search search);

	public int selectListCount();

	public List<Employee> selectAll(PageInfo pi);

}
