package com.neuron.spring.approval.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
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
import com.neuron.spring.approval.domain.CodeInfo;
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
		
		int docWriterNo = 1; // 사원번호
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
	
	//결재문 작성 뷰 
	@RequestMapping(value="documentWriteView.do", method= RequestMethod.GET)
	public ModelAndView documentWriteView(
			ModelAndView mv, HttpServletRequest request ) throws SQLException, IOException {
		List<CodeInfo> code = service.printCodeInfo();		
//		Map<String,String> param = new HashMap();
//		param.put("group_code_id", "DOC_GUBUN");
//		
//		List<Map<String, Object>> code = service.codeInfo(param);
//		
//		for(Map<String, Object>a : code) {
//			StringBuffer output = new StringBuffer();
//			String str = "";
//			Clob clob = (Clob)a.get("CODE_CONTENTS");
//			BufferedReader br = new BufferedReader(clob.getCharacterStream());
//			while((str = br.readLine()) != null) {
//				output.append(str);
//			}
//			a.put("CODE_CONTENTS", output.toString());
//		}
		mv.addObject("code", code);
		
		mv.setViewName("approval/documentWriteForm");
		return mv;
	}
	
	// 결재문 등록
	@RequestMapping(value ="documentRegister.do", method=RequestMethod.POST)
	public ModelAndView registerDocument(
			ModelAndView mv
			,HttpSession session
			,@RequestParam(value="docGubun") String docKind
			,@RequestParam(value="docContents") String boardContents
			,@RequestParam(value="emp_id_1") String applEmp1 // 합의자
			,@RequestParam(value="emp_id_2") String applEmp2 // 결재자
			,@RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
			, HttpServletRequest request ) throws SQLException, IOException {
		Map<String, Object> paramMap = request.getParameterMap();
		
		for(String key : paramMap.keySet()) {
			System.out.println(key+","+paramMap.get(key));
		}
		
		// value값은 jsp의 input태그의 name값이고
		// required = false, 파일이 필수가 아님을 알려주는 것이고
		// MultipartFile은 MultipartResolver 객체를 빈으로 등록해서 사용한다는 것이다.
		//uploadFile이 비어있지 않으면
//		if(!uploadFile.getOriginalFilename().equals("")) {
//			String filePath = saveFile(uploadFile, request);
//			if(filePath!=null) {
//				// 파일 업로드 
//			}
//		}
		session = request.getSession();
//		Employee emp = new Employee();
//		if(session.getAttribute("loginEmployee") != null) {
//			emp = (Employee)session.getAttribute("loginEmployee");
//		}
//		int userNo = emp.getEmpNo();
		
		int userNo = 1; // 로그인 유저번호
		
	
		int empId1 = Integer.parseInt(applEmp1.split(":")[0]); // 합의자 회원번호
		int empId2 = Integer.parseInt(applEmp2.split(":")[0]); // 결재자 회원번호
		
		Document doc = new Document();
		//휴가신청서일때 휴가신청 값 따로 받기
//		if(docKind=="A") {
//			
//		}else{}
//		StringBuffer output = new StringBuffer();
//		String str = "";
//		BufferedReader br = new BufferedReader(boardContents.getCharacterStream());
//		while((str = br.readLine()) != null) {
//			output.append(str);
//		}
//		String Contents = output.toString();
		
		doc.setDocWriterNo(userNo);
		doc.setDocKind(docKind);
		doc.setDocContents(boardContents);
		
		int result = service.registerDocument(doc);
		if(result>0) {
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
		String filePath = folder+"\\"+file.getOriginalFilename();
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
		String deletePath= root+"\\nuploadFiles";
		File deleteFile = new File(deletePath+"\\"+fileName);
		if(deleteFile.exists()) {
			deleteFile.delete(); // 파일 삭제
		}
	}
	

}
