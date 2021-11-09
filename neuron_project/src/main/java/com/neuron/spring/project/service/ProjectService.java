package com.neuron.spring.project.service;

import java.util.List;

import com.neuron.spring.project.domain.Employee;

public interface ProjectService {

	public List<Employee> selectInsertProjectSearchList(String searchText); 
}
