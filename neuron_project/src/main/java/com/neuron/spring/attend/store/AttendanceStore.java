package com.neuron.spring.attend.store;

import java.util.List;

import com.neuron.spring.attend.domain.Attendance;
import com.neuron.spring.attend.domain.PageInfo;
import com.neuron.spring.employee.domain.Employee;

public interface AttendanceStore {

	public int selectListCount(int empNo);

	public List<Attendance> selectAll(PageInfo pi,int empNo);

//	public List<Employee> selectAll();

}
