package com.neuron.spring.main.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.neuron.spring.main.domain.Notice;
import com.neuron.spring.main.service.MainService;

@Controller
public class MainController {
	
	@Autowired
	private MainService service;
	
	// 공지사항 리스트 띄우기
	@RequestMapping(value="mainNoticeList.do", method=RequestMethod.GET)
	public String ShowNoticeList(Model model) {
		try {
			List<Notice> nList = service.printAll();
			if(!nList.isEmpty()) {
				model.addAttribute("nList",nList);
			}else {
				model.addAttribute("nList",null);
			}
			return "/home";
		}catch(Exception e) {
			model.addAttribute("msg", e.toString());
			return "common/errorPage";
		}
	}
	
	
	// 긴급 알림 공지 띄우기
//	@RequestMapping(value="mainEmgNotice.do", method=RequestMethod.GET)
//	public String ShowMainEmgNotice(@RequestParam("noticeCategory") String key, Model model) {
//		try {
//			String key = 'Y';
//			Notice notice = service.printOne(key);
//			if(notice != null) {
//				model.addAttribute("notice", notice);
//				return "/home";
//			}else {
//				model.addAttribute("msg", "상세조회 실패");
//				return "common/errorPage";
//			}
//			
//		}catch(Exception e) {
//			e.printStackTrace();
//			model.addAttribute("msg", "상세조회 실패");
//			return "common/errorPage";		
//		}
//
//	}
}
	
