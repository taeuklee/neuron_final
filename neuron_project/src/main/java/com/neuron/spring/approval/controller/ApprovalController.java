package com.neuron.spring.approval.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Clob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.neuron.spring.approval.domain.ApprovalSearch;
import com.neuron.spring.approval.domain.Document;
import com.neuron.spring.approval.domain.PageInfo;
import com.neuron.spring.approval.domain.Pagination;
import com.neuron.spring.approval.service.ApprovalService;
import com.neuron.spring.employee.domain.Dept;
import com.neuron.spring.employee.domain.Employee;
import com.neuron.spring.employee.domain.Team;

@Controller
public class ApprovalController {
	
	@Autowired
	private ApprovalService service;
	
	// 문서 리스트
	@RequestMapping(value="approval/{path}.do", method=RequestMethod.GET)
	public ModelAndView ShowDocumentList(
			@PathVariable String path, ModelAndView mv, @RequestParam(value="page",required=false) Integer page) {
		
		int docWriterNo = 2; // 사원번호
		int currentPage = (page != null) ? page : 1;
		int totalCount = service.getListCount(docWriterNo);
		//사원 번호를 맵에 담아서 조회
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("empNo", docWriterNo);
		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
		List<Document> dList = new ArrayList<Document>();
		
		for(Document d : dList) {
			d.setDocWriterNo(docWriterNo);
		}
		dList = service.printMyAllDocList(pi,paramMap);
		if(!dList.isEmpty()) {
			mv.addObject("dList",dList);
			mv.addObject("pi",pi);
			mv.setViewName("approval/"+path);
		}else {
			mv.addObject("msg", "게시판 조회실패!");
			
		}
		return mv;
	}
	
	//결재문 작성
	@RequestMapping(value="documentWriteView.do", method= RequestMethod.GET)
	public ModelAndView documentWriteView(
			ModelAndView mv, HttpServletRequest request ) throws SQLException, IOException {
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
	
	//결재선 view
	@RequestMapping(value="approvalEmp.do", method=RequestMethod.GET)
	public ModelAndView findMemberList(ModelAndView mv) {
		List<Employee> eList = service.printAllEmployeeList();
		List<Team> tList = service.printAllTeamList();
		List<Dept> dList = service.printAllDeptList();
		
		mv.addObject("eList", eList);
		mv.addObject("tList", tList);
		mv.addObject("dList", dList);
		mv.setViewName("approval/approvalEmp");
		return mv;
	}
	
	//결재문 상세 view
	public ModelAndView documentDetail(ModelAndView mv, HttpServletRequest request) {
		return mv;
	}
	
	//결재 처리 페이지 
	public ModelAndView transApproveOne(ModelAndView mv, HttpSession session){
		return mv;
	}
	
	//문서리스트 검색
	public String DocumentSearchList(ApprovalSearch search, Model model) {
		return "";
	}
	
	//파일관리
	public void deleteFile(String fileName, HttpServletRequest request) {
		
	}
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		return "";
	}

}
