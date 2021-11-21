package com.neuron.spring.admin.project.service;

import java.util.List;

import com.neuron.spring.admin.project.domain.Project;

public interface AdminProjectService {

	List<Project> printAllProject();

	List<Project> printOkProject(String key);

	List<Project> printNoProject(String key);

	int adminOkUpdate(Project project);

	int removeProject(int projectNo);

}
