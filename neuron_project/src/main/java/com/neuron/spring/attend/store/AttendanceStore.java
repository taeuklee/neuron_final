package com.neuron.spring.attend.store;

import java.util.List;

import com.neuron.spring.attend.domain.Attendance;
import com.neuron.spring.attend.domain.PageInfo;
import com.neuron.spring.attend.domain.Search;
import com.neuron.spring.employee.domain.Employee;

public interface AttendanceStore {

	public int selectListCount(int empNo);
	public int selectListCount();
	
	public List<Attendance> selectAll(PageInfo pi,int empNo);
	public List<Attendance> searchList(Search search);
	
	public Attendance selectOne(int empNo);
	
	public int putTime(Attendance attend);
	public int putFinishTime(Attendance attend);

	public int selectListCountAbs(int empNo);
	public int selectListCountLate(int empNo);
	public int selectListCountNor(int empNo);

	public int checkDate(int empNo);


//	public List<Employee> selectAllEmpList(PageInfo pi);


}
