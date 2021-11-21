package com.neuron.spring.admin.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.neuron.spring.admin.project.domain.Project;
import com.neuron.spring.admin.project.service.AdminProjectService;
import com.neuron.spring.dept.domain.DeptAdmin;
import com.neuron.spring.project.service.ProjectService;

@Controller
public class AdminProContoller {
	
	@Autowired
	private AdminProjectService service;
	
	// 프로젝트 리스트 조회
	@RequestMapping(value="proListView.do", method=RequestMethod.GET)
	public String ShowProjectList(Model model) {
		try {
			List<Project> pList = service.printAllProject();
			if(!pList.isEmpty()) {
				model.addAttribute("pList",pList);
			}else {
				model.addAttribute("pList",null);
			}
			return "adminProject/proListView";
		}catch(Exception e) {
			model.addAttribute("msg", e.toString());
			return "common/errorPage";
		}
	}
	
	//프로젝트 생성 승인 or 반려 처리 목록 가져오기
	@RequestMapping(value="proOkListView.do", method=RequestMethod.GET)
	public String adminProjectOK(Model model) {
		try {
			String key = "N";
			List<Project> pList = service.printOkProject(key);
			if(!pList.isEmpty()) {
				model.addAttribute("pList",pList);
			}else {
				model.addAttribute("pList",null);
			}
			return "adminProject/proOkListView";
		}catch(Exception e) {
			model.addAttribute("msg", e.toString());
			return "common/errorPage";
		}
		
	}
	
	//승인 or 반려 처리
	@RequestMapping(value="projectOk.do", method=RequestMethod.POST)
	public String adminOkUpdate(
			@ModelAttribute Project project
			, @RequestParam("projectInsertRequest") String projectInsertRequest
			, Model model
			, HttpServletRequest request) {
		HttpSession session = request.getSession();
		try {
			int result = service.adminOkUpdate(project);
			if(result > 0) {
				return "redirect:proOkListView.do";
			}else {
				model.addAttribute("msg", "승인 처리 실패!");
				return "common/errorPage";
			}
		} catch(Exception e) {
			model.addAttribute("msg", e.toString());
			return "common/errorPage";
		}
	}
	

	
	//프로젝트 삭제 요청 - 리스트 출력
	@RequestMapping(value="proNoListView.do", method=RequestMethod.GET)
	public String adminProjectNo(Model model) {
		try {
			String key = "Y";
			List<Project> pList = service.printNoProject(key);
			if(!pList.isEmpty()) {
				model.addAttribute("pList",pList);
				System.out.println(pList);
			}else {
				model.addAttribute("pList",null);
			}
			return "adminProject/proNoListView";
		}catch(Exception e) {
			model.addAttribute("msg", e.toString());
			return "common/errorPage";
		}

	}
	
	//프로젝트 삭제 처리
	// 부서 삭제
	  @RequestMapping(value="projectDelete.do", method=RequestMethod.GET)
	  public String projectDelete(@RequestParam("projectNo") int projectNo, Model model) {
	     int result = service.removeProject(projectNo);
	     if(result > 0) {
	        return "redirect:proNoListView.do";
	     } else {
	        model.addAttribute("msg", "부서 삭제 실패");
	        return "common/errorPage";
	     }
	  }

}
