package com.neuron.spring.project.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neuron.spring.project.domain.Employee;
import com.neuron.spring.project.service.ProjectService;
import com.neuron.spring.project.store.ProjectStore;


@Service
public class ProjectServiceImpl implements ProjectService{

	@Autowired
	private ProjectStore store;

	@Override
	public List<Employee> selectInsertProjectSearchList(String searchText) {
		List<Employee> eList = store.selectInsertProjectSearchList(searchText);
		return eList;
	}
}
