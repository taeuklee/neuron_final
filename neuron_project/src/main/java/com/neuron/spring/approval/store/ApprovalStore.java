package com.neuron.spring.approval.store;

import java.util.List;
import java.util.Map;

import com.neuron.spring.approval.domain.Approval;
import com.neuron.spring.approval.domain.CodeInfo;
import com.neuron.spring.approval.domain.Document;
import com.neuron.spring.approval.domain.DocumentFile;
import com.neuron.spring.approval.domain.PageInfo;
import com.neuron.spring.employee.domain.Dept;
import com.neuron.spring.employee.domain.Employee;
import com.neuron.spring.employee.domain.Team;
import com.neuron.spring.util.DataMap;

public interface ApprovalStore {
	public int selectListCount(int empNo);
	public int selectListCount(Map param);
	public List<Document> selectMyAllDoc(PageInfo pi, Map empNo);
	
	public  List<Map<String, Object>> selectCodeInfo(Map<String,String> param);
	
	public List<CodeInfo> selectCodeInfo();
	
	public List<Employee> selectAllEmployee();
	
	public List<Team> selectAllTeam();
	
	public List<Dept> selectAllDept();
	
//	public int insertDocument(Map<String,Object> param);
	
	public int insertDocument(DataMap dataMap) throws Exception;
	
	public int insertDocumentFile(DocumentFile file);
	
	public int issertApproval(Approval appr);
	
	public List<DataMap> selectApproval(DataMap dataMap);
	
	public Document selectDocumentOne(DataMap dataMap);
}
