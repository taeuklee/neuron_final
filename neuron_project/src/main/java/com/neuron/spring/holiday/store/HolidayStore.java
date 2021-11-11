package com.neuron.spring.holiday.store;

import java.util.List;

import com.neuron.spring.approval.domain.Document;
import com.neuron.spring.attend.domain.Attendance;
import com.neuron.spring.attend.domain.PageInfo;

public interface HolidayStore {
	public int selectListCount();

//	public List<Document> selectAll(PageInfo pi);

	public List<Attendance> selectAll();
}
