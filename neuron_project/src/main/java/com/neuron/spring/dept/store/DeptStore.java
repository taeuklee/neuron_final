package com.neuron.spring.dept.store;

import java.util.List;

import com.neuron.spring.dept.domain.Dept;
import com.neuron.spring.dept.domain.DeptAdmin;
import com.neuron.spring.dept.domain.Team;

public interface DeptStore {

	List<DeptAdmin> selectAllDept(String master);

	int deptModify();

	int deptRegister();


}
