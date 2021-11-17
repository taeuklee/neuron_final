package com.neuron.spring.mail.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
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
		
		int empNo= employee.getEmpNo();
		int currentPage = (page != null) ? page:1;
		int totalCount = service.getListCount(empNo);
		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
		
		List<Mail> mList = service.printAll(pi,empNo);
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
	
	@RequestMapping(value="outbox.do", method=RequestMethod.GET)
	public ModelAndView showOutboxMail(
			ModelAndView mv
			,HttpSession session
			,HttpServletRequest request
			,@RequestParam(value="page", required=false) Integer page) {
			session = request.getSession();
			Employee employee = new Employee();
			employee = (Employee)session.getAttribute("loginEmployee");
			
			int empNo = employee.getEmpNo();
			int currentPage = (page != null) ? page:1;
			int totalCount = service.getOutListCount(empNo);
			
			PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
			List<Mail> mList = service.printAllOut(pi, empNo);
			if(!mList.isEmpty()) {
				mv.addObject("mList", mList);
				mv.addObject("pi", pi);
				mv.setViewName("mail/outboxMail");
			}else {
				mv.addObject("msg", "보낸메일함 불러오기 실패");
				mv.setViewName("common/errorPage");
			}
				
		return mv;
		
	} 
	@RequestMapping(value="checkOutbox.do", method=RequestMethod.GET)
	public String checkOutboxMail() {
		return "mail/checkOutbox";
	} 
	
	@RequestMapping(value="mailWriteView.do", method=RequestMethod.GET)
	public String mailWriteView() {
		return "mail/mailWrite";
	}
	@RequestMapping(value="mailPost.do", method=RequestMethod.POST)
	public String mailWrite(
			@ModelAttribute Mail mail
			,@RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
			,HttpServletRequest request
			,HttpSession session
			,Model model
			) {
		
		session = request.getSession();
		Employee emp = new Employee();
		emp = (Employee)session.getAttribute("loginEmployee");
		
//		int empNo = emp.getEmpNo();
//		mail.setSenderId(empNo);
		
//		if(!uploadFile.getOriginalFilename().equals("")) {
//			String renameFilename = saveFile(uploadFile, request);
//			if(renameFilename != null) {
//				mail.set
//			}
//		}
		
		int result = service.registerMail(mail);
		if(result > 0 ) {
			return "redirect:inbox.do";
		} else {
			model.addAttribute("msg", "게시글 등록 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping(value="mailDetail.do", method=RequestMethod.GET)
	public ModelAndView mailDetail(
			ModelAndView mv
			,@RequestParam("mailNo") int mailNo) {
		Mail mail = service.printOne(mailNo);
		
		if(mail != null) {
			mv.addObject("Mail", mail);
			mv.setViewName("mail/mailDetail");
		}else {
			mv.addObject("msg", "상세조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	} 
	@RequestMapping(value="InboxMailDelete.do", method=RequestMethod.GET)
	public String InboxMailDelete(
			Model model
			,@RequestParam("mailNo") int mailNo
//			,@RequestParam("fileName") String fileRename
			,HttpServletRequest request) {
		int result = service.removeReceiveMail(mailNo);
		if(result > 0 ) {
			return "redirect:inbox";
		}else {
			model.addAttribute("msg", "게시글 삭제 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping(value="OutboxMailDelete.do", method=RequestMethod.GET)
	public String OutboxMailDelete(
			Model model
			,@RequestParam("mailNo") int mailNo
//			,@RequestParam("fileName") String fileRename
			,HttpServletRequest request) {
		int result = service.removeReceiveMail(mailNo);
		if(result > 0 ) {
			return "redirect:outbox";
		}else {
			model.addAttribute("msg", "게시글 삭제 실패");
			return "common/errorPage";
		}
	}
}
