package com.neuron.spring.approval.service.logic;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neuron.spring.approval.domain.Approval;
import com.neuron.spring.approval.domain.CodeInfo;
import com.neuron.spring.approval.domain.Document;
import com.neuron.spring.approval.domain.DocumentFile;
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
	public int getListCount(Map param) {
		return store.selectListCount(param);
	}
	
	@Override
	public List<CodeInfo> printCodeInfo() {
		return store.selectCodeInfo();
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

//	@Override
//	public int registerDocument(Map<String,Object> param) {
//		return store.insertDocument(param);
//	}
	
	@Override
	public int registerDocument(Document doc) {
		return store.insertDocument(doc);
	}
	
	@Override
	public int registerApprove() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int registerDocumentFile(DocumentFile file) {
		return store.insertDocumentFile(file);
	}

	@Override
	public List<Approval> printApprovalList(int documentNo) {
		return store.selectApproval(documentNo);
	}

	@Override
	public Document printDocumentOne(int documentNo) {
		return store.selectDocumentOne(documentNo);
	}

	@Override
	public int registerDocument(Map map, List<Approval> aList) {
		int docResult = store.insertDocument(map,aList);
		return docResult;
	}


	
	
	
	
}
