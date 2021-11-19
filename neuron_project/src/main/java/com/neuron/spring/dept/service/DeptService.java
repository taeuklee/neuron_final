package com.neuron.spring.dept.service;

import java.util.List;

import com.neuron.spring.dept.domain.Dept;
import com.neuron.spring.dept.domain.DeptAdmin;
import com.neuron.spring.dept.domain.Team;

public interface DeptService {

	List<DeptAdmin> printAllDept();

	int registerDept(DeptAdmin deptAdmin);

	DeptAdmin printOneDept(String teamCode);
	
	int deptModify(DeptAdmin deptAdmin);
	
	int teamModify(DeptAdmin deptAdmin);

	int removeDept(String deptCode);

}
