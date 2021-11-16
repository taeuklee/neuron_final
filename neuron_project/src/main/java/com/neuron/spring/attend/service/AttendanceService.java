package com.neuron.spring.attend.service;

import java.util.List;

import com.neuron.spring.attend.domain.Attendance;
import com.neuron.spring.attend.domain.PageInfo;

public interface AttendanceService {
	public int getListCount(int empNo);

	public List<Attendance> printAll(PageInfo pi, int empNo);

	public int insertTime(Attendance attend);

	public Attendance printOne(int empNo);

	public int insertFinishTime(Attendance attend);

}
