package com.neuron.spring.mail.store;

import java.util.List;

import com.neuron.spring.mail.domain.PageInfo;
import com.neuron.spring.employee.domain.Dept;
import com.neuron.spring.employee.domain.Employee;
import com.neuron.spring.employee.domain.Team;
import com.neuron.spring.mail.domain.Mail;
import com.neuron.spring.mail.domain.Search;


public interface MailStore {
	public String selectOneEmail(int empNo);
	
	public int selectListCount();
	public int selectListCount(String email);
	public int selectOutListCount(String email);
	public int selectChkOutListCount(String email);
	
	public List<Mail> selectAll(PageInfo pi, String email);
	public List<Mail> selectAllOut(PageInfo pi, String email);
	public List<Mail> selectAllChkOut(PageInfo pi, String email);
	public List<Mail> selectmSearchAll(PageInfo pi,Search search);
	public List<Mail> selectMainMailList(String email);
	public List<Employee> selectAll(PageInfo pi);
	
	public int postMail(Mail mail);

	public Mail selectOne(int mailNo);

	public int deleteReceiveMail(String mailNo);
	public int deleteSendMail(String mailNo);
	public int addMail(int mailNo);

//  public List<Employee> selectAllEmpList(PageInfo pi);
//	public List<Team> selectAllTeamList();
//	public List<Dept> selectAllDeptList();
//	public List<Employee> selectSearchEmpAll(PageInfo pi,Search search);
}

