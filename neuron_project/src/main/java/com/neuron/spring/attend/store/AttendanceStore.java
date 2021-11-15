package com.neuron.spring.attend.store;

import java.util.List;

import com.neuron.spring.attend.domain.Attendance;
import com.neuron.spring.attend.domain.PageInfo;
import com.neuron.spring.employee.domain.Employee;

public interface AttendanceStore {

	public int selectListCount();

	public List<Attendance> selectAll(PageInfo pi);

//	public List<Employee> selectAll();

}
