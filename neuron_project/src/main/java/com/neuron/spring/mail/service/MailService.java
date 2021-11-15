package com.neuron.spring.mail.service;

import java.util.List;
import java.util.Map;

import com.neuron.spring.attend.domain.PageInfo;
import com.neuron.spring.mail.domain.Mail;

public interface MailService {
	public int getListCount(int receiverId);
	
	public List<Mail> printAll(PageInfo pi, int receiverId);

}
