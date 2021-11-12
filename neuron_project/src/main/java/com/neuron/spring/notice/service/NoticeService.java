package com.neuron.spring.notice.service;

import java.util.List;

import com.neuron.spring.notice.domain.Notice;

public interface NoticeService {

	List<Notice> printAll();
	
	int registerNotice(Notice notice);


}
