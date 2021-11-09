package com.neuron.spring.project.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.object.StoredProcedure;
import org.springframework.stereotype.Repository;

import com.neuron.spring.project.domain.Employee;
import com.neuron.spring.project.store.ProjectStore;


@Repository
public class ProjectStroeLogic implements ProjectStore{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Employee> selectInsertProjectSearchList(String searchText) {
		List<Employee> eList = sqlSession.selectList("projectMapper.insertProjectSearchList", searchText);
		return eList;
	}
}
