package com.neuron.spring.attend.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neuron.spring.attend.domain.Attendance;
import com.neuron.spring.attend.domain.PageInfo;
import com.neuron.spring.attend.service.AttendanceService;
import com.neuron.spring.attend.store.AttendanceStore;
import com.neuron.spring.employee.domain.Employee;

@Service
public class AttendanceServiceImpl implements AttendanceService{

	@Autowired
	private AttendanceStore store;
	
	@Override
	public int getListCount(int empNo) {
		int totalCount = store.selectListCount(empNo);
		return totalCount;
	}

	@Override
	public List<Attendance> printAll(PageInfo pi, int empNo) {
		List<Attendance> aList = store.selectAll(pi, empNo);
		return aList;
	}


}
