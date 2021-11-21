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
import com.neuron.spring.util.DataMap;

@Service
public class ApprovalServiceImpl implements ApprovalService{
	@Autowired
	private ApprovalStore store;

	@Override
	public List<DataMap> printMyAllDocList(PageInfo pi, Map docWriterNo) {
		List<DataMap> dList = store.selectMyAllDoc(pi, docWriterNo);
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
	public  Map<String, Object> printOneByEmp(int empNo) {
		return store.selectOneByEmp(empNo);
	}

	@Override
	public int registerDocument(DataMap dataMap) throws Exception {
		return store.insertDocument(dataMap);
	}

	@Override
	public int registerDocumentFile(DocumentFile file) {
		return store.insertDocumentFile(file);
	}

	@Override
	public List<DataMap> printApprovalList(DataMap dataMap) {
		return store.selectApproval(dataMap);
	}

	@Override
	public DataMap printDocumentOne(DataMap dataMap) {
		return store.selectDocumentOne(dataMap);
	}

	@Override
	public int updateTransApproval(DataMap dataMap) {
		return store.updateTransApproval(dataMap);
	}

	@Override
	public int rejectTransApproval(DataMap dataMap) {
		return store.rejectTransApproval(dataMap);
	}
	
	@Override
	public Map<String, Object> printOneByTeam(String teamCode){
		return store.selectOneByTeam(teamCode);
	}

	@Override
	public int updateDocWithDraw(DataMap map) {
		return store.updateDocWithDraw(map);
	}

	@Override
	public int documentRegisterProcess(DataMap map) {
		return store.documentRegisterProcess(map);
	}

	@Override
	public List<DataMap> printMainPageDocList(int empNo) {
		return store.selectMainPageDocList(empNo);
	}
	
	
}
