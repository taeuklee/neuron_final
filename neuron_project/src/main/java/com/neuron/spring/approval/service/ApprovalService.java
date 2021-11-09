package com.neuron.spring.approval.service;

import java.util.List;
import java.util.Map;

import com.neuron.spring.approval.domain.Document;
import com.neuron.spring.approval.domain.PageInfo;
import com.neuron.spring.employee.domain.Dept;
import com.neuron.spring.employee.domain.Employee;
import com.neuron.spring.employee.domain.Team;

public interface ApprovalService {
	/**
	 * 게시물 전체 개수
	 * @return result
	 */
	public int getListCount(int empNo);
	
	/**
	 * 게시판 게시물 전체 조회
	 * @param pi
	 * @return List
	 */
	public List<Document> printMyAllDocList(PageInfo pi,Map empNo);
	
	public Employee printOneByEmp(int empNo);

	public List<Map<String, Object>> codeInfo(Map<String,String> param);
	
	public List<Employee> printAllEmployeeList();
	
	public List<Team> printAllTeamList();
	
	public List<Dept> printAllDeptList();
}
