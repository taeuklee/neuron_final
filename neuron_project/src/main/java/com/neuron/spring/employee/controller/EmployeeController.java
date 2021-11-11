package com.neuron.spring.employee.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.neuron.spring.employee.domain.Employee;
import com.neuron.spring.employee.service.EmployeeService;

@Controller
public class EmployeeController {
	
	@Autowired
	private EmployeeService service;
	
	// 로그인
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String employeeLogin(HttpServletRequest request) {
		String empId = request.getParameter("emp-id");
		String empPwd  = request.getParameter("emp-pwd");
				
		Employee empOne = new Employee();
		empOne.setEmpId(empId);
		empOne.setEmpPwd(empPwd);
		
		try {
		Employee loginEmployee = service.loginEmp(empOne);
		if(loginEmployee != null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginEmployee", loginEmployee);
		}
			return "redirect:home.do";
		}catch(Exception e) {
			request.setAttribute("msg", e.toString());
			return "common/errorPage";
				}
		
		}
	
	// 로그아웃
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public String employeeLogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session != null) {
			session.invalidate();
			return "redirect:home.do";
		}else {
			request.setAttribute("msg", "실패");
			return "common/errorPage";
		}
	}
	
	// 사원등록화면 출력
	@RequestMapping(value="enrollView.do", method=RequestMethod.GET)
	public String enrollView() {
		return "employee/empJoin";
	}
	
	// 사원 등록하기
	@RequestMapping(value="empRegister.do", method=RequestMethod.POST) 
		public String empRegister(HttpServletRequest request,
				@ModelAttribute Employee employee,
				@RequestParam("deptCode") String deptCode,
				@RequestParam("teamCode") String teamCode,
				@RequestParam("empId") String empId,
				@RequestParam("empPwd") String empPwd,
				@RequestParam("empName") String empName,
				@RequestParam("empBirth") String empBirth,
				@RequestParam("empPhone") String empPhone,
				@RequestParam("empJob") String empjob,
				@RequestParam("empState") String empState,
				@RequestParam("empEmail") String empEmail,
				@RequestParam("empSubEmail") String empSubEmail,
				@RequestParam("empExnum") String empExnum,
				@RequestParam("empMaster") String empMaster) {
			
			try {
			int result = service.registerEmp(employee);
			if(result > 0) {
			 return "redirect:home.do";
			}else {
				request.setAttribute("msg", "실패");
				return "common/errorPage";
			}
		}catch(Exception e) {
			request.setAttribute("msg", e.toString());
			return "common/errorPage";
		}
	}
	
	// 사원 마이페이지 보기
	@RequestMapping(value="empInfo.do", method=RequestMethod.GET)
	public String myInfoView() {
		return "employee/empInfoModify";
		
		}
	
}
