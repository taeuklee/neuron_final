package com.neuron.spring.project.service.logic;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neuron.spring.project.domain.EmpProject;
import com.neuron.spring.project.domain.Employee;
import com.neuron.spring.project.domain.Project;
import com.neuron.spring.project.service.ProjectService;
import com.neuron.spring.project.store.ProjectStore;


@Service
public class ProjectServiceImpl implements ProjectService{

	@Autowired
	private ProjectStore store;

	@Override
	public List<Employee> selectInsertProjectSearchList(Map<String, Object> map) {
		List<Employee> eList = store.selectInsertProjectSearchList(map);
		return eList;	
	}

	@Override
	public int insertProjectRegister(Project project) {
		int result = store.insertProjectRegister(project);
		return result;
	}

	@Override
	public int insertProjectMemberList(Map<String, Object> map) {
		int result = store.insertProjectMemberList(map);
		return result;
	}

	@Override
	public Project selectProjectOne(Project project) {
		Project newProject = store.selectProjectOne(project);
		return newProject;
	}

	@Override
	public List<Project> selectProjectList(Map<String, Object> map) {
		List<Project> projectList = store.selectProjectList(map);
		return projectList;
	}

	@Override
	public List<EmpProject> selectMemberProjectList(Map<String, Object> map) {
		List<EmpProject> projectList = store.selectMemberProjectList(map);
		return projectList;
	}



}
