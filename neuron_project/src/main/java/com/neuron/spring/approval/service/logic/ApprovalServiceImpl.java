package com.neuron.spring.approval.service.logic;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neuron.spring.approval.domain.Document;
import com.neuron.spring.approval.domain.PageInfo;
import com.neuron.spring.approval.service.ApprovalService;
import com.neuron.spring.approval.store.ApprovalStore;
import com.neuron.spring.employee.domain.Dept;
import com.neuron.spring.employee.domain.Employee;
import com.neuron.spring.employee.domain.Team;

@Service
public class ApprovalServiceImpl implements ApprovalService{
	@Autowired
	private ApprovalStore store;

	@Override
	public List<Document> printMyAllDocList(PageInfo pi, Map docWriterNo) {
		List<Document> dList = store.selectMyAllDoc(pi, docWriterNo);
		return dList;
	}

	@Override
	public int getListCount(int docWriterNo) {
		int count = store.selectListCount(docWriterNo);
		return count;
	}
	
	@Override
	public List<Map<String, Object>> codeInfo(Map<String,String> param) {
		return store.selectCodeInfo(param);
	}

	@Override
	public List<Employee> printAllEmployeeList() {
		
		return store.selectAllEmployee();
	}

	@Override
	public List<Team> printAllTeamList() {
		return store.selectAllTeam();
	}

	@Override
	public List<Dept> printAllDeptList() {
		return store.selectAllDept();
	}

	@Override
	public Employee printOneByEmp(int empNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int registerDocument() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int registerApprove() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int registerDocumentFile() {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	
}
