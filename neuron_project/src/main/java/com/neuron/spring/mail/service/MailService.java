package com.neuron.spring.mail.service;

import java.util.List;

import com.neuron.spring.attend.domain.PageInfo;
import com.neuron.spring.mail.domain.Mail;

public interface MailService {
	public int getListCount(int empNo);
	
	public List<Mail> printAll(PageInfo pi, int empNo);

	public int getOutListCount(int empNo);

	public List<Mail> printAllOut(PageInfo pi, int empNo);

	public int getChkOutListCount(int empNo);

	public List<Mail> printAllChkOut(PageInfo pi, int empNo);

}
