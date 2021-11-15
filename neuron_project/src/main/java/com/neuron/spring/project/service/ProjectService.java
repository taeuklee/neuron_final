package com.neuron.spring.project.service;

import java.util.List;
import java.util.Map;

import com.neuron.spring.project.domain.EmpProject;
import com.neuron.spring.project.domain.Employee;
import com.neuron.spring.project.domain.Project;
import com.neuron.spring.project.domain.ProjectCalendar;
import com.neuron.spring.project.domain.ProjectMember;
import com.neuron.spring.project.domain.ProjectTask;

public interface ProjectService {

	public List<Employee> selectInsertProjectSearchList(Map<String, Object> map);

	public int insertProjectRegister(Project project);

	public int insertProjectMemberList(Map<String, Object> map);

	public Project selectProjectOne(Project project);

	public List<Project> selectProjectList(Map<String, Object> map);

	public List<EmpProject> selectMemberProjectList(Map<String, Object> map);

	public Project selectProject(int projectNo);

	public Employee selectMaster(int masterEmpNo);

	public List<ProjectMember> selectMemberList(int projectNo);

	public ProjectTask selectProjectTask(int projectNo);

	public List<ProjectCalendar> selectProjectCalendar(int projectNo);

}
