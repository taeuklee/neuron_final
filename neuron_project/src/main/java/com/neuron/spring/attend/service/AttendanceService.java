package com.neuron.spring.attend.service;

import java.util.List;

import com.neuron.spring.attend.domain.Attendance;
import com.neuron.spring.attend.domain.PageInfo;

public interface AttendanceService {
	public int getListCount();

	public List<Attendance> printAll(PageInfo pi);
}
