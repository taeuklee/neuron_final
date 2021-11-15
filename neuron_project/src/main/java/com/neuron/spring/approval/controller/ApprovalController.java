package com.neuron.spring.approval.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.neuron.spring.approval.domain.Approval;
import com.neuron.spring.approval.domain.ApprovalSearch;
import com.neuron.spring.approval.domain.CodeInfo;
import com.neuron.spring.approval.domain.Document;
import com.neuron.spring.approval.domain.DocumentFile;
import com.neuron.spring.approval.domain.PageInfo;
import com.neuron.spring.approval.domain.Pagination;
import com.neuron.spring.approval.service.ApprovalService;
import com.neuron.spring.employee.domain.Dept;
import com.neuron.spring.employee.domain.Employee;
import com.neuron.spring.employee.domain.Team;
import com.neuron.spring.util.DataMap;
import com.neuron.spring.util.JsonConverter;
import com.neuron.spring.util.RequestResolver;

@Controller
public class ApprovalController {
	
	@Autowired
	private ApprovalService service;
	
	// 문서 리스트
	@RequestMapping(value="approval/{path}.do", method=RequestMethod.GET)
	public ModelAndView ShowDocumentList(
			@PathVariable String path, ModelAndView mv,HttpServletRequest request, HttpSession session, @RequestParam(value="page",required=false) Integer page) {
		session = request.getSession();
		Employee emp = new Employee();
		if(session.getAttribute("loginEmployee") != null) {
			emp = (Employee)session.getAttribute("loginEmployee");
		}
		int docWriterNo = emp.getEmpNo(); // 사원번호		
		int currentPage = (page != null) ? page : 1;
		int totalCount = 0;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("empNo", docWriterNo);
		
		List<Document> dList = new ArrayList<Document>();
		for(Document d : dList) {
			d.setDocWriterNo(docWriterNo);
		}
		
		if(path.equals("myDocumentListView")) {	
			paramMap.put("gubun","myWrite");
			totalCount = service.getListCount(paramMap);
		}else if(path.equals("list1")) {
			paramMap.put("gubun","wait");
			totalCount = service.getListCount(paramMap);
		}else if(path.equals("list2")) {
			
		}
		
		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
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
	
	//결재문 작성 뷰 
	@RequestMapping(value="documentWriteView.do", method= RequestMethod.GET)
	public ModelAndView documentWriteView(
			ModelAndView mv, HttpServletRequest request,HttpSession session ) throws SQLException, IOException {
		List<CodeInfo> code = service.printCodeInfo();		
		session = request.getSession();
		Employee emp = new Employee();
		if(session.getAttribute("loginEmployee") != null) {
			emp = (Employee)session.getAttribute("loginEmployee");
		}
		System.out.println("@@@@@@@@:"+emp.toString());
		mv.addObject("code", code);
		mv.addObject("emp",emp);
		mv.setViewName("approval/documentWriteForm");
		return mv;
	}
	
	// 결재문 등록
	@RequestMapping(value ="documentRegister.do", method=RequestMethod.POST)
	public ModelAndView registerDocument(
			ModelAndView mv
			,HttpSession session, RequestResolver resolver
			,@RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
			, HttpServletRequest request ) throws Exception {
		// 회원 session값 불러오기
		session = request.getSession();
		Employee emp = new Employee();
		
		DocumentFile dFile = new DocumentFile();
		
		if(session.getAttribute("loginEmployee") != null) {
			emp = (Employee)session.getAttribute("loginEmployee");
		}
		if(!uploadFile.getOriginalFilename().equals("")) {
			String renameFileName = saveFile(uploadFile,request);
			if(renameFileName!=null) {
				dFile.setFileSize(uploadFile.getSize());
				dFile.setFileName(uploadFile.getOriginalFilename());
				dFile.setFileRename(renameFileName);
			}
		}
		resolver.put("documentWriterNo", emp.getEmpNo());
		resolver.put("docFile", dFile);
		
		// json으로 결재자 배열 변환
		resolver.put("empIdList",JsonConverter.getObjectList(resolver.getString("empIdList"), DataMap.class));
		//1. 결재문서 데이터 생성
		int documentNo = service.registerDocument(resolver.getMap());//현재 resolver에는 결재문서 데이터와 결재자들의 데이터가 담겨있음.

		
		if(documentNo>0) {
			mv.setViewName("redirect:/approval/myDocumentListView.do");
		}else {
			System.out.println("에러");
		}
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
	
	// 결재리스트 ajax
	@RequestMapping(value = "/apprList.do", method=RequestMethod.GET)
	public void getApprovalList(RequestResolver resolver, HttpServletResponse response) throws JsonIOException, IOException {
		List<DataMap> aList = service.printApprovalList(resolver.getMap());
		
		if(!aList.isEmpty()) {
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(aList,response.getWriter());
		}else {
			System.out.println("데이터가 없음");
		}
	}
	
	
	
	
	//결재문 상세 view
	@RequestMapping(value="documentDatail.do")
	public ModelAndView documentDetail(
			ModelAndView mv, RequestResolver resolver) {
		Document docOne = service.printDocumentOne(resolver.getMap());
		List<DataMap> aList = service.printApprovalList(resolver.getMap());
		
		mv.addObject("docOne", docOne);
		mv.addObject("aList",aList);
		mv.setViewName("/approval/documentDetail");
		return mv;
	}
	
	//결재 처리 view페이지 
	@RequestMapping(value="/transApproveView.do")
	public ModelAndView transApprove(ModelAndView mv, HttpSession session){
		mv.setViewName("/approval/transApproveView");
		return mv;
	}
	
	//결재 처리 update 처리 
	@RequestMapping(value="/transApproval.do")
	public ModelAndView transApproval(ModelAndView mv, HttpSession session) {
		
		
		return mv;
	}
	
	
	
	//문서리스트 검색
	public String DocumentSearchList(ApprovalSearch search, Model model) {
		return "";
	}
	
	
	
	//파일관리
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		
		// 파일저장 경로 설정
		String root = request.getSession().getServletContext().getRealPath("resources");
		// 저장 폴더 선택 
		String savePath= root+"\\nuploadFiles";
		// 없으면 생성
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdir();
		}
		//파일명 변경하기 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originalFileName = file.getOriginalFilename();
		String renameFileName= sdf.format(new Date(System.currentTimeMillis()))+"."+originalFileName.substring(originalFileName.lastIndexOf(".")+1);
		//file.getOriginalFilename() = 파일명
		String filePath = folder+"\\"+renameFileName;
		// 파일 저장
		try {
			file.transferTo(new File(filePath));
		}catch (Exception e) {
			e.printStackTrace();
		}
		// 파일 결로 리턴
		return renameFileName;
	}
	
	public void deleteFile(String fileName, HttpServletRequest request) {
		// 파일저장 경로 설정
		String root = request.getSession().getServletContext().getRealPath("resources");
		// 저장 폴더 선택 
		String deletePath= root+"\\duploadFiles";
		File deleteFile = new File(deletePath+"\\"+fileName);
		if(deleteFile.exists()) {
			deleteFile.delete(); // 파일 삭제
		}
	}
	

}
