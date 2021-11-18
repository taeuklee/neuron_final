package com.neuron.spring.mail.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neuron.spring.attend.domain.PageInfo;
import com.neuron.spring.mail.domain.Mail;
import com.neuron.spring.mail.service.MailService;
import com.neuron.spring.mail.store.MailStore;

@Service
public class MailServiceImpl implements MailService{

	@Autowired
	private MailStore store;
	
	@Override
	public int getListCount(int empNo) {
		int totalCount = store.selectListCount(empNo);
		return totalCount;
	}

	
	@Override
	public List<Mail> printAll(PageInfo pi, int empNo) {
		List<Mail> mList = store.selectAll(pi, empNo);
		return mList;
	}


	@Override
	public int getOutListCount(int empNo) {
		int totalCount = store.selectOutListCount(empNo);
		return totalCount;
	}


	@Override
	public List<Mail> printAllOut(PageInfo pi, int empNo) {
		List<Mail> mList = store.selectAllOut(pi, empNo);
		return mList;
	}


	@Override
	public int getChkOutListCount(int empNo) {
		int totalCount = store.selectChkOutListCount(empNo);
		return totalCount;
	}


	@Override
	public List<Mail> printAllChkOut(PageInfo pi, int empNo) {
		List<Mail> mList = store.selectAllChkOut(pi, empNo);
		return mList;
	}


}
