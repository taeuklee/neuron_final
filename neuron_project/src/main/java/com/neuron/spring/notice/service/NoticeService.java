package com.neuron.spring.notice.service;

import java.util.List;

import com.neuron.spring.notice.domain.Notice;
import com.neuron.spring.notice.domain.PageInfo;

public interface NoticeService {

	
	int registerNotice(Notice notice);

	Notice printOneNotice(int nId);

	int modifyNotice(Notice notice);

	int removeNotice(int nId);

	int getListCount();

	List<Notice> printAllNotice(PageInfo pi);


}
