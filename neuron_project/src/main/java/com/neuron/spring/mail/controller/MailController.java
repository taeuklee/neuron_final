package com.neuron.spring.mail.controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.neuron.spring.attend.domain.PageInfo;
import com.neuron.spring.attend.domain.Pagination;
import com.neuron.spring.employee.domain.Employee;
import com.neuron.spring.mail.domain.Mail;
import com.neuron.spring.mail.domain.Search;
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
		String recEmail = service.printOneEmail(empNo);
		Mail mail = new Mail();
		mail.setReceiverId(recEmail);
		
		String email = mail.getReceiverId();
		int currentPage = (page != null) ? page:1;
		int totalCount = service.getListCount(email);
		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
		
		List<Mail> mList = service.printAll(pi,email);
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
			
			int empNo= employee.getEmpNo();
			String SendEmail = service.printOneEmail(empNo);
			Mail mail = new Mail();
			mail.setSenderId(SendEmail);
			
			String email = mail.getSenderId();
			
			int currentPage = (page != null) ? page:1;
			int totalCount = service.getOutListCount(email);
			
			PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
			List<Mail> mList = service.printAllOut(pi, email);
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
	public ModelAndView checkOutboxMail(
		ModelAndView mv
		,HttpSession session
		,HttpServletRequest request
		,@RequestParam(value="page", required=false) Integer page) {
		
		session = request.getSession();
		Employee employee = new Employee();
		employee = (Employee)session.getAttribute("loginEmployee");
		
		int empNo= employee.getEmpNo();
		String SendEmail = service.printOneEmail(empNo);
		Mail mail = new Mail();
		mail.setSenderId(SendEmail);
		
		String email = mail.getSenderId();
		
		int currentPage = (page != null) ? page:1;
		int totalCount = service.getOutListCount(email);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
		List<Mail> mList = service.printAllOut(pi, email);
		if(!mList.isEmpty()) {
			mv.addObject("mList", mList);
			mv.addObject("pi", pi);
			mv.setViewName("mail/checkOutbox");
		}else {
			mv.addObject("msg", "보낸메일함 불러오기 실패");
			mv.setViewName("common/errorPage");
		}
			
	return mv;
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
		
		int empNo= emp.getEmpNo();
		String sendEmail = service.printOneEmail(empNo);

		mail.setSenderId(sendEmail);
		
		if(!uploadFile.getOriginalFilename().equals("")) {
			String filename = saveFile(uploadFile, request);
			if(filename != null) {
				mail.setMailFileSize(uploadFile.getSize());
				mail.setMailFileName(uploadFile.getOriginalFilename());
			}
		}
		int result = service.registerMail(mail);
		if(result > 0 ) {
			return "redirect:inbox.do";
		} else {
			model.addAttribute("msg", "게시글 등록 실패");
			return "common/errorPage";
		}
	}
	
	private String saveFile(MultipartFile uploadFile, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\muploadFiles";
		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdir();
		}
		String filename = uploadFile.getOriginalFilename();
		String filePath = folder + "\\" + filename;
		try {
			uploadFile.transferTo(new File(filePath));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return filename;
	}

	@RequestMapping(value="mailDetail.do", method=RequestMethod.GET)
	public ModelAndView mailDetail(
			ModelAndView mv
			,@RequestParam("mailNo") int mailNo) {
		
		Mail mail = service.printOne(mailNo);
		if(mail != null) {
			int result = service.updateMail(mailNo);
			mv.addObject("mail", mail);
			mv.setViewName("mail/mailDetail");
		}else {
			mv.addObject("msg", "상세조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	} 
	@ResponseBody
	@RequestMapping(value="InboxMailDelete.do", method=RequestMethod.POST)
	public String InboxMailDelete(
			Model model
			,@RequestParam(value="choiceOne") List<String> choice
			,HttpServletRequest request) {
		int result = 0;
		for(int i =0; i<choice.size(); i++) {
			result = service.removeReceiveMail(choice.get(i));
		}
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	@ResponseBody
	@RequestMapping(value="OutboxMailDelete.do", method=RequestMethod.POST)
	public String OutboxMailDelete(
			Model model
			,@RequestParam(value="choiceOne") List<String> choice
			,HttpServletRequest request) {
		int result = 0;
		for(int i =0; i<choice.size(); i++) {
			result = service.removeSendMail(choice.get(i));
		}
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	@RequestMapping(value="addressbook.do", method=RequestMethod.GET)
	public ModelAndView findEmpList(
			ModelAndView mv
			,@RequestParam(value="page", required=false) Integer page
			,Model model) {
		int currentPage = (page != null) ? page:1;
		int totalCount = service.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
		List<Employee> eList = service.printAllEmpList(pi);
		if(!eList.isEmpty()) {
			mv.addObject("eList", eList);
			mv.addObject("pi", pi);
			mv.addObject("totalCount", totalCount);
			mv.setViewName("mail/addressbook");
		}else {
			mv.addObject("msg", "게시글 전체조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
//	@RequestMapping(value="addressSearch.do", method=RequestMethod.GET)
//	public String addressSearch(
//			@ModelAttribute Search search
//			,Model model) {
//		List<Employee> searchList = service.printSearchEmpAll(search);
//		if(!searchList.isEmpty()) {
//			model.addAttribute("eList",	searchList);
//			model.addAttribute("search", search);
//			return "mail/searchAddressbook";
//		}else {
//			model.addAttribute("msg", "검색 실패");
//			return "common/errorPage";
//		}
//	}
	@RequestMapping(value="addressSearch.do", method=RequestMethod.GET)
	public ModelAndView searchAddressbook(
			ModelAndView mv
			,@ModelAttribute Search search
			,@RequestParam(value="page", required=false) Integer page) {
			int currentPage = (page != null) ? page : 1; // 첫 페이지 1로 지정
			int totalCount = service.getListCount();
			PageInfo pi = Pagination.getPageInfo(currentPage, totalCount); // 페이지 얼마나 출력할지 몇개 출력할지를 페이지네이션에서 정해서 가져옴
			List<Employee> eList = service.printSearchEmpAll(pi, search);
			if(!eList.isEmpty()) {
				mv.addObject("eList", eList);
				mv.addObject("pi", pi);
				mv.setViewName("employee/searchAddressbook");
			}else {
				mv.addObject("msg", "전체조회 실패");
				mv.setViewName("common/errorPage");
			}
		return mv;
	}
	
	@RequestMapping(value="mailSearch.do", method=RequestMethod.GET)
	public String mailSearch(
			@ModelAttribute Search search
			,Model model
			,@RequestParam(value="page", required=false) Integer page) {
		int currentPage = (page != null) ? page : 1; // 첫 페이지 1로 지정
		int totalCount = service.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount); // 페이지 얼마나 출력할지 몇개 출력할지를 페이지네이션에서 정해서 가져옴
		
		List<Mail> searchList = service.printmSearchAll(pi, search);
		if(!searchList.isEmpty()) {
			model.addAttribute("mList",	searchList);
			model.addAttribute("search", search);
			return "mail/inboxMail";
		}else {
			return "mail/inboxMail";
		}
	}
	
	
	
	@RequestMapping(value="mailReplyView.do", method=RequestMethod.GET)
	public ModelAndView mailReplyView(
			ModelAndView mv
			,@RequestParam("mailNo") int mailNo) {
		Mail mail = service.printOne(mailNo);
		if(mail != null) {
			int result = service.updateMail(mailNo);
			mv.addObject("mail", mail);
			mv.setViewName("mail/mailReply");
		}
		return mv;
	}
	@RequestMapping(value="mailReply.do", method=RequestMethod.POST)
	public String mailReply(
			@ModelAttribute Mail mail
			,@RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
			,HttpServletRequest request
			,HttpSession session
			,Model model) {
		    
		session = request.getSession();
		Employee emp = new Employee();
		emp = (Employee)session.getAttribute("loginEmployee");
		
		int empNo= emp.getEmpNo();
		String sendEmail = service.printOneEmail(empNo);

		mail.setSenderId(sendEmail);
		
				if(!uploadFile.getOriginalFilename().equals("")) {
				String filename = saveFile(uploadFile, request);
				if(filename != null) {
					mail.setMailFileSize(uploadFile.getSize());
					mail.setMailFileName(uploadFile.getOriginalFilename());
				}
			}
			int result1 = service.registerMail(mail);
			if(result1 > 0 ) {
				return "redirect:inbox.do";
			} else {
				model.addAttribute("msg", "게시글 등록 실패");
				return "common/errorPage";
			}
	}

}
