package com.neuron.spring.holiday.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neuron.spring.approval.domain.Document;
import com.neuron.spring.approval.store.ApprovalStore;
import com.neuron.spring.attend.domain.Attendance;
import com.neuron.spring.attend.domain.PageInfo;
import com.neuron.spring.employee.domain.Employee;
import com.neuron.spring.holiday.service.HolidayService;
import com.neuron.spring.holiday.store.HolidayStore;

@Service
public class HolidayServiceImpl implements HolidayService {

	@Autowired
	private HolidayStore store;

	@Override
	public int getListCount(int empNo) {
		int totalCount = store.selectListCount(empNo);
		return totalCount;
	}

	@Override
	public List<Document> printAll(PageInfo pi, int empNo) {
		List<Document> dList = store.selectAll(pi, empNo);
		return dList;
	}

	@Override
	public List<Employee> printEmpAll(int empNo) {
		List<Employee> eList = store.selectEmpAll(empNo);
		return eList;
	}

	

}
