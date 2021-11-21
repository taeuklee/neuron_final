package com.neuron.spring.admin.project.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neuron.spring.admin.project.domain.Project;
import com.neuron.spring.admin.project.service.AdminProjectService;
import com.neuron.spring.admin.project.store.AdminProjectStore;

@Service
public class AdminProjectServiceImple implements AdminProjectService{
	
	@Autowired
	private AdminProjectStore store;

	@Override
	public List<Project> printAllProject() {
		List<Project> pList = store.selectAllProject();
		return pList;
	}

	@Override
	public List<Project> printOkProject(String key) {
		List<Project> pList = store.selectOkProject(key);
		return pList;
	}

	@Override
	public List<Project> printNoProject(String key) {
		List<Project> pList = store.selectNoProject(key);
		return pList;
	}

	@Override
	public int adminOkUpdate(Project project) {
		int result = store.adminOkUpdate(project);
		return result;
	}

	@Override
	public int removeProject(int projectNo) {
		int result = store.removeProject(projectNo);
		return result;
	}

}
