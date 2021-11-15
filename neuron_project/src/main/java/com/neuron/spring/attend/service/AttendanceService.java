package com.neuron.spring.attend.service;

import java.util.List;

import com.neuron.spring.attend.domain.Attendance;
import com.neuron.spring.attend.domain.PageInfo;
import com.neuron.spring.employee.domain.Employee;

public interface AttendanceService {
	public int getListCount(int empNo);

	public List<Attendance> printAll(PageInfo pi, int empNo);

//	public List<Employee> printAll();
}
