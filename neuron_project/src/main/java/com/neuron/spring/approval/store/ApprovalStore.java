package com.neuron.spring.approval.store;

import java.util.List;

import com.neuron.spring.approval.domain.Document;
import com.neuron.spring.approval.domain.PageInfo;
import com.neuron.spring.employee.domain.Employee;

public interface ApprovalStore {
	public int selectListCount(int empNo);
	public List<Document> selectMyAllDoc(PageInfo pi, int empNo);
	public Employee printOneByEmp(int empNo);
}
