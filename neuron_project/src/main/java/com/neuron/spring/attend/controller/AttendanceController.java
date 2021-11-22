package com.neuron.spring.attend.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.neuron.spring.attend.domain.Attendance;
import com.neuron.spring.attend.domain.PageInfo;
import com.neuron.spring.attend.domain.Pagination;
import com.neuron.spring.attend.domain.Search;
import com.neuron.spring.attend.service.AttendanceService;
import com.neuron.spring.employee.domain.Employee;

@Controller
public class AttendanceController {

	@Autowired
	public AttendanceService service;
	
	@RequestMapping(value="attendanceList.do", method=RequestMethod.GET)
		public ModelAndView attendListView(
		ModelAndView mv
		,HttpServletRequest request
		,HttpSession session
		,@RequestParam(value="page", required=false) Integer page) {
		
		    session = request.getSession();
		    Employee employee = new Employee();
		    employee = (Employee)session.getAttribute("loginEmployee");
		    int empNo = employee.getEmpNo();
		    Attendance attend = service.printOne(empNo);
		    
			int currentPage = (page !=null) ? page: 1;
			int totalCount = service.getListCount(empNo);
			int countAbs = service.getAbsCount(empNo);
			int countLate = service.getLateCount(empNo);
			int count = service.getCount(empNo);
			attend = new Attendance();
			attend.setCountAbs(countAbs);
			attend.setCountLate(countLate);
			attend.setCount(count);
			PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
			List<Attendance> aList = service.printAll(pi, empNo);
			if(!aList.isEmpty()) {
				mv.addObject("aList", aList);
				mv.addObject("pi",pi);
				mv.addObject("attendance", attend);
				
				mv.setViewName("attend/attendanceList");
				
			}else {
				mv.addObject("msg", "게시글 전체조회 실패");
				mv.setViewName("common/errorPage");
			}
			return mv;
	}
	
	@RequestMapping(value="insertStartTime.do", method=RequestMethod.GET)
	public String insertTime(
			Model model
			,HttpServletRequest request
			,HttpSession session
			,HttpServletResponse response) {
		
		session = request.getSession();
		Employee emp = new Employee();
		emp = (Employee)session.getAttribute("loginEmployee");
		
		
		int empNo = emp.getEmpNo(); 
		int hr = LocalDateTime.now().getHour();
		int min = LocalDateTime.now().getMinute();
		int sec = LocalDateTime.now().getSecond();
		String startTime = hr+ ":" + min + ":" + sec;
		
		int check = service.checkDateOne(empNo);
////		Date attendDate = attend.getAttendDate();
////		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+ attendDate);
//		Date date = new Date();
		
	
		if(check != 0) {
			response.setContentType("UTF-8");
			PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script>alert('이미 출근하셨습니다.'); location.href='attendanceList.do';</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			Attendance attend = new Attendance();
			attend.setStartTime(startTime);
			if( hr < 9) {
					attend.setDivision("정상");
			}else {
			 		attend.setDivision("지각");
			}
			attend.setEmpNo(empNo);
			int result = service.insertTime(attend);
			if(result > 0) {
				model.addAttribute("startTime", startTime);
				return "redirect:attendanceList.do";
			}else {
				model.addAttribute("msg", "시간 등록 실패!");
				return "common/errorPage";
			}
		}
		return "attend/attendanceList";
	}
	
	@RequestMapping(value="insertFinishTime.do", method=RequestMethod.GET)
	public String insertFinsihTime(
			Model model
			,HttpServletRequest request
			,HttpSession session
			,HttpServletResponse response) {
		
		session = request.getSession();
		Employee emp = new Employee();
		emp = (Employee)session.getAttribute("loginEmployee");
		
		int empNo = emp.getEmpNo();
		Attendance attend = service.printOne(empNo);
		String startTime = attend.getStartTime();
		
		int hr = LocalDateTime.now().getHour();
		int min = LocalDateTime.now().getMinute();
		int sec = LocalDateTime.now().getSecond();
		String finishTime = hr+ ":" + min + ":" + sec;

		try {
			Date date1  = new SimpleDateFormat("HH:mm:ss").parse(startTime);
			Date date2	= new SimpleDateFormat("HH:mm:ss").parse(finishTime);
			long totalhour = (date2.getTime() - date1.getTime());
			String totalWorkhour = Long.toString(totalhour/1000/60);
			attend.setTotalWorkhour(totalWorkhour);
			model.addAttribute("totalWorkhour", totalWorkhour);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		String finish = attend.getFinishTime();
		if(finish != null) {
//			attend.setFinishTime(finishTime);
			response.setContentType("UTF-8");
			PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script>alert('이미 퇴근하셨습니다.'); location.href='attendanceList.do';</script>");
				out.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			attend.setFinishTime(finishTime);
			int result = service.insertFinishTime(attend);
			if(result > 0) {
				model.addAttribute("finishTime", finishTime);
				return "redirect:attendanceList.do";
			}else {
				model.addAttribute("msg", "시간 등록 실패!");
				return "common/errorPage";
			}
		} 
		return "attend/attendanceList";
	}
	@RequestMapping(value="attendSearch.do", method=RequestMethod.GET)
	public String AttendSearchList(
			@ModelAttribute Search search
			,Model model) {
		List<Attendance> searchList = service.printSearchAll(search);
		if(!searchList.isEmpty()) {
			model.addAttribute("aList", searchList);
			model.addAttribute("search", search);
			return "attend/attendanceList";
		}else {
			model.addAttribute("msg", "공지사항 검색 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping(value="attendAdmin.do", method=RequestMethod.GET)
	public ModelAndView attendAdmin(
			ModelAndView mv
			,@RequestParam(value="page", required=false) Integer page
			,Model model) {
		
		int currentPage = (page != null) ? page:1;
		int totalCount = service.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
		List<Employee> eList = service.printAllEmpList(pi);
		if(!eList.isEmpty()) {
			mv.addObject("eList", eList);
			mv.addObject("pi", pi);
			mv.addObject("totalCount", totalCount);
			mv.setViewName("attend/attendAdmin");
		}else {
			mv.addObject("msg", "게시글 전체조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
}
