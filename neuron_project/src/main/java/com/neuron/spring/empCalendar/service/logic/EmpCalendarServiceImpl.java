package com.neuron.spring.empCalendar.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neuron.spring.empCalendar.domain.EmpCalendar;
import com.neuron.spring.empCalendar.service.EmpCalendarService;
import com.neuron.spring.empCalendar.store.EmpCalendarStore;
import com.neuron.spring.empCalendar.store.logic.EmpCalendarStoreLogic;

@Service
public class EmpCalendarServiceImpl implements EmpCalendarService{
	
	@Autowired
	private EmpCalendarStore store;

	@Override
	public List<EmpCalendar> selectEmpCalendarList(int empNo) {
		List<EmpCalendar> empCalendarList =store.selectEmpCalendarList(empNo);
		return empCalendarList;
	}

	@Override
	public int insertEmpCalendarEvent(EmpCalendar eCalendar) {
		int result = store.insertEmpCalendarEvent(eCalendar);
		return result;
	}
}
