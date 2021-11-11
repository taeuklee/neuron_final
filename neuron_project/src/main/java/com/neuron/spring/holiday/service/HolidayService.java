package com.neuron.spring.holiday.service;

import java.util.List;

import com.neuron.spring.approval.domain.Document;
import com.neuron.spring.attend.domain.Attendance;
import com.neuron.spring.attend.domain.PageInfo;

public interface HolidayService {

	public int getListCount();

//	public List<Document> printAll(PageInfo pi);

	public List<Attendance> printAll();
}
