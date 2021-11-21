package com.neuron.spring.admin.project.store;

import java.util.List;

import com.neuron.spring.admin.project.domain.Project;

public interface AdminProjectStore {

	List<Project> selectAllProject();

	List<Project> selectOkProject(String key);

	List<Project> selectNoProject(String key);

	int adminOkUpdate(Project project);

	int removeProject(int projectNo);


}
