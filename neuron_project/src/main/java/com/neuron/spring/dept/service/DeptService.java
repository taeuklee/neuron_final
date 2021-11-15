package com.neuron.spring.dept.service;

import java.util.List;

import com.neuron.spring.dept.domain.Dept;
import com.neuron.spring.dept.domain.Team;

public interface DeptService {

	List<Dept> printAllDept();

	List<Team> printAllTeam();

}
