package com.neuron.spring.holiday.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.neuron.spring.approval.domain.Document;
import com.neuron.spring.attend.domain.Attendance;
import com.neuron.spring.attend.domain.PageInfo;
import com.neuron.spring.attend.domain.Pagination;
import com.neuron.spring.employee.domain.Employee;
import com.neuron.spring.holiday.service.HolidayService;

@Controller
public class HolidayController {
	
	@Autowired
	private HolidayService service;

	@ResponseBody
	@RequestMapping(value="holidayList.do", method=RequestMethod.GET)
	public ModelAndView holidayListView(
			ModelAndView mv
			,HttpServletRequest request
			,HttpSession session
			,@RequestParam(value="page", required=false) Integer page
			,@RequestParam(value="year", required=false) Integer year
			) {
		
		session = request.getSession();
		Employee employee =new Employee();
		employee = (Employee)session.getAttribute("loginEmployee");
		
		int empNo = employee.getEmpNo();
		int currentPage = (page != null) ? page:1;
		int totalCount = service.getListCount(empNo);
		
		if(year != null) {
			Document doc = new Document();
			doc.setPresentYear(year);
		}
		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
		List<Document> dList = service.printAll(pi, empNo); //pi 넣어야해
		List<Employee> eList = service.printEmpAll(empNo);
		
		if(!dList.isEmpty()) {
			mv.addObject("eList", eList);
			mv.addObject("dList", dList);
			mv.addObject("pi",pi);
			mv.addObject("totalCount", totalCount);
			mv.setViewName("attend/holidayList");
		}else {
			mv.setViewName("attend/holidayList");
		}
		return mv;
		
	}
}
