package com.neuron.spring.notice.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neuron.spring.notice.domain.Notice;
import com.neuron.spring.notice.domain.PageInfo;
import com.neuron.spring.notice.service.NoticeService;
import com.neuron.spring.notice.store.NoticeStore;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeStore store;
	
	@Override
	public int registerNotice(Notice notice) {
		int result = store.insertNotice(notice);
		return result;
	}

	@Override
	public Notice printOneNotice(int nId) {
		Notice notice = store.selectOneNotice(nId);
		return notice;
	}

	@Override
	public int modifyNotice(Notice notice) {
		int result = store.updateNotice(notice);
		return result;
	}

	@Override
	public int removeNotice(int nId) {
		int result = store.deleteNotice(nId);
		return result;
	}

	@Override
	public int getListCount() {
		int totalCount = store.selectListCount();
		return totalCount;
	}

	@Override
	public List<Notice> printAllNotice(PageInfo pi) {
		List<Notice> nList = store.selectAllNotice(pi);
		return nList;
	}


	
	

}
