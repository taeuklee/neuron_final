package com.neuron.spring.empCalendar.service;

import java.util.List;

import com.neuron.spring.empCalendar.domain.EmpCalendar;

public interface EmpCalendarService {

	public List<EmpCalendar> selectEmpCalendarList(int empNo);
	public int insertEmpCalendarEvent(EmpCalendar eCalendar);
	public EmpCalendar selectEventDetail(int calNo);
	public int updateEmpCalendarEvent(EmpCalendar eCalendar);
	public int deleteEmpCalendarEvent(EmpCalendar eCalendar);
}
