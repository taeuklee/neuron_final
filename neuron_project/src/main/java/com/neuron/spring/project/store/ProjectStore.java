package com.neuron.spring.project.store;

import java.util.List;

import com.neuron.spring.project.domain.Employee;

public interface ProjectStore {

	public List<Employee> selectInsertProjectSearchList(String searchText);
}
