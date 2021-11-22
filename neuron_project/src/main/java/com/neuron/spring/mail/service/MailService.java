package com.neuron.spring.mail.service;

import java.util.List;

import com.neuron.spring.attend.domain.PageInfo;
import com.neuron.spring.employee.domain.Dept;
import com.neuron.spring.employee.domain.Employee;
import com.neuron.spring.employee.domain.Team;
import com.neuron.spring.mail.domain.Mail;
import com.neuron.spring.mail.domain.Search;

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

	public int removeReceiveMail(String mailNo);
	public int removeSendMail(String mailNo);

	public int updateMail(int mailNo);

	public List<Employee> printAllEmpList(PageInfo pi);

	public List<Team> printAllTeamList();

	public List<Dept> printAllDeptList();

	public List<Employee> printSearchEmpAll(PageInfo pi, Search search);

	public int getListCount();

	public List<Employee> printAll(PageInfo pi);

	public List<Mail> printmSearchAll(PageInfo pi,Search search);

	public List<Mail> printMainMailList(String email);



}
