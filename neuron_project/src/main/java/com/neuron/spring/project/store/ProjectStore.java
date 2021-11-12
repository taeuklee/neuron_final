package com.neuron.spring.project.store;

import java.util.List;
import java.util.Map;

import com.neuron.spring.project.domain.EmpProject;
import com.neuron.spring.project.domain.Employee;
import com.neuron.spring.project.domain.Project;

public interface ProjectStore {

	public List<Employee> selectInsertProjectSearchList(Map<String, Object> map);

	public int insertProjectRegister(Project project);

	public int insertProjectMemberList(Map<String, Object> map);

	public Project selectProjectOne(Project project);

	public List<Project> selectProjectList(Map<String, Object> map);

	public List<EmpProject> selectMemberProjectList(Map<String, Object> map);
}
