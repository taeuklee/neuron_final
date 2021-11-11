package com.neuron.spring.empCalendar.store;

import java.util.List;

import com.neuron.spring.empCalendar.domain.EmpCalendar;

public interface EmpCalendarStore {
	
	public List<EmpCalendar> selectEmpCalendarList(int empNo);
	public int insertEmpCalendarEvent(EmpCalendar eCalendar);

}
