package com.neuron.spring.dept.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.neuron.spring.dept.domain.Dept;
import com.neuron.spring.dept.domain.Team;
import com.neuron.spring.dept.service.DeptService;

@Controller
public class DeptController {
	
	@Autowired
	private DeptService service;
	
	// 부서 리스트 조회
//	@RequestMapping(value="deptListView.do", method=RequestMethod.GET)
//	public String ShowDeptList(Model model) {
//		try {
//			List<Dept> dList = service.printAllDept();
//			if(!dList.isEmpty()) {
//				model.addAttribute("dList",dList);
//			}else {
//				model.addAttribute("dList",null);
//			}
//			return "dept/deptListView";
//		}catch(Exception e) {
//			model.addAttribute("msg", e.toString());
//			return "common/errorPage";
//		}
//	}
	
	//팀 조회
//	@RequestMapping(value="deptListView.do", method=RequestMethod.GET)
//	public String ShowTeamList(Model model) {
//		try {
//			List<Team> dList = service.printAllTeam();
//			if(!dList.isEmpty()) {
//				model.addAttribute("tList",dList);
//			}else {
//				model.addAttribute("tList",null);
//			}
//			return "dept/deptListView";
//		}catch(Exception e) {
//			model.addAttribute("msg", e.toString());
//			return "common/errorPage";
//		}
//	}
	
	@RequestMapping(value="deptListView.do", method=RequestMethod.GET)
	public String deptListView() {
		return "dept/deptListView";
	}
	
	@RequestMapping(value="deptAddView.do", method=RequestMethod.GET)
	public String deptAddView() {
		return "dept/deptAddView";
	}
	
	@RequestMapping(value="deptModifyView.do", method=RequestMethod.GET)
	public String deptModifyView() {
		return "dept/deptModifyView";
	}
	

	
	// 부서 추가
	
	// 부서 수정
	
	// 부서 삭제
	
	

}
