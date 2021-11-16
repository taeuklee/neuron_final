package com.neuron.spring.attend.store;

import java.util.List;

import com.neuron.spring.attend.domain.Attendance;
import com.neuron.spring.attend.domain.PageInfo;

public interface AttendanceStore {

	public int selectListCount(int empNo);

	public List<Attendance> selectAll(PageInfo pi,int empNo);

	public int putTime(Attendance attend);

	public Attendance selectOne(int empNo);

	public int putFinishTime(Attendance attend);


}
