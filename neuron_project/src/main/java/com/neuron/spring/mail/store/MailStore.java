package com.neuron.spring.mail.store;

import java.util.List;

import com.neuron.spring.attend.domain.PageInfo;
import com.neuron.spring.mail.domain.Mail;


public interface MailStore {
	public int selectListCount(int empNo);
	
	public List<Mail> selectAll(PageInfo pi, int empNo);

	public int selectOutListCount(int empNo);

	public List<Mail> selectAllOut(PageInfo pi, int empNo);

	public int selectChkOutListCount(int empNo);

	public List<Mail> selectAllChkOut(PageInfo pi, int empNo);
}
