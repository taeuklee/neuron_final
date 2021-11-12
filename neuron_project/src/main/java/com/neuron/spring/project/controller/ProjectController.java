package com.neuron.spring.project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.neuron.spring.project.domain.EmpProject;
import com.neuron.spring.project.domain.Employee;
import com.neuron.spring.project.domain.Project;
import com.neuron.spring.project.service.ProjectService;
import com.neuron.spring.project.service.logic.ProjectServiceImpl;

@Controller
public class ProjectController {

	@Autowired
	private ProjectService service;
	
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
				,@RequestParam(value="empNo") int empNo
				,HttpServletResponse response
			) throws JsonIOException, IOException {
		System.out.println(searchText);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("empNo", empNo);
		map.put("searchText", searchText);
		List<Employee> eList = service.selectInsertProjectSearchList(map);
		
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
				,@RequestParam(value="projectTitle") String projectTitle				
				,@RequestParam(value="projectContents") String projectContents
				,@RequestParam(value="projectMaster") int projectMaster
				,HttpServletResponse respones
				) throws IOException {
		String[] empNoList = request.getParameterValues("empNo");
		int [] empNoList2 = Arrays.stream(empNoList).mapToInt(Integer::parseInt).toArray();
		for(int i = 0; i < empNoList.length; i++) {
			System.out.println(empNoList2[i]);
		}
		Project project = new Project();
		project.setProjectContents(projectContents);
		project.setProjectTitle(projectTitle);
		project.setProjectMaster(projectMaster);
		int result = service.insertProjectRegister(project);
		PrintWriter out = respones.getWriter();
		if(result > 0) {
			System.out.println("프로젝트 등록성공");
			Project newProject = service.selectProjectOne(project);
			int projectNo = newProject.getProjectNo();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("projectNo", projectNo);
			map.put("empNoList", empNoList2);
			int insertMemberResult = service.insertProjectMemberList(map);
			if(insertMemberResult > 0) {
				out.println("<script>alert('프로젝트 등록이 성공하였습니다');</script>");
				out.flush();				
			}else {
				out.println("<script>alert('프로젝트 등록은 성공하였지만 멤버등록이 실패했습니다');</script>");
				out.flush();				
			}
		}else{
			System.out.println("프로젝트 등록실패");
			out.println("<script>alert('프로젝트 등록이 실패하였습니다');</script>");
			out.flush();
		}
		return "home";
	}
	
	
	@RequestMapping(value="selectProjectList.do", method=RequestMethod.GET)
	public void selectProjectList(
			@RequestParam(value="empNo") int empNo
			,ModelAndView mv
			,HttpServletResponse response
			) throws JsonIOException, IOException {
		System.out.println("마스터:"+empNo);
		Map<String, Object> map = new HashMap<String, Object>();
		String info = "Y";
		map.put("empNo", empNo);
		map.put("info", info);
		List<Project> projectList = service.selectProjectList(map);
		if(!projectList.isEmpty()) {
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(projectList, response.getWriter());
//			mv.addObject("projectList", projectList);
		}
	}
	
	@RequestMapping(value="selectMemberProjectList.do", method=RequestMethod.GET)
	public void selectMemberProjectList(
			@RequestParam(value="empNo") int empNo
			,HttpServletResponse response
			) throws JsonIOException, IOException {
		System.out.println("멤버:" + empNo);
		Map<String, Object> map = new HashMap<String, Object>();
		String info = "Y";
		map.put("empNo", empNo);
		map.put("info", info);
		List<EmpProject> projectList = service.selectMemberProjectList(map);
		if(!projectList.isEmpty()) {
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(projectList, response.getWriter());
//			mv.addObject("projectList", projectList);
		}
	}
	
	
	@RequestMapping(value="selectProjectDetail.do", method=RequestMethod.GET)
	public String selectProjectDetail(
				@RequestParam(value="projectNo") int projectNo
			) {
		System.out.println(projectNo);
		return "";
	}
}
