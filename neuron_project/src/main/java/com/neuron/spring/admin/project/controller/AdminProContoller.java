package com.neuron.spring.admin.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.neuron.spring.project.service.ProjectService;

@Controller
public class AdminProContoller {
	
	
	// 프로젝트 리스트 조회
	@RequestMapping(value="proListView.do", method=RequestMethod.GET)
	public String adminProjectList() {
		return "adminProject/proListView";
	}
	
	//프로젝트 생성 승인 or 반려 처리
	@RequestMapping(value="proOkListView.do", method=RequestMethod.GET)
	public String adminProjectOK() {
		return "adminProject/proOkListView";
	}
	
	//프로젝트 삭제 처리
	@RequestMapping(value="proNoListView.do", method=RequestMethod.GET)
	public String adminProjectNO() {
		return "adminProject/proNoListView";
	}

}
