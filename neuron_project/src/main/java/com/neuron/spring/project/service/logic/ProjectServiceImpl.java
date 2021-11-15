package com.neuron.spring.project.service.logic;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neuron.spring.project.domain.EmpProject;
import com.neuron.spring.project.domain.Employee;
import com.neuron.spring.project.domain.Project;
import com.neuron.spring.project.domain.ProjectCalendar;
import com.neuron.spring.project.domain.ProjectMember;
import com.neuron.spring.project.domain.ProjectTask;
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

	@Override
	public Project selectProject(int projectNo) {
		Project project = store.selectProjectOne(projectNo);
		return project;
	}

	@Override
	public Employee selectMaster(int masterEmpNo) {
		Employee master = store.selectMaster(masterEmpNo);
		return master;
	}

	@Override
	public List<ProjectMember> selectMemberList(int projectNo) {
		List<ProjectMember> memberList = store.selectMemberList(projectNo);
		return memberList;
	}

	@Override
	public ProjectTask selectProjectTask(int projectNo) {
		ProjectTask projectTask = store.selectProjectTask(projectNo);
		return projectTask;
	}

	@Override
	public List<ProjectCalendar> selectProjectCalendar(int projectNo) {
		List<ProjectCalendar> projectCalendar = store.selectProjectCalendar(projectNo);
		return projectCalendar;
	}



}
