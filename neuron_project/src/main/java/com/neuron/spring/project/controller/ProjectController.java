package com.neuron.spring.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.neuron.spring.project.service.logic.ProjectServiceImpl;

@Controller
public class ProjectController {

	@Autowired
	private ProjectServiceImpl service;
	
	@RequestMapping(value="createProject.do", method=RequestMethod.GET)
	public String createProjectForm() {
		return "project/insertProjectForm";
	}
	
	
	@RequestMapping(value="selectProjectMain.do", method=RequestMethod.GET)
	public String selectProjectMain() {
		return "project/selectProjectMainPage";
	}
	
	@RequestMapping(value="selectProjectMainWork.do", method=RequestMethod.GET)
	public String selectProjectMainWork() {
		return "project/selectProjectMainWork";
	}
	
	@RequestMapping(value="moveInsertMainWorkForm.do", method=RequestMethod.GET)
	public String moveInsertMainWorkForm() {
		return "project/insertProjectMainWork";
	}
	
	@RequestMapping(value="moveUpdateMainWorkForm.do", method=RequestMethod.GET)
	public String moveUpdateMainWorkForm() {
		return "project/updateProjectMainWork";
	}
	
	@RequestMapping(value="selectProjectMemberList.do", method=RequestMethod.GET)
	public String selectProjectMemberList() {
		return "project/selectProjectMemberList";
	}
	
	@RequestMapping(value="moveInviteMember.do", method=RequestMethod.GET)
	public String moveInviteMember() {
		return "project/inviteMember";
	}
	
	@RequestMapping(value="moveTaskMember.do", method=RequestMethod.GET)
	public String moveTaskMember() {
		return "project/insertTaskMemberList";
	}
	
}
