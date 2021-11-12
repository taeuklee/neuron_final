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
		
		if(path.equals("myDocumentListView")) {		
			System.out.println(path);
			totalCount = service.getListCount(docWriterNo);
			for(Document d : dList) {
				d.setDocWriterNo(docWriterNo);
			}
		}else if(path.equals("list1")) {
			paramMap.put("apprState","대기");
			System.out.println("결재대기");

			totalCount = service.getListCount(paramMap);
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
			,HttpSession session
			,@RequestParam(value="docGubun") String docKind // 문서종류
			,@RequestParam(value="docContents") String boardContents //문서내용 
			,@RequestParam(value="emp_id_1") String [] apprEmp1 // 합의자
			,@RequestParam(value="emp_id_2") String [] apprEmp2 // 결재자
			,@RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
			, HttpServletRequest request ) throws SQLException, IOException {
		
		List<Approval> aList = new ArrayList();
		
		for(String a : apprEmp1) {
			Approval appr1 = new Approval();
			appr1.setApprovalEmpNo(Integer.parseInt(a.split(":")[0]));
			appr1.setApprovalType(a.split(":")[4]);
			aList.add(appr1);
		}
		for(String a : apprEmp2) {
			Approval appr2 = new Approval();
			appr2.setApprovalEmpNo(Integer.parseInt(a.split(":")[0]));
			appr2.setApprovalType(a.split(":")[4]);
			aList.add(appr2);
		}
		
		session = request.getSession();
		Employee emp = new Employee();
		DocumentFile dFile = new DocumentFile();
		if(session.getAttribute("loginEmployee") != null) {
			emp = (Employee)session.getAttribute("loginEmployee");
		}
		
		// value값은 jsp의 input태그의 name값이고
		// required = false, 파일이 필수가 아님을 알려주는 것이고
		// MultipartFile은 MultipartResolver 객체를 빈으로 등록해서 사용한다는 것이다.
		// uploadFile이 비어있지 않으면
		if(!uploadFile.getOriginalFilename().equals("")) {
			String renameFileName = saveFile(uploadFile,request);
			if(renameFileName!=null) {
				dFile.setFileSize(uploadFile.getSize());
				dFile.setFileName(uploadFile.getOriginalFilename());
				dFile.setFileRename(renameFileName);
			}
		}
		Document doc = new Document();
		doc.setDocKind(docKind);
		doc.setDocWriterNo(emp.getEmpNo());
		doc.setDocContents(boardContents);
		
		
		Map<String,Object> insertMap = new HashMap<String, Object>();
		insertMap.put("doc", doc);
		insertMap.put("docFile", dFile);
		
//		Map<String, Object> paramMap = request.getParameterMap();
//		paramMap.put("docGubun", docKind);
//		paramMap.put("docContents", boardContents);
//		paramMap.put("emp_id_1", Integer.parseInt(applEmp1.split(":")[0]));
//		paramMap.put("emp_id_2", Integer.parseInt(applEmp2.split(":")[0]));
//		paramMap.put("WriterEmpNo",1);

		
		int docResult = service.registerDocument(insertMap, aList);
		if(docResult>0) {
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
	public void getApprovalList(@RequestParam("documentNo") int docNo, HttpServletResponse response) throws JsonIOException, IOException {
		List<Approval> aList = service.printApprovalList(docNo);
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
			ModelAndView mv, @RequestParam("documentNo") int documentNo) {
		Document docOne = service.printDocumentOne(documentNo);
		List<Approval> aList = service.printApprovalList(documentNo);
		
		mv.addObject("docOne", docOne);
		mv.addObject("aList",aList);
		mv.setViewName("/approval/documentDetail");
		return mv;
	}
	
	//결재 처리 페이지 
	@RequestMapping(value="/transApprove.do")
	public ModelAndView transApprove(ModelAndView mv, HttpSession session){
		System.out.println("된다");
		mv.setViewName("/approval/transApprove");
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
		return filePath;
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
