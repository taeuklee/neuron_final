package com.neuron.spring.approval.controller;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.neuron.spring.approval.domain.Document;
import com.neuron.spring.approval.domain.PageInfo;
import com.neuron.spring.approval.domain.Pagination;
import com.neuron.spring.approval.service.ApprovalService;
import com.neuron.spring.employee.domain.Employee;

@Controller
public class ApprovalController {
	
	@Autowired
	private ApprovalService service;
	
	@RequestMapping(value="/documentList.do", method=RequestMethod.GET)
	public ModelAndView ShowDocumentList(
			ModelAndView mv
			, @RequestParam(value="page",required=false) Integer page){
		
		int docWriterNo = 1;
		int currentPage = (page != null) ? page : 1;
		int totalCount = service.getListCount(docWriterNo);
//		Employee empOne = service.printOneByEmp(docWriterNo);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
		List<Document> dList = new ArrayList<Document>();
		for(Document d : dList) {
			d.setDocWriterNo(docWriterNo);
		}
		dList = service.printMyAllDocList(pi,docWriterNo);
		
		if(!dList.isEmpty()) {
			mv.addObject("dList",dList);
			mv.addObject("pi",pi);
			mv.setViewName("approval/myDocumentListView");
		}else {
			mv.addObject("msg", "게시판 조회실패!");
		}
		return mv;
	}

}
