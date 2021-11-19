package com.neuron.spring.mail.store;

import java.util.List;

import com.neuron.spring.attend.domain.PageInfo;
import com.neuron.spring.mail.domain.Mail;


public interface MailStore {
	public int selectListCount(String email);
	public int selectOutListCount(String email);
	public int selectChkOutListCount(String email);
	
	public List<Mail> selectAll(PageInfo pi, String email);
	public List<Mail> selectAllOut(PageInfo pi, String email);
	public List<Mail> selectAllChkOut(PageInfo pi, String email);

	public int postMail(Mail mail);

	public Mail selectOne(int mailNo);

	public int deleteReceiveMail(int mailNo);
	public int deleteSendMail(int mailNo);

	public String selectOneEmail(int empNo);
	public int addMail(int mailNo);
}
