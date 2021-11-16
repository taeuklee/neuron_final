package com.neuron.spring.attend.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neuron.spring.attend.domain.Attendance;
import com.neuron.spring.attend.domain.PageInfo;
import com.neuron.spring.attend.service.AttendanceService;
import com.neuron.spring.attend.store.AttendanceStore;

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

	@Override
	public int insertTime(Attendance attend) {
		int result  = store.putTime(attend);
		return result;
	}


	@Override
	public Attendance printOne(int empNo) {
		Attendance attend = store.selectOne(empNo);
		return attend;
	}

	@Override
	public int insertFinishTime(Attendance attend) {
		int result = store.putFinishTime(attend);
		return result;
	}



}
