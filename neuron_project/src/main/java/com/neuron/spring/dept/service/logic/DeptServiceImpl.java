package com.neuron.spring.dept.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neuron.spring.dept.domain.Dept;
import com.neuron.spring.dept.domain.DeptAdmin;
import com.neuron.spring.dept.domain.Team;
import com.neuron.spring.dept.service.DeptService;
import com.neuron.spring.dept.store.DeptStore;

@Service
public class DeptServiceImpl implements DeptService{
	
	@Autowired
	private DeptStore store;

	@Override
	public List<DeptAdmin> printAllDept(String master) {
		List<DeptAdmin> daList = store.selectAllDept(master);
		return daList;
	}

//	@Override
//	public int deptModify(DeptAdmin deptAdmin) {
//		int result = store.deptModify();
//		return 0;
//	}

	@Override
	public int registerDept(DeptAdmin deptAdmin) {
		int result = store.deptRegister();
		return result;
	}


}
