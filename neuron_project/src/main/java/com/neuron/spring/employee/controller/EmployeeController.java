package com.neuron.spring.employee.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	

}
