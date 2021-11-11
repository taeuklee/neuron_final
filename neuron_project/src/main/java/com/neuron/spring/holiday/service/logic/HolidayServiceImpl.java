package com.neuron.spring.holiday.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neuron.spring.approval.domain.Document;
import com.neuron.spring.approval.store.ApprovalStore;
import com.neuron.spring.attend.domain.Attendance;
import com.neuron.spring.attend.domain.PageInfo;
import com.neuron.spring.holiday.service.HolidayService;
import com.neuron.spring.holiday.store.HolidayStore;

@Service
public class HolidayServiceImpl implements HolidayService {

	@Autowired
	private HolidayStore hStore;
	
//	@Autowired
//	private ApprovalStore aStore;
	
	@Override
	public int getListCount() {
		int totalCount = hStore.selectListCount();
		return totalCount;
	}

//	@Override
//	public List<Document> printAll(PageInfo pi) {
//		List<Document> dList = hStore.selectAll(pi);
//		return dList;
//	}

	@Override
	public List<Attendance> printAll() {
		List<Attendance> dList = hStore.selectAll();
		return dList;
	}

	

}
