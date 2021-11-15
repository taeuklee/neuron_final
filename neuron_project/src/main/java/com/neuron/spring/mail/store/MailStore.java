package com.neuron.spring.mail.store;

import java.util.List;
import java.util.Map;

import com.neuron.spring.attend.domain.PageInfo;
import com.neuron.spring.mail.domain.Mail;


public interface MailStore {
	public int selectListCount(int senderId);
	
	public List<Mail> selectAll(PageInfo pi, Map senderId);
}
