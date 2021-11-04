package com.neuron.spring.project.service.logic;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neuron.spring.project.service.ProjectService;
import com.neuron.spring.project.store.ProjectStore;


@Service
public class ProjectServiceImpl implements ProjectService{

	@Autowired
	private ProjectStore store;
}
