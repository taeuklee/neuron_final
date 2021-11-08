package com.neuron.spring.project.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.neuron.spring.project.store.ProjectStore;


@Repository
public class ProjectStroeLogic implements ProjectStore{

	@Autowired
	private SqlSession sqlSession;
}
