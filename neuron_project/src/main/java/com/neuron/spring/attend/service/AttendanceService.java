package com.neuron.spring.attend.service;

import java.util.List;

import com.neuron.spring.attend.domain.Attendance;
import com.neuron.spring.attend.domain.PageInfo;
import com.neuron.spring.attend.domain.Search;
import com.neuron.spring.employee.domain.Employee;

public interface AttendanceService {
	public int getListCount(int empNo);
	public int getListCount();
	
	public List<Attendance> printAll(PageInfo pi, int empNo);
	public List<Attendance> printSearchAll(Search search);
//	public List<Employee> printAllEmpList(PageInfo pi);
	
	public Attendance printOne(int empNo);

	public int insertTime(Attendance attend);
	public int insertFinishTime(Attendance attend);
	public int checkDateOne(int empNo);
	
	public int getAbsCount(int empNo);
	public int getLateCount(int empNo);
	public int getCount(int empNo);

	

	

	

	

}
