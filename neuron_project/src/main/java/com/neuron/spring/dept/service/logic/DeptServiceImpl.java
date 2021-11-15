package com.neuron.spring.dept.service.logic;

import java.util.List;

import org.springframework.stereotype.Service;

import com.neuron.spring.dept.domain.Dept;
import com.neuron.spring.dept.domain.Team;
import com.neuron.spring.dept.service.DeptService;
import com.neuron.spring.dept.store.DeptStore;

@Service
public class DeptServiceImpl implements DeptService{
	
	private DeptStore store;

	@Override
	public List<Dept> printAllDept() {
		List<Dept> dList = store.selectAllDept();
		return dList;
	}

	@Override
	public List<Team> printAllTeam() {
		List<Team> tList = store.selectAllTeam();
		return tList;
	}

}
