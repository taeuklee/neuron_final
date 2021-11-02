package com.neuron.spring.approval.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ApprovalController {
	
	@RequestMapping(value="/documentList.do", method=RequestMethod.GET)
	public String noticeWriteView() {
		return "approval/myDocumentListView";
	}
//	public ModelAndView ShowDocumentList(ModelAndView mv, @RequestParam(value="page",required=false) Integer page) {
//		
//		return mv;
//	}
}
