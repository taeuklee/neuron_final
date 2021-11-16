package com.neuron.spring.empCalendar.controller;

import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.neuron.spring.empCalendar.domain.EmpCalendar;
import com.neuron.spring.empCalendar.service.EmpCalendarService;
import com.neuron.spring.employee.service.EmployeeService;

@Controller
public class EmpCalendarController {

	@Autowired
	private EmpCalendarService service;

	@RequestMapping(value = "moveSelectMemberCalendar.do", method = RequestMethod.GET)
	public ModelAndView moveSelectMemberCalendar(ModelAndView mv, @RequestParam(value = "empNo") int empNo) {
		mv.addObject("empNo", empNo);
		mv.setViewName("memberCalendar/selectMemberCalendar");
		return mv;

	}

	@RequestMapping(value = "selectMemberCalendar.do", method = RequestMethod.POST)
	public void moveEmpCalendar(@RequestParam(value = "empNo") int empNo, ModelAndView mv,
			HttpServletResponse response) {
		List<EmpCalendar> empCalendar = service.selectEmpCalendarList(empNo);
		try {
			// Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			Gson gson = new Gson();
			gson.toJson(empCalendar, response.getWriter());
			//mv.addObject("empCalendarList", empCalendar);
			// mv.addObject("empNo", empNo);
			// mv.addObject("empCalendar", empCalendar);
			// mv.setViewName("memberCalendar/selectMemberCalendar");
		} catch (Exception e) {
			// mv.addObject("msg", "실패하였습니다");
			// mv.setViewName("common/errorPage");
		}
		// return mv;
	}

	@RequestMapping(value = "moveInsertEvent.do", method = RequestMethod.GET)
	public String moveInsertEvent() {
		return "memberCalendar/insertEvent";
	}

	@ResponseBody
	@RequestMapping(value = "insertEmpCalendar.do", method = RequestMethod.GET)
	public String insertEmpCalendarEvent(@RequestParam(value = "eventTitle") String eventTitle,
			@RequestParam(value = "startTime") String startTime, @RequestParam(value = "endTime") String endTime,
			@RequestParam(value = "startTimeDetail") String startTimeDetail,
			@RequestParam(value = "endTimeDetail") String endTimeDetail, @RequestParam(value = "empNo") int empNo) {
		System.out.println(eventTitle);
		System.out.println(startTime);
		System.out.println(endTime);
		System.out.println(startTimeDetail);
		System.out.println(endTimeDetail);
		String eventStartTime = "";
		String eventEndTime = "";
		if (startTimeDetail.equals("")) {
			eventStartTime = startTime;
		} else {
			eventStartTime = startTime + "T" + startTimeDetail;
		}
		if (endTimeDetail.equals("")) {
			eventEndTime = endTime + "T23:59:00";
		} else {
			eventEndTime = endTime + "T" + endTimeDetail;
		}
		System.out.println(eventStartTime);
		System.out.println(eventEndTime);
		EmpCalendar eCalendar = new EmpCalendar();
		eCalendar.setEmpCalendarEventTitle(eventTitle);
		eCalendar.setEmpCalendarStartTime(eventStartTime);
		eCalendar.setEmpCalendarEndTime(eventEndTime);
		eCalendar.setEmpNo(empNo);
		int result = service.insertEmpCalendarEvent(eCalendar);
		if (result > 0) {
			return "success";
		} else {
			return "false";
		}
	}

	@ResponseBody
	@RequestMapping(value = "selectEventDetail.do", method = RequestMethod.POST)
	public String selectEventDetail(ModelAndView mv, @RequestParam(value = "empNo") int empNo,
			@RequestParam(value = "calNo") int calNo) {
		System.out.println("empNo:" + empNo);
		System.out.println("calNo:" + calNo);
		return "success";
	}

	@RequestMapping(value = "openEventDetail.do", method = RequestMethod.GET)
	public ModelAndView openEventDetail(@RequestParam(value = "calNo") int calNo, ModelAndView mv) {
		EmpCalendar detailEvent = service.selectEventDetail(calNo);
		String start = detailEvent.getEmpCalendarStartTime();
		String end = detailEvent.getEmpCalendarEndTime();
		int endIdx = 0;
		int startIdx = 0;
		String startDay = "";
		String startTime = "";
		String endDay = "";
		String endTime = "";
		if (start.contains("T")) {
			startIdx = detailEvent.getEmpCalendarStartTime().indexOf("T");
			System.out.println("T 위치 :" + endIdx + "," + startIdx);
			startDay = start.substring(0, startIdx);
			startTime = start.substring(startIdx + 1);
		} else {
			startDay = start;
		}
		if(end.contains("T")){
			endIdx = detailEvent.getEmpCalendarEndTime().indexOf("T");
			endDay = end.substring(0, endIdx);
			endTime = end.substring(endIdx + 1);
		}else {
			endDay = end;			
		}
		mv.addObject("calNo", calNo);
		mv.addObject("startDay", startDay);
		mv.addObject("startTime", startTime);
		mv.addObject("endDay", endDay);
		mv.addObject("endTime", endTime);
		mv.addObject("eventDetail", detailEvent);
		mv.setViewName("memberCalendar/eventDetail");
		return mv;
	}

	@ResponseBody
	@RequestMapping(value = "updateEmpCalendar.do", method = RequestMethod.GET)
	public String updateEmpCalendarEvent(@RequestParam(value = "eventTitle") String eventTitle,
			@RequestParam(value = "startTime") String startTime, @RequestParam(value = "endTime") String endTime,
			@RequestParam(value = "startTimeDetail") String startTimeDetail,
			@RequestParam(value = "endTimeDetail") String endTimeDetail, @RequestParam(value = "empNo") int empNo,
			@RequestParam(value = "calNo") int calNo) {
		System.out.println(eventTitle);
		System.out.println(startTime);
		System.out.println(endTime);
		System.out.println(startTimeDetail);
		System.out.println(endTimeDetail);
		String eventStartTime = "";
		String eventEndTime = "";
		if (startTimeDetail.equals("")) {
			eventStartTime = startTime;
		} else {
			eventStartTime = startTime + "T" + startTimeDetail;
		}
		if (endTimeDetail.equals("")) {
			eventEndTime = endTime;
		} else {
			eventEndTime = endTime + "T" + endTimeDetail;
		}
		System.out.println(eventStartTime);
		System.out.println(eventEndTime);
		EmpCalendar eCalendar = new EmpCalendar();
		eCalendar.setEmpCalendarEventTitle(eventTitle);
		eCalendar.setEmpCalendarStartTime(eventStartTime);
		eCalendar.setEmpCalendarEndTime(eventEndTime);
		eCalendar.setEmpNo(empNo);
		eCalendar.setEmpCalendarNo(calNo);
		int result = service.updateEmpCalendarEvent(eCalendar);
		if (result > 0) {
			return "success";
		} else {
			return "false";
		}
	}

	@ResponseBody
	@RequestMapping(value = "deleteEmpCalendar.do", method = RequestMethod.GET)
	public String deleteEmpCalendar(@RequestParam(value = "empNo") int empNo,
			@RequestParam(value = "calNo") int calNo) {
		System.out.println(empNo);
		System.out.println(calNo);
		EmpCalendar eCalendar = new EmpCalendar();
		eCalendar.setEmpCalendarNo(calNo);
		eCalendar.setEmpNo(empNo);
		int result = service.deleteEmpCalendarEvent(eCalendar);
		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
}
