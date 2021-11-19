package com.neuron.spring.dept.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neuron.spring.dept.domain.Dept;
import com.neuron.spring.dept.domain.DeptAdmin;
import com.neuron.spring.dept.domain.Team;
import com.neuron.spring.dept.service.DeptService;
import com.neuron.spring.dept.store.DeptStore;
import com.neuron.spring.employee.domain.Employee;

@Service
public class DeptServiceImpl implements DeptService{
	
	@Autowired
	private DeptStore store;

	@Override
	public List<DeptAdmin> printAllDept() {
		List<DeptAdmin> daList = store.selectAllDept();
		return daList;
	}

	@Override
	public DeptAdmin printOneDept(String teamCode) {
		DeptAdmin deptAdmin = store.selectOneDept(teamCode);
		return deptAdmin;
	}
	
	@Override
	public int deptModify(DeptAdmin deptAdmin) {
		int result = store.deptModify(deptAdmin);
		return result;
	}
	
	@Override
	public int teamModify(DeptAdmin deptAdmin) {
		int result = store.teamModify(deptAdmin);
		return result;
	}

	@Override
	public int registerDept(DeptAdmin deptAdmin) {
		int result = store.deptRegister(deptAdmin);
		return result;
	}

	@Override
	public int removeDept(String deptCode) {
		int result = store.deptRemove(deptCode);
		return result;
	}






}
