package com.neuron.spring.approval.store;

import java.util.List;
import java.util.Map;

import com.neuron.spring.approval.domain.Document;
import com.neuron.spring.approval.domain.PageInfo;
import com.neuron.spring.employee.domain.Employee;

public interface ApprovalStore {
	public int selectListCount(int empNo);
	public List<Document> selectMyAllDoc(PageInfo pi, Map empNo);
	public Employee printOneByEmp(int empNo);
	public  List<Map<String, Object>> selectCodeInfo(Map<String,String> param);
}
