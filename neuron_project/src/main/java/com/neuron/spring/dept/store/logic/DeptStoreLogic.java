package com.neuron.spring.dept.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.neuron.spring.dept.domain.Dept;
import com.neuron.spring.dept.domain.DeptAdmin;
import com.neuron.spring.dept.domain.Team;
import com.neuron.spring.dept.store.DeptStore;
import com.neuron.spring.employee.domain.Employee;

@Repository
public class DeptStoreLogic implements DeptStore{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<DeptAdmin> selectAllDept(String master) {
		List<DeptAdmin> daList = sqlSession.selectList("deptMapper.selectDeptAdminAll", master);
		return daList;
	}

	@Override
	public int deptRegister(DeptAdmin deptAdmin) {
		return sqlSession.insert("deptMapper.deptRegister",deptAdmin);
	}

	@Override
	public int deptModify(DeptAdmin deptAdmin) {
		int result = sqlSession.update("deptMapper.deptModify");
		return result;
	}

	@Override
	public int deptRemove(String deptCode) {
		int result = sqlSession.delete("deptMapper.deptRemove");
		return result;
	}





}
