package com.neuron.spring.dept.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.neuron.spring.dept.domain.Dept;
import com.neuron.spring.dept.domain.Team;
import com.neuron.spring.dept.store.DeptStore;

@Repository
public class DeptStoreLogic implements DeptStore{
	
	private SqlSession sqlSession;

	@Override
	public List<Dept> selectAllDept() {
		List<Dept> dList = sqlSession.selectList("deptMapper.selectAllDept");
		return dList;
	}

	@Override
	public List<Team> selectAllTeam() {
		List<Team> tList = sqlSession.selectList("deptMapper.selectAllTeam");
		return tList;
	}

}
