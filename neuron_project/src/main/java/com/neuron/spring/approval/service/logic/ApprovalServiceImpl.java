package com.neuron.spring.approval.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neuron.spring.approval.domain.Document;
import com.neuron.spring.approval.domain.PageInfo;
import com.neuron.spring.approval.service.ApprovalService;
import com.neuron.spring.approval.store.ApprovalStore;
import com.neuron.spring.employee.domain.Employee;

@Service
public class ApprovalServiceImpl implements ApprovalService{
	@Autowired
	private ApprovalStore store;

	@Override
	public Employee printOneByEmp(int docWriterNo) {
		Employee empOne = store.printOneByEmp(docWriterNo);
		return empOne;
	}

	@Override
	public List<Document> printMyAllDocList(PageInfo pi,int docWriterNo) {
		List<Document> dList = store.selectMyAllDoc(pi, docWriterNo);
		return dList;
	}

	@Override
	public int getListCount(int docWriterNo) {
		int count = store.selectListCount(docWriterNo);
		return count;
	}
	
	
}
