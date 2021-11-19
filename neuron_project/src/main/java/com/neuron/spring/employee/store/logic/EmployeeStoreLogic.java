package com.neuron.spring.employee.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.neuron.spring.employee.domain.DeptTeam;
import com.neuron.spring.employee.domain.Employee;
import com.neuron.spring.employee.domain.PageInfo;
import com.neuron.spring.employee.domain.Search;
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

	@Override
	public int updateEmpAdmin(Employee employee) {
		int result = sqlSession.insert("employeeMapper.updateEmpAdmin", employee);
		return result;
	}

	@Override
	public List<Employee> selectSearchAll(Search search) {
		List<Employee> searchList = sqlSession.selectList("employeeMapper.selectSearchAll", search);
		return searchList;
	}

	@Override
	public int selectListCount() {
		int count = sqlSession.selectOne("employeeMapper.selectListCount");
		return count;
	}

	@Override
	public List<Employee> selectAll(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1 ) * pi.getEmpLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getEmpLimit());
		List<Employee> eList = sqlSession.selectList("employeeMapper.selectAllList", pi, rowBounds);
		return eList;
	}

	@Override
	public List<DeptTeam> selectAllDtList() {
		List<DeptTeam> dtList = sqlSession.selectList("employeeMapper.selectAllDtList");
		return dtList;
	}

//	@Override
//	public int updateEmpPwd(Employee employee) {
//		int result = sqlSession.update("employeeMapper.updatePw", employee);
//		return result;
//	}

	
}
