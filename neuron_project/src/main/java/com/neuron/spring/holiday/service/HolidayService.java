package com.neuron.spring.holiday.service;

import java.util.List;

import com.neuron.spring.approval.domain.Document;
import com.neuron.spring.attend.domain.Attendance;
import com.neuron.spring.attend.domain.PageInfo;
import com.neuron.spring.employee.domain.Employee;

public interface HolidayService {

	public int getListCount(int empNo);

	public List<Document> printAll(PageInfo pi, int empNo);
	public List<Employee> printEmpAll(int empNo);
}
