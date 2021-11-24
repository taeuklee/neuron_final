package com.neuron.spring.holiday.store;

import java.util.List;

import com.neuron.spring.approval.domain.Document;
import com.neuron.spring.attend.domain.Attendance;
import com.neuron.spring.attend.domain.PageInfo;
import com.neuron.spring.employee.domain.Employee;

public interface HolidayStore {

	public int selectListCount(int empNo);

	public List<Document> selectAll(PageInfo pi, int empNo);
	public List<Employee> selectEmpAll(int empNo);
}
