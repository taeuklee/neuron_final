package com.neuron.spring.project.store;

import java.util.List;
import java.util.Map;

import com.neuron.spring.project.domain.Employee;

public interface ProjectStore {

	public List<Employee> selectInsertProjectSearchList(Map<String, Object> map);
}
