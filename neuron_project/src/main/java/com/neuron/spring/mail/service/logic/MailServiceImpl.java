package com.neuron.spring.mail.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neuron.spring.attend.domain.PageInfo;
import com.neuron.spring.employee.domain.Dept;
import com.neuron.spring.employee.domain.Employee;
import com.neuron.spring.employee.domain.Team;
import com.neuron.spring.employee.store.EmployeeStore;
import com.neuron.spring.mail.domain.Mail;
import com.neuron.spring.mail.domain.Search;
import com.neuron.spring.mail.service.MailService;
import com.neuron.spring.mail.store.MailStore;

@Service
public class MailServiceImpl implements MailService{

	@Autowired
	private MailStore store;
	
	@Override
	public String printOneEmail(int empNo) {
		String email = store.selectOneEmail(empNo);
		return email;
	}

	
	@Override
	public int getListCount(String email) {
		int totalCount = store.selectListCount(email);
		return totalCount;
	}

	
	@Override
	public List<Mail> printAll(PageInfo pi, String email) {
		List<Mail> mList = store.selectAll(pi, email);
		return mList;
	}


	@Override
	public int getOutListCount(String email) {
		int totalCount = store.selectOutListCount(email);
		return totalCount;
	}


	@Override
	public List<Mail> printAllOut(PageInfo pi, String email) {
		List<Mail> mList = store.selectAllOut(pi, email);
		return mList;
	}


	@Override
	public int getChkOutListCount(String email) {
		int totalCount = store.selectChkOutListCount(email);
		return totalCount;
	}


	@Override
	public List<Mail> printAllChkOut(PageInfo pi, String email) {
		List<Mail> mList = store.selectAllChkOut(pi, email);
		return mList;
	}


	@Override
	public int registerMail(Mail mail) {
		int result = store.postMail(mail);
		return result;
	}


	@Override
	public Mail printOne(int mailNo) {
		Mail mail = store.selectOne(mailNo);
		return mail;
	}


	@Override
	public int removeReceiveMail(String mailNo) {
		int result = store.deleteReceiveMail(mailNo);
		return result;
	}
	@Override
	public int removeSendMail(String mailNo) {
		int result = store.deleteSendMail(mailNo);
		return result;
	}


	@Override
	public int updateMail(int mailNo) {
		int result = store.addMail(mailNo);
		return result;
	}


	@Override
	public List<Employee> printAllEmpList(PageInfo pi) {
		List<Employee> eList = store.selectAllEmpList(pi);
		return eList;
	}


	@Override
	public List<Team> printAllTeamList() {
		List<Team> tList = store.selectAllTeamList();
		return tList;
	}


	@Override
	public List<Dept> printAllDeptList() {
		List<Dept> dList = store.selectAllDeptList();
		return dList;
	}


	@Override
	public List<Employee> printSearchEmpAll(PageInfo pi, Search search) {
		List<Employee> sList = store.selectSearchEmpAll(pi, search);
		return sList;
	}


	@Override
	public int getListCount() {
		int totalCount = store.selectListCount();
		return totalCount;
	}


	@Override
	public List<Employee> printAll(PageInfo pi) {
		List<Employee> eList = store.selectAll(pi);
		return eList;
	}


	@Override
	public List<Mail> printmSearchAll(PageInfo pi,Search search) {
		List<Mail> mList = store.selectmSearchAll(pi,search);
		return mList;
	}


	@Override
	public List<Mail> printMainMailList(String email) {
		List<Mail> mList = store.selectMainMailList(email);
		return mList;
	}


	

}
