package com.neuron.spring.mail.service.logic;

import java.util.List;
import java.util.Map;

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
	public int getListCount(int receiverId) {
		int totalCount = store.selectListCount(receiverId);
		return totalCount;
	}

	
	@Override
	public List<Mail> printAll(PageInfo pi, int receiverId) {
		List<Mail> mList = store.selectAll(pi, receiverId);
		return mList;
	}


}
