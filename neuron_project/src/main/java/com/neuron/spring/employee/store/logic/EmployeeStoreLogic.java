package com.neuron.spring.employee.store.logic;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.neuron.spring.employee.domain.Employee;
import com.neuron.spring.employee.store.EmployeeStore;

@Repository
public class EmployeeStoreLogic implements EmployeeStore{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Employee selectEmp(Employee empOne) {
		Employee eOne = sqlSession.selectOne("employeeMapper.selectEmp", empOne);
		return eOne;
	}

	@Override
	public int insertEmp(Employee employee) {
		int result = sqlSession.insert("employeeMapper.insertEmp", employee);
		return result;
	}

	@Override
	public int updateEmpInfo(Employee emp) {
		int result = sqlSession.insert("employeeMapper.updateEmpInfo", emp);
		return result;
	}

	@Override
	public List<Employee> selectAllEmp() {
		List<Employee> eList = sqlSession.selectList("employeeMapper.selectAllEmp");
		return eList;
	}

	@Override
	public Employee selectOneEmp(int eNo) {
		Employee employee = sqlSession.selectOne("employeeMapper.selectOneEmp", eNo);
		return employee;
	}

	
}
