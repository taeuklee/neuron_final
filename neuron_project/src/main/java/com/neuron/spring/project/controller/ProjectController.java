package com.neuron.spring.project.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.neuron.spring.project.domain.Employee;
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
	
	
	@ResponseBody
	@RequestMapping(value="insertProjectSearchMemberList.do", method=RequestMethod.POST)
	public void insertProjectSearchMemberList(
				@RequestParam String searchText
				,HttpServletResponse response
			) throws JsonIOException, IOException {
		System.out.println(searchText);
		List<Employee> eList = service.selectInsertProjectSearchList(searchText);
		
		for(int i = 0 ; i < eList.size(); i++) {
				System.out.println(eList.get(i));
		}
		
		if(!eList.isEmpty()) {
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(eList, response.getWriter());
		}else {
			System.out.println("데이터가 없습니다");
		}
	}
	
	@RequestMapping(value="insertProjectRegister.do", method=RequestMethod.POST)
	public String insertProjectRegister(
				HttpServletRequest request
				) {
		String[] empNoList = request.getParameterValues("empNo");
		for(int i = 0; i < empNoList.length; i++) {
			Integer.parseInt(empNoList[i]);
			System.out.println(empNoList[i]);
		}
		
		return "";
	}
}
