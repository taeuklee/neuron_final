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
			String key = "Y";
			List<Notice> nList = service.printAll(key);
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
	

}
	
