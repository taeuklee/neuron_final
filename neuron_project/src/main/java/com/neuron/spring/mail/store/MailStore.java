package com.neuron.spring.mail.store;

import java.util.List;
import java.util.Map;

import com.neuron.spring.attend.domain.PageInfo;
import com.neuron.spring.mail.domain.Mail;


public interface MailStore {
	public int selectListCount(int receiverId);
	
	public List<Mail> selectAll(PageInfo pi, int receiverId);
}
