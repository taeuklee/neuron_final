package com.neuron.spring.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class NoticeController {
	
	// 폼 창 띄우기
	@RequestMapping(value="noticeListView.do", method=RequestMethod.GET)
	public String noticeWriteView() {
		return "notice/noticeListView";
	}

}
