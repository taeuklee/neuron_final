package com.neuron.spring.notice.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neuron.spring.notice.domain.Notice;
import com.neuron.spring.notice.service.NoticeService;
import com.neuron.spring.notice.store.NoticeStore;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeStore store;

	@Override
	public List<Notice> printAll() {
		List<Notice> nList = store.selectAll();
		return nList;
	}
	
	@Override
	public int registerNotice(Notice notice) {
		int result = store.insertNotice(notice);
		return result;
	}


	
	

}
