package com.neuron.spring.admin.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.neuron.spring.project.service.ProjectService;

@Controller
public class AdminProContoller {
	
	
	@RequestMapping(value="proListView.do", method=RequestMethod.GET)
	public String adminProjectList() {
		return "adminProject/proListView";
	}
	
	

}
