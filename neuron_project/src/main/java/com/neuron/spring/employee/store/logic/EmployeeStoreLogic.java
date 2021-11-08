package com.neuron.spring.employee.store.logic;

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

	
}
