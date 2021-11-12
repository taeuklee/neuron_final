package com.neuron.spring.project.store.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.object.StoredProcedure;
import org.springframework.stereotype.Repository;

import com.neuron.spring.project.domain.EmpProject;
import com.neuron.spring.project.domain.Employee;
import com.neuron.spring.project.domain.Project;
import com.neuron.spring.project.store.ProjectStore;


@Repository
public class ProjectStroeLogic implements ProjectStore{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Employee> selectInsertProjectSearchList(Map<String, Object> map) {
		List<Employee> eList = sqlSession.selectList("projectMapper.insertProjectSearchList", map);
		return eList;
	}

	@Override
	public int insertProjectRegister(Project project) {
		int result = sqlSession.insert("projectMapper.insertProjectRegister", project);
		return result;
	}
	
	
	@Override
	public Project selectProjectOne(Project project) {
		Project newProject = sqlSession.selectOne("projectMapper.selectProjectOne", project);
		System.out.println(newProject.toString());
		return newProject;
	}

	@Override
	public int insertProjectMemberList(Map<String, Object> map) {
		int result = sqlSession.insert("projectMapper.insertProjectMemberList", map);
		return result;
	}

	@Override
	public List<Project> selectProjectList(Map<String, Object> map) {
		List<Project> projectList = sqlSession.selectList("projectMapper.selectProjectList", map);
		return projectList;
	}

	@Override
	public List<EmpProject> selectMemberProjectList(Map<String, Object> map) {
		List<EmpProject> projectList = sqlSession.selectList("projectMapper.selectMemberProjectList", map);
		return projectList;
	}



}
