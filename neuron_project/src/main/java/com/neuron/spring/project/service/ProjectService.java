package com.neuron.spring.project.service;

import java.util.List;
import java.util.Map;

import com.neuron.spring.project.domain.Employee;

public interface ProjectService {

	public List<Employee> selectInsertProjectSearchList(Map<String, Object> map); 
}
