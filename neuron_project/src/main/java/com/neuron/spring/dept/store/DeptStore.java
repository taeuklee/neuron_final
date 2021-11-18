package com.neuron.spring.dept.store;

import java.util.List;

import com.neuron.spring.dept.domain.Dept;
import com.neuron.spring.dept.domain.DeptAdmin;
import com.neuron.spring.dept.domain.Team;

public interface DeptStore {

	List<DeptAdmin> selectAllDept(String master);

	int deptRegister(DeptAdmin deptAdmin);

	int deptModify(DeptAdmin deptAdmin);

	int deptRemove(String deptCode);

	DeptAdmin selectOneDept(String deptCode);


}
