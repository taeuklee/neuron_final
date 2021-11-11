package com.neuron.spring.empCalendar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class EmpCalendarController {

	
	@RequestMapping(value="selectMemberCalendar.do", method=RequestMethod.GET)
	public String moveMemberCalendar() {
		return "memberCalendar/selectMemberCalendar";
	}
	
	@RequestMapping(value="moveInsertEvent.do", method=RequestMethod.GET)
	public String moveInsertEvent() {
		return "memberCalendar/insertEvent";
	}
}
