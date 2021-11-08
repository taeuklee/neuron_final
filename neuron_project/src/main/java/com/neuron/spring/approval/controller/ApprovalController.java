package com.neuron.spring.approval.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Clob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

@Controller
public class ApprovalController {
	
	@Autowired
	private ApprovalService service;
	
	@RequestMapping(value="/documentList.do", method=RequestMethod.GET)
	public ModelAndView ShowDocumentList(
			ModelAndView mv
			, @RequestParam(value="page",required=false) Integer page) {
		
		int docWriterNo = 2; // 사원번호
		int currentPage = (page != null) ? page : 1;
		int totalCount = service.getListCount(docWriterNo);
//		Employee empOne = service.printOneByEmp(docWriterNo);
		Map<String, Object> paramMap = new HashMap();
		paramMap.put("empNo", docWriterNo);
		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
		List<Document> dList = new ArrayList<Document>();
		
//		Map<String, Object> code = service.codeInfo();
//		
//		StringBuffer output = new StringBuffer();
//		String str = "";
//		Clob clob = (Clob)code.get("CODE_CONTENTS");
//		BufferedReader br = new BufferedReader(clob.getCharacterStream());
//		
//		while((str = br.readLine()) != null) {
//			output.append(str);
//		}
//		
//		mv.addObject("code", output.toString());
		
		for(Document d : dList) {
			d.setDocWriterNo(docWriterNo);
		}
		dList = service.printMyAllDocList(pi,paramMap);
		if(!dList.isEmpty()) {
			mv.addObject("dList",dList);
			mv.addObject("pi",pi);
			mv.setViewName("approval/myDocumentListView");
		}else {
			mv.addObject("msg", "게시판 조회실패!");
			
		}
		return mv;
	}
	
	@RequestMapping(value="documentWriteView.do", method= RequestMethod.GET)
	public ModelAndView documentWriteView(ModelAndView mv) throws SQLException, IOException {
		Map<String,String> param = new HashMap();
		param.put("group_code_id", "DOC_GUBUN");
		
		List<Map<String, Object>> code = service.codeInfo(param);
		
		for(Map<String, Object>a : code) {
			StringBuffer output = new StringBuffer();
			String str = "";
			Clob clob = (Clob)a.get("CODE_CONTENTS");
			BufferedReader br = new BufferedReader(clob.getCharacterStream());
			while((str = br.readLine()) != null) {
				output.append(str);
			}
			a.put("CODE_CONTENTS", output.toString());
		}
		
		mv.addObject("code", code);
		mv.setViewName("approval/documentWriteForm");
		return mv;
	}
	
	@RequestMapping(value="approvalEmp.do", method=RequestMethod.GET)
	public ModelAndView findMemberList(ModelAndView mv) {
		mv.setViewName("approval/approvalEmp");
		return mv;
	}

}
