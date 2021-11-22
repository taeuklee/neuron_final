package com.neuron.spring;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.neuron.spring.approval.service.ApprovalService;
import com.neuron.spring.employee.domain.Employee;

import com.neuron.spring.main.domain.Notice;
import com.neuron.spring.main.service.MainService;
import com.neuron.spring.mail.domain.Mail;
import com.neuron.spring.mail.service.MailService;
import com.neuron.spring.util.DataMap;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private ApprovalService service;
	@Autowired 
	private MainService mainService;
	@Autowired 
	private MailService mailService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public ModelAndView home(ModelAndView mv ,HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		Employee emp = new Employee();
		if(session.getAttribute("loginEmployee") != null) {
			emp = (Employee)session.getAttribute("loginEmployee");
		}
		String key = "Y";
		List<Notice> nList = mainService.printAll(key);
		int empNo= emp.getEmpNo();
		String recEmail = mailService.printOneEmail(empNo);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@" + recEmail);
		Mail mail = new Mail();
		mail.setReceiverId(recEmail);
		String email = mail.getReceiverId();
		
		List<DataMap> dList = service.printMainPageDocList(emp.getEmpNo());
		List<Mail> mList = mailService.printMainMailList(email);
		
		mv.addObject("nList",nList);
		mv.addObject("mList", mList);
		mv.addObject("dList", dList);
		mv.setViewName("home");
		return mv;
	}
	
}
