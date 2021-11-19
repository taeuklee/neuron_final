package com.neuron.spring.mail.service;

import java.util.List;

import com.neuron.spring.attend.domain.PageInfo;
import com.neuron.spring.mail.domain.Mail;

public interface MailService {
	public String printOneEmail(int empNo);
	
	public int getListCount(String email);
	public int getOutListCount(String email);
	public int getChkOutListCount(String email);

	public List<Mail> printAll(PageInfo pi, String email);
	public List<Mail> printAllOut(PageInfo pi, String email);
	public List<Mail> printAllChkOut(PageInfo pi, String email);

	public int registerMail(Mail mail);

	public Mail printOne(int mailNo);

	public int removeReceiveMail(int mailNo);
	public int removeSendMail(int mailNo);

	public int updateMail(int mailNo);


}
