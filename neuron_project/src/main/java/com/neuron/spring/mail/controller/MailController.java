package com.neuron.spring.mail.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.binding.MapperMethod.ParamMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.neuron.spring.attend.domain.PageInfo;
import com.neuron.spring.attend.domain.Pagination;
import com.neuron.spring.employee.domain.Employee;
import com.neuron.spring.mail.domain.Mail;
import com.neuron.spring.mail.service.MailService;

@Controller
public class MailController {

	@Autowired
	private MailService service;
	
	@RequestMapping(value="inbox.do", method=RequestMethod.GET)
	public ModelAndView showinboxMail(
			ModelAndView mv
			,HttpServletRequest request
			,HttpSession session
			,@RequestParam(value="page", required=false) Integer page) {
		
		session = request.getSession();
		Employee employee = new Employee();
		employee = (Employee)session.getAttribute("loginEmployee");
		
		int receiverId= employee.getEmpNo();
		int currentPage = (page != null) ? page:1;
		int totalCount = service.getListCount(receiverId);
		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
		
		List<Mail> mList = service.printAll(pi,receiverId);
		if(!mList.isEmpty()) {
			mv.addObject("mList", mList);
			mv.addObject("pi", pi);
			mv.setViewName("mail/inboxMail");
		}else {
			mv.addObject("msg", "게시글 전체조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
//	@RequestMapping(value="outbox.do", method=RequestMethod.GET)
//	public ModelAndView showOutboxMail(
//			ModelAndView mv
//			,HttpSession session
//			,HttpServletRequest request
//			,@RequestParam(value="page", required=false) Integer page) {
//			session = request.getSession();
//			Employee employee = new Employee();
//			employee = (Employee)session.getAttribute("loginEmployee");
//			
//			int senderId = employee.getEmpNo();
//			int currentPage = (page != null) ? page:1;
//			int totalCount = service.getListCount(senderId);
//			
//			PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
//			List<Mail> mList = service.printAll(pi, senderId);
//			if(!mList.isEmpty()) {
//				mv.addObject("mList", mList);
//				mv.addObject("pi", pi);
//				mv.setViewName("mail/outboxMail");
//			}else {
//				mv.addObject("msg", "보낸메일함 불러오기 실패");
//				mv.setViewName("common/errorPage");
//			}
//				
//		return mv;
//		
//	} 
}
