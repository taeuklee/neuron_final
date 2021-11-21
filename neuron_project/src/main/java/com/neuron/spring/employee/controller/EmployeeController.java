package com.neuron.spring.employee.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.neuron.spring.dept.domain.DeptAdmin;
import com.neuron.spring.employee.domain.DeptTeam;
import com.neuron.spring.employee.domain.Employee;
import com.neuron.spring.employee.domain.PageInfo;
import com.neuron.spring.employee.domain.Pagination;
import com.neuron.spring.employee.domain.Search;
import com.neuron.spring.employee.service.EmployeeService;

@Controller
public class EmployeeController {
	
	@Autowired
	private EmployeeService service;
	
//	/* 비밀번호 찾기 */
//	@RequestMapping(value = "/findPwd", method = RequestMethod.GET)
//	public void findPwdGET() throws Exception{
//	}
//
//	@RequestMapping(value = "/findPwd", method = RequestMethod.POST)
//	public void findPwdPOST(@ModelAttribute Employee employee, HttpServletResponse response) throws Exception{
//		service.findPwd(response, employee);
//	}


	
	//로그인 처리
//	@RequestMapping(value="/login.do", method=RequestMethod.POST)
//	public String employeeLogin(HttpServletRequest request) {
//		String empId = request.getParameter("emp-id");
//		String empPwd  = request.getParameter("emp-pwd");
//				
//		Employee empOne = new Employee();
//		empOne.setEmpId(empId);
//		empOne.setEmpPwd(empPwd);
//		
//		try {
//		Employee loginEmployee = service.loginEmp(empOne);
//		if(loginEmployee != null) {
//			HttpSession session = request.getSession();
//			session.setAttribute("loginEmployee", loginEmployee);
//		}
//			return "redirect:home.do";
//		}catch(Exception e) {
//			request.setAttribute("msg", e.toString());
//			return "common/errorPage";
//				}
//		
//		}
		
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String employeeLogin(HttpServletRequest request) {
		String empId = request.getParameter("emp-id");
		String empPwd  = request.getParameter("emp-pwd");
				
		Employee empOne = new Employee();
		empOne.setEmpId(empId);
		empOne.setEmpPwd(empPwd);
		Employee  loginEmployee = service.loginEmp(empOne);
		if(loginEmployee != null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginEmployee", loginEmployee);
			return "redirect:home.do";
		}else {
			return "/loginFail";
		}
		
		}
	
	// 로그아웃
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public String employeeLogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session != null) {
			session.invalidate();
			return "redirect:home.do";
		}else {
			request.setAttribute("msg", "실패");
			return "common/errorPage";
		}
	}
	
	
	// 페이징 처리 + 관리자 사원 리스트 출력
	@RequestMapping(value="empListView.do", method=RequestMethod.GET)
	public ModelAndView empListView(ModelAndView mv, @RequestParam(value="page", required=false) Integer page) {
		int currentPage = (page != null) ? page : 1; // 첫 페이지 1로 지정
		int totalCount = service.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount); // 페이지 얼마나 출력할지 몇개 출력할지를 페이지네이션에서 정해서 가져옴
		List<Employee> eList = service.printAll(pi);
		if(!eList.isEmpty()) {
			mv.addObject("eList", eList);
			mv.addObject("pi", pi);
			mv.setViewName("employee/empListView");
		}else {
			mv.addObject("msg", "게시글 전체조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	// 사원등록화면 출력
	@RequestMapping(value="enrollView.do", method=RequestMethod.GET)
	public String enrollView(Model model) {
		List<DeptTeam> dtList = service.printAllDtList();
		model.addAttribute("dtList",dtList);
		
		return "employee/empJoin";
	}
	
	
	// 사원 등록 (내용+사원증 사진)
	@RequestMapping(value="empRegister.do", method=RequestMethod.POST) 
	public String registerEmp(@ModelAttribute Employee employee, @RequestParam(value="uploadFile", required=false)
								MultipartFile uploadFile,  Model model, HttpServletRequest request) {

		if(!uploadFile.getOriginalFilename().equals("")) {
			String renameFilename = saveFile(uploadFile, request);
			if(renameFilename != null) {
				employee.setEmpFileName(uploadFile.getOriginalFilename());
				employee.setEmpFileReName(renameFilename);
			}
		}
		int result = service.registerEmp(employee);
		if(result > 0) {
			return "redirect:home.do";
		}else {
			model.addAttribute("msg", "등록 실패");
			return "common/errorPage";
		}
	}
	
	// 사원등록 
	@RequestMapping(value="joinDeptListView.do", method=RequestMethod.GET)
	public String ShowDeptList(Model model) {
		try {
			List<DeptTeam> dtList = service.printAllDtList();
			for(DeptTeam a : dtList) {
				System.out.println("#######################");
			}
			
			if(!dtList.isEmpty()) {
				model.addAttribute("dtList",dtList);
			}else {
				model.addAttribute("dtList",null);
			}
			return "employee/empJoin";
		}catch(Exception e) {
			model.addAttribute("msg", e.toString());
			return "common/errorPage";
		}
	}
	
	// 서버 루트 (모듈 체크!!!!)
	public String saveFile(MultipartFile uploadFile, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		System.out.println(root);
		String savePath = root + "\\euploadFiles";
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdir();
			
		}
		// 파일명 변경하기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originalFileName = uploadFile.getOriginalFilename();
		String renameFileName = sdf.format(new Date(System.currentTimeMillis()))+
				"."+originalFileName.substring(originalFileName.lastIndexOf(".")+1);
		
		String filePath = folder + "\\" + renameFileName;
		// 파일 저장
		try {
			uploadFile.transferTo(new File(filePath));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return renameFileName;
	}

	// 사원 마이페이지 보기
	@RequestMapping(value="empInfo.do", method=RequestMethod.GET)
	public String empInfoView() {
		return "employee/empInfo";
		
		}
	
	// 사원 정보 수정
	@RequestMapping(value="empInfoModify.do", method=RequestMethod.POST)
	public String modifyEmpInfo(
			@ModelAttribute Employee employee
			, @RequestParam("empPwd") String empPwd
			, @RequestParam("empPhone") String empPhone
			, @RequestParam("empSubEmail") String empSubEmail
			, Model model
			, HttpServletRequest request) {
		HttpSession session = request.getSession();
		try {
			int result = service.modifyEmpInfo(employee);
			if(result > 0) {
				session.setAttribute("loginEmployee", employee);
				return "redirect:home.do";
			}else {
				model.addAttribute("msg", " 정보 수정 실패!");
				return "common/errorPage";
			}
		} catch(Exception e) {
			model.addAttribute("msg", "정보 수정 실패!");
			return "common/errorPage";
		}
	}
	
	// 사원 정보 보기
	@RequestMapping(value="empAdminModifyView.do", method=RequestMethod.GET)
	public String noticeModify(@RequestParam("empNo") int eNo, Model model) {
		Employee employee = service.printOneEmp(eNo);
		model.addAttribute("employee", employee);
		return "employee/empAdminModifyView";
	}

	// 관리자 - 사원 정보 수정
	@RequestMapping(value="empAdminUpdate.do", method=RequestMethod.POST)
	public String modifyEmpAdmin(
			@ModelAttribute Employee employee
			, @RequestParam("deptCode") String deptCode
			, @RequestParam("teamCode") String teamCode
			, @RequestParam("empJob") String empJob
			, @RequestParam("empState") String empState
			, @RequestParam("empExnum") String empExnum
			, @RequestParam("empMaster") String empMaster
			, Model model
			, HttpServletRequest request) {
		HttpSession session = request.getSession();
//		System.out.println(deptCode+teamCode+empJob+empState+empExnum+empMaster);
		try {
			int result = service.modifyEmpAdmin(employee);
			if(result > 0) {
				
				return "redirect:empListView.do";
			}else {
				model.addAttribute("msg", "회원 정보 수정 실패!");
				return "common/errorPage";
			}
		} catch(Exception e) {
			model.addAttribute("msg", e.toString());
			return "common/errorPage";
		}
	}
	
	// 사원 내역 검색 처리
	@RequestMapping(value="empSearch.do", method=RequestMethod.GET)
	public String empSearchList(@ModelAttribute Search search, Model model) {
		List<Employee> searchList = service.printSearchAll(search);
		if(!searchList.isEmpty()) {
			//noticeListView 와 동일
			model.addAttribute("eList", searchList);
			//검색한 값 유지
			model.addAttribute("search", search);
			return "employee/empListView";
		}else {
			model.addAttribute("msg", "사원 검색 실패");
			return "common/errorPage";
		}

	}
	
	   // 페이징 처리 + 조직도 사원 리스트 출력
		@RequestMapping(value="orEmpListView.do", method=RequestMethod.GET)
		public ModelAndView orEmpListView(ModelAndView mv, @RequestParam(value="page", required=false) Integer page) {
			int currentPage = (page != null) ? page : 1; // 첫 페이지 1로 지정
			int totalCount = service.getListCount();
			PageInfo pi = Pagination.getPageInfo(currentPage, totalCount); // 페이지 얼마나 출력할지 몇개 출력할지를 페이지네이션에서 정해서 가져옴
			List<Employee> eList = service.printAll(pi);
			if(!eList.isEmpty()) {
				mv.addObject("eList", eList);
				mv.addObject("pi", pi);
				mv.setViewName("employee/orEmpListView");
			}else {
				mv.addObject("msg", "전체조회 실패");
				mv.setViewName("common/errorPage");
			}
			return mv;
		}
		
		// 조직도 - 사원 정보 보기
		@RequestMapping(value="orEmpInfo.do", method=RequestMethod.GET)
		public String orEmpListView(@RequestParam("empNo") int eNo, Model model) {
			Employee employee = service.printOneEmp(eNo);
			model.addAttribute("employee", employee);
			return "employee/orEmpInfo";
		}
		
		// 조직도 - 사원 내역 검색 처리
		@RequestMapping(value="orEmpSearch.do", method=RequestMethod.GET)
		public String orEmpSearchList(@ModelAttribute Search search, Model model) {
			List<Employee> searchList = service.printSearchAll(search);
			if(!searchList.isEmpty()) {
				//noticeListView 와 동일
				model.addAttribute("eList", searchList);
				//검색한 값 유지
				model.addAttribute("search", search);
				return "employee/orEmpListView";
			}else {
				model.addAttribute("msg", "사원 검색 실패");
				return "common/errorPage";
			}

		}
		
	
	
}
