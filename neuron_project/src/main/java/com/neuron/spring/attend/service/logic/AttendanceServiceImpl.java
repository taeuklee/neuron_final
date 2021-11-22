package com.neuron.spring.attend.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neuron.spring.attend.domain.Attendance;
import com.neuron.spring.attend.domain.PageInfo;
import com.neuron.spring.attend.domain.Search;
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

	@Override
	public int getAbsCount(int empNo) {
		int countAbs = store.selectListCountAbs(empNo);
		return countAbs;
	}

	@Override
	public int getLateCount(int empNo) {
		int countLate = store.selectListCountLate(empNo);
		return countLate;
	}

	@Override
	public int getCount(int empNo) {
		int count = store.selectListCountNor(empNo);
		return count;
	}

	@Override
	public List<Attendance> printSearchAll(Search search) {
		List<Attendance> aList = store.searchList(search);
		return aList;
	}

	@Override
	public int checkDateOne(int empNo) {
		int result = store.checkDate(empNo);
		return result;
	}

	@Override
	public int getListCount() {
		int result = store.selectListCount();
		return result;
	}

	@Override
	public List<Employee> printAllEmpList(PageInfo pi) {
		List<Employee> eList = store.selectAllEmpList(pi);
		return eList;
	}




}
