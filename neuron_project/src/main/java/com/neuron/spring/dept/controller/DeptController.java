package com.neuron.spring.dept.controller;

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

import com.neuron.spring.dept.domain.DeptAdmin;
import com.neuron.spring.dept.service.DeptService;
import com.neuron.spring.employee.domain.DeptTeam;

@Controller
public class DeptController {
	
	@Autowired
	private DeptService service;
	
	// 부서 리스트 출력
	@RequestMapping(value="deptListView.do", method=RequestMethod.GET)
	public String ShowDeptList(Model model) {
		try {
			List<DeptAdmin> daList = service.printAllDept();
			System.out.println(daList.size());
			if(!daList.isEmpty()) {
				model.addAttribute("daList",daList);
			}else {
				model.addAttribute("daList",null);
			}
			return "dept/deptListView";
		}catch(Exception e) {
			model.addAttribute("msg", e.toString());
			return "common/errorPage";
		}
	}
	
	// 부서 추가 폼 띄우기
	@RequestMapping(value="deptAddView.do", method=RequestMethod.GET)
	public String deptAddView(Model model) {
		List<DeptAdmin> daList = service.printAllDept();
		model.addAttribute("daList",daList);
		return "dept/deptAddView";
	}
	
	
	// 부서 추가
	@RequestMapping(value="deptRegister.do", method=RequestMethod.POST)
	public String memberRegister(HttpServletRequest request, 
			@ModelAttribute DeptAdmin deptAdmin,
			@RequestParam("deptCode") String deptCode,
			@RequestParam("deptName") String deptName,
			@RequestParam("teamCode") String teamCode,
			@RequestParam("teamName") String teamName) {
		
		try {
			int result = service.registerDept(deptAdmin);
			if(result > 0) {
				return "redirect:deptListView.do";
			}else {
				request.setAttribute("msg", "실패");
				return "common/errorPage";
			}
		}catch(Exception e) {
			request.setAttribute("msg", e.toString());
			return "common/errorPage";
		}
	}
	
	// 부서 디테일 클릭 -> 수정으로 이어짐
	@RequestMapping(value="deptModifyView.do", method=RequestMethod.GET)
	public String deptModifyView(@RequestParam("teamCode") String teamCode, Model model) {
		DeptAdmin deptAdmin  = service.printOneDept(teamCode);
		model.addAttribute("deptAdmin", deptAdmin);
		List<DeptAdmin> daList = service.printAllDept();
		model.addAttribute("daList",daList);
		return "dept/deptModifyView";
	}
	
	
	// 부서 수정
	@RequestMapping(value="deptModify.do", method=RequestMethod.POST)
	public String deptUpdate(
			@ModelAttribute DeptAdmin deptAdmin
			, @RequestParam("deptName") String deptName
			, Model model
			, HttpServletRequest request) {
		HttpSession session = request.getSession();

		try {
			int result = service.deptModify(deptAdmin);
			if(result > 0) {
				
				return "redirect:deptListView.do";
			}else {
				model.addAttribute("msg", "부서 정보 수정 실패!");
				return "common/errorPage";
			}
		} catch(Exception e) {
			model.addAttribute("msg", e.toString());
			return "common/errorPage";
		}
	}
	
	// 팀 수정
	@RequestMapping(value="teamModify.do", method=RequestMethod.POST)
	public String teamUpdate(
			@ModelAttribute DeptAdmin deptAdmin
			, @RequestParam("teamName") String teamName
			, Model model
			, HttpServletRequest request) {
		HttpSession session = request.getSession();

		try {
			int result = service.teamModify(deptAdmin);
			if(result > 0) {
				
				return "redirect:deptListView.do";
			}else {
				model.addAttribute("msg", "부서 정보 수정 실패!");
				return "common/errorPage";
			}
		} catch(Exception e) {
			model.addAttribute("msg", e.toString());
			return "common/errorPage";
		}
	}
	
	
	// 부서 삭제
	  @RequestMapping(value="deptDelete.do", method=RequestMethod.GET)
	  public String deptDelete(@RequestParam("deptCode") String deptCode, Model model) {
	     int result = service.removeDept(deptCode);
	     if(result > 0) {
	        return "redirect:deptListView.do";
	     } else {
	        model.addAttribute("msg", "부서 삭제 실패");
	        return "common/errorPage";
	     }
	  }
	

}
