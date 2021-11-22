package com.neuron.spring.project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.neuron.spring.empCalendar.domain.EmpCalendar;
import com.neuron.spring.project.domain.EmpProject;
import com.neuron.spring.project.domain.Employee;
import com.neuron.spring.project.domain.PageInfo;
import com.neuron.spring.project.domain.Pagination;
import com.neuron.spring.project.domain.Project;
import com.neuron.spring.project.domain.ProjectCalendar;
import com.neuron.spring.project.domain.ProjectMember;
import com.neuron.spring.project.domain.ProjectTask;
import com.neuron.spring.project.domain.ProjectTaskDetail;
import com.neuron.spring.project.domain.SearchPagination;
import com.neuron.spring.project.service.ProjectService;
import com.neuron.spring.project.service.logic.ProjectServiceImpl;

@Controller
public class ProjectController {

	@Autowired
	private ProjectService service;

	@RequestMapping(value = "createProject.do", method = RequestMethod.GET)
	public String createProjectForm() {
		return "project/insertProjectForm";
	}

//	@RequestMapping(value = "selectProjectMain.do", method = RequestMethod.GET)
//	public String selectProjectMain(
//			) {
//		return "project/selectProjectMainPage";
//	}

	@RequestMapping(value = "selectProjectMainWork.do", method = RequestMethod.GET)
	public ModelAndView selectProjectMainWork(
			@RequestParam(value="projectNo") int projectNo
			,ModelAndView mv
			) {
		ProjectTask task = service.selectTask(projectNo);
		int taskNo = task.getTaskNo();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("taskNo", taskNo);
		map.put("projectNo", projectNo);
		List<ProjectTaskDetail> taskDetail = service.selectProjectTaskDetail(map);
		for(int i = 0;i<taskDetail.size();i++) {
			ProjectTaskDetail taskDetail1 = taskDetail.get(i);
			int taskDetailCountNo = taskDetail1.getTaskDetailNo();
			int taskDetailTotalCount = service.taskDetailTotalCount(taskDetailCountNo);
			String complete = "Y";
			Map<String, Object> countMap = new HashMap<String, Object>();
			countMap.put("taskDetailCountNo", taskDetailCountNo);
			countMap.put("complete", complete);
			int taskDetailCompleteCount = service.taskDetailCompleteCount(countMap);
			int taskDetailProcessivity = 0;
			if(taskDetailCompleteCount>0) {
				System.out.println("계산:" + taskDetailCompleteCount/taskDetailTotalCount);
				System.out.println("계산결과:"+(100*taskDetailCompleteCount)/taskDetailTotalCount);
				taskDetailProcessivity = Math.round((100*taskDetailCompleteCount)/taskDetailTotalCount);				
			}else {				
					taskDetailProcessivity = 0;
			}
			System.out.println("세부사항 총 팀원수"+taskDetailTotalCount);
			System.out.println("성공한 팀원수"+taskDetailCompleteCount);
			System.out.println("진행도"+taskDetailProcessivity);
			taskDetail1.setTaskDetailProcessivity(taskDetailProcessivity);		
		}
		mv.addObject("projectTask", task);
		mv.addObject("taskDetail", taskDetail);
		mv.setViewName("project/selectProjectMainWork");
		return mv;
	}

	@ResponseBody
	@RequestMapping(value = "checkMainWork.do", method = RequestMethod.GET)
	public String moveInsertMainWorkForm(@RequestParam(value = "projectNo") int projectNo) {
		ProjectTask task = service.selectTask(projectNo);
		if (task == null) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	@RequestMapping(value="moveInsertTaskForm.do", method = RequestMethod.GET)
	public String moveInsertTaskForm(@RequestParam(value="projectNo") int projectNo) {
		return "project/insertTask";
	}

	@RequestMapping(value = "moveInsertMainWork.do", method = RequestMethod.GET)
	public String moveInsertMainWork(@RequestParam(value = "projectNo") int projectNo) {
		return "project/insertProjectMainWork";
	}

//	@RequestMapping(value = "moveUpdateMainWorkForm.do", method = RequestMethod.GET)
//	public String moveUpdateMainWorkForm() {
//		return "project/updateProjectMainWork";
//	}

	@RequestMapping(value = "selectProjectMemberList.do", method = RequestMethod.GET)
	public ModelAndView selectMemberList(@RequestParam(value = "projectNo") int projectNo, ModelAndView mv
	 ,@RequestParam(value="page", required=false) Integer page
	) {
		int currentPage = (page != null) ? page : 1;
		int totalCount = service.getListCount(projectNo);
		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
		pi.setProjectNo(projectNo);
		List<ProjectMember> memberList = service.selectMemberAllList(pi);
		Project project = service.selectProject(projectNo);
		int masterEmpNo = project.getProjectMaster();
		Employee master = service.selectMaster(masterEmpNo);
		mv.addObject("pi", pi);
		mv.addObject("project", project);
		mv.addObject("master", master);
		mv.addObject("memberList", memberList);
		mv.setViewName("project/selectProjectMemberList");
		return mv;
	}

	@RequestMapping(value = "selectSearchMemberList.do", method = RequestMethod.GET)
	public ModelAndView selectSearchMemberList(@RequestParam(value = "projectNo") int projectNo,
			@RequestParam(value = "searchText") String searchText, ModelAndView mv, HttpServletResponse response
			 ,@RequestParam(value="page", required=false) Integer page)
			throws JsonIOException, IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("projectNo", projectNo);
		map.put("searchText", searchText);
		int currentPage = (page != null) ? page : 1;
		int totalCount = service.getSearchListCount(map);
		PageInfo pi = SearchPagination.getPageInfo(currentPage, totalCount);
		pi.setSearchText(searchText);
		pi.setProjectNo(projectNo);
		List<ProjectMember> memberList = service.selectSearchMemberList(pi);
		PrintWriter out = response.getWriter();
		mv.addObject("memberList", memberList);
		mv.addObject("pi", pi);
		mv.setViewName("project/selectSearchProjectMember");
		return mv;
	}

	@RequestMapping(value = "moveInviteMember.do", method = RequestMethod.GET)
	public ModelAndView moveInviteMember(@RequestParam(value = "projectNo") int projectNo, ModelAndView mv) {
		Project project = service.selectProject(projectNo);
		mv.addObject("project", project);
		mv.setViewName("project/inviteMember");
		return mv;
	}

	@RequestMapping(value = "moveTaskMember.do", method = RequestMethod.GET)
	public ModelAndView moveTaskMember(@RequestParam(value = "projectNo") int projectNo, int count, ModelAndView mv) {
		System.out.println("카운트:" + count);
		mv.addObject("count", count);
		mv.addObject("projectNo", projectNo);
		mv.setViewName("project/insertTaskMemberList");
		return mv;
	}

	@ResponseBody
	@RequestMapping(value = "insertProjectSearchMemberList.do", method = RequestMethod.POST)
	public void insertProjectSearchMemberList(@RequestParam String searchText, @RequestParam(value = "empNo") int empNo,
			HttpServletResponse response) throws JsonIOException, IOException {
		System.out.println(searchText);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("empNo", empNo);
		map.put("searchText", searchText);
		List<Employee> eList = service.selectInsertProjectSearchList(map);
		PrintWriter out = response.getWriter();
		for (int i = 0; i < eList.size(); i++) {
			System.out.println(eList.get(i));
		}

		if (!eList.isEmpty()) {
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(eList, response.getWriter());
		} else {
			out.println("<script>alert('해당하는 팀원이 없습니다');</script>");
			out.flush();
		}
	}

	@RequestMapping(value = "insertProjectRegister.do", method = RequestMethod.POST)
	public String insertProjectRegister(HttpServletRequest request,
			@RequestParam(value = "projectTitle") String projectTitle,
			@RequestParam(value = "projectContents") String projectContents,
			@RequestParam(value = "projectMaster") int projectMaster, HttpServletResponse respones) throws IOException {
		String[] empNoList = request.getParameterValues("empNo");
		int[] empNoList2 = Arrays.stream(empNoList).mapToInt(Integer::parseInt).toArray();
		for (int i = 0; i < empNoList.length; i++) {
			System.out.println(empNoList2[i]);
		}
		Project project = new Project();
		project.setProjectContents(projectContents);
		project.setProjectTitle(projectTitle);
		project.setProjectMaster(projectMaster);
		int result = service.insertProjectRegister(project);
		PrintWriter out = respones.getWriter();
		if (result > 0) {
			System.out.println("프로젝트 등록성공");
			Project newProject = service.selectProjectOne(project);
			int projectNo = newProject.getProjectNo();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("projectNo", projectNo);
			map.put("empNoList", empNoList2);
			int insertMemberResult = service.insertProjectMemberList(map);
			if (insertMemberResult > 0) {
				out.println("<script>alert('프로젝트 등록이 성공하였습니다');</script>");
				out.flush();
			} else {
				out.println("<script>alert('프로젝트 등록은 성공하였지만 멤버등록이 실패했습니다');</script>");
				out.flush();
			}
		} else {
			System.out.println("프로젝트 등록실패");
			out.println("<script>alert('프로젝트 등록이 실패하였습니다');</script>");
			out.flush();
		}
		return "home";
	}

	@RequestMapping(value = "selectProjectList.do", method = RequestMethod.GET)
	public void selectProjectList(@RequestParam(value = "empNo") int empNo, ModelAndView mv,
			HttpServletResponse response) throws JsonIOException, IOException {
		System.out.println("마스터:" + empNo);
		Map<String, Object> map = new HashMap<String, Object>();
		String info = "Y";
		map.put("empNo", empNo);
		map.put("info", info);
		List<Project> projectList = service.selectProjectList(map);
		if (!projectList.isEmpty()) {
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(projectList, response.getWriter());
//			mv.addObject("projectList", projectList);
		}
	}

	@RequestMapping(value = "selectMemberProjectList.do", method = RequestMethod.GET)
	public void selectMemberProjectList(@RequestParam(value = "empNo") int empNo, HttpServletResponse response)
			throws JsonIOException, IOException {
		System.out.println("멤버:" + empNo);
		Map<String, Object> map = new HashMap<String, Object>();
		String info = "Y";
		map.put("empNo", empNo);
		map.put("info", info);
		List<EmpProject> projectList = service.selectMemberProjectList(map);
		if (!projectList.isEmpty()) {
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(projectList, response.getWriter());
//			mv.addObject("projectList", projectList);
		}
	}

	@RequestMapping(value = "selectProjectDetail.do", method = RequestMethod.GET)
	public ModelAndView selectProjectDetail(@RequestParam(value = "projectNo") int projectNo, ModelAndView mv,
			HttpServletRequest request) {
		System.out.println(projectNo);
		Project project = service.selectProject(projectNo);

		if (project != null) {
			int masterEmpNo = project.getProjectMaster();
			Employee master = service.selectMaster(masterEmpNo);
			List<ProjectMember> memberList = service.selectMemberList(projectNo);
			ProjectTask projectTask = service.selectProjectTask(projectNo);
			// List<ProjectCalendar> projectCalendar =
			// service.selectProjectCalendar(projectNo);
			System.out.println("성공");
			HttpSession session = request.getSession();
			session.setAttribute("project", project);
			mv.addObject("master", master);
			mv.addObject("project", project);
			// mv.addObject("projectCalendar", projectCalendar);
			mv.addObject("projectTask", projectTask);
			mv.addObject("memberList", memberList);
			mv.setViewName("project/selectProjectMainPage");
		} else {
			System.out.println("프로젝트 불러오기 실패");
		}

		return mv;
	}

	@ResponseBody
	@RequestMapping(value = "deleteProjectMember.do", method = RequestMethod.GET)
	public String deleteProjectMember(@RequestParam(value = "projectNo") int projectNo,
			@RequestParam(value = "empNo") int empNo) {
		System.out.println(projectNo);
		System.out.println(empNo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("projectNo", projectNo);
		map.put("empNo", empNo);
		int result = service.deleteMemberList(map);
		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}

	@RequestMapping(value = "insertInviteProjectSearchMemberList.do", method = RequestMethod.POST)
	public void insertInviteProjectSearchMemberList(@RequestParam(value = "empNo") int empNo,
			@RequestParam(value = "projectNo") int projectNo, @RequestParam(value = "searchText") String searchText
			,HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("empNo", empNo);
		map.put("projectNo", projectNo);
		map.put("searchText", searchText);
		List<Employee> eList = service.selectInviteList(map);
		try {
			Gson gson = new Gson();
			gson.toJson(eList, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "inviteMember.do", method = RequestMethod.GET)
	public void inviteMember(@RequestParam(value = "projectNo") int projectNo, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String[] empNoList = request.getParameterValues("empNo");
		int[] empNoList2 = Arrays.stream(empNoList).mapToInt(Integer::parseInt).toArray();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("projectNo", projectNo);
		map.put("empNoList", empNoList2);
		int insertMemberResult = service.insertProjectMemberList(map);
		if (insertMemberResult > 0) {
			out.println("<script>alert('팀원 초대에 성공했습니다');</script>");
			out.println("<script>window.close();</script>");
			out.flush();
		} else {
			out.println("<script>alert('팀원 초대에 실패하였습니다');</script>");
			out.flush();
		}
	}

	@RequestMapping(value = "moveInsertProjectEvent.do", method = RequestMethod.GET)
	public ModelAndView moveInsertEvent(@RequestParam(value = "projectNo") int projectNo, ModelAndView mv) {
		mv.setViewName("project/insertProjectEvent");
		mv.addObject("projectNo", projectNo);
		return mv;
	}

	@ResponseBody
	@RequestMapping(value = "insertProjectCalendar.do", method = RequestMethod.GET)
	public String insertEmpCalendarEvent(@RequestParam(value = "eventTitle") String eventTitle,
			@RequestParam(value = "startTime") String startTime, @RequestParam(value = "endTime") String endTime,
			@RequestParam(value = "startTimeDetail") String startTimeDetail,
			@RequestParam(value = "endTimeDetail") String endTimeDetail,
			@RequestParam(value = "projectNo") int projectNo) {
		String eventStartTime = "";
		String eventEndTime = "";
		if (startTimeDetail.equals("")) {
			eventStartTime = startTime;
		} else {
			eventStartTime = startTime + "T" + startTimeDetail;
		}
		if (endTimeDetail.equals("")) {
			eventEndTime = endTime + "T23:59:00";
		} else {
			eventEndTime = endTime + "T" + endTimeDetail;
		}
		ProjectCalendar pCalendar = new ProjectCalendar();
		pCalendar.setProjectCalendarEventTitle(eventTitle);
		pCalendar.setProjectCalendarStartTime(eventStartTime);
		pCalendar.setProjectCalendarEndTime(eventEndTime);
		pCalendar.setProjectNo(projectNo);
		int result = service.insertProjectCalendarEvent(pCalendar);
		if (result > 0) {
			return "success";
		} else {
			return "false";
		}
	}

	@RequestMapping(value = "selectProjectCalendar.do", method = RequestMethod.POST)
	public void moveEmpCalendar(@RequestParam(value = "projectNo") int projectNo, ModelAndView mv,
			HttpServletResponse response) {
		List<ProjectCalendar> projectCalendar = service.selectProjectCalendar(projectNo);
		try {
			// Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			Gson gson = new Gson();
			gson.toJson(projectCalendar, response.getWriter());
			// mv.addObject("empCalendarList", empCalendar);
			// mv.addObject("empNo", empNo);
			// mv.addObject("empCalendar", empCalendar);
			// mv.setViewName("memberCalendar/selectMemberCalendar");
		} catch (Exception e) {
			// mv.addObject("msg", "실패하였습니다");
			// mv.setViewName("common/errorPage");
		}
		// return mv;
	}

	@ResponseBody
	@RequestMapping(value = "selectProjectEventDetail.do", method = RequestMethod.POST)
	public String selectEventDetail(ModelAndView mv, @RequestParam(value = "projectNo") int projectNo,
			@RequestParam(value = "calNo") int calNo) {
		System.out.println("projectNo:" + projectNo);
		System.out.println("calNo:" + calNo);
		return "success";
	}

	@RequestMapping(value = "openProjectEventDetail.do", method = RequestMethod.GET)
	public ModelAndView openEventDetail(@RequestParam(value = "calNo") int calNo, ModelAndView mv,
			@RequestParam(value = "projectNo") int projectNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("calNo", calNo);
		map.put("projectNo", projectNo);
		ProjectCalendar detailEvent = service.selectProjectEventDetail(map);
		String start = detailEvent.getProjectCalendarStartTime();
		String end = detailEvent.getProjectCalendarEndTime();
		int endIdx = 0;
		int startIdx = 0;
		String startDay = "";
		String startTime = "";
		String endDay = "";
		String endTime = "";
		if (start.contains("T")) {
			startIdx = detailEvent.getProjectCalendarStartTime().indexOf("T");
			System.out.println("T 위치 :" + endIdx + "," + startIdx);
			startDay = start.substring(0, startIdx);
			startTime = start.substring(startIdx + 1);
		} else {
			startDay = start;
		}
		if (end.contains("T")) {
			endIdx = detailEvent.getProjectCalendarEndTime().indexOf("T");
			endDay = end.substring(0, endIdx);
			endTime = end.substring(endIdx + 1);
		} else {
			endDay = end;
		}
		mv.addObject("calNo", calNo);
		mv.addObject("startDay", startDay);
		mv.addObject("startTime", startTime);
		mv.addObject("endDay", endDay);
		mv.addObject("endTime", endTime);
		mv.addObject("eventDetail", detailEvent);
		mv.setViewName("project/projectEventDetail");
		return mv;
	}

	@ResponseBody
	@RequestMapping(value = "updateProjectCalendar.do", method = RequestMethod.GET)
	public String updateEmpCalendarEvent(@RequestParam(value = "eventTitle") String eventTitle,
			@RequestParam(value = "startTime") String startTime, @RequestParam(value = "endTime") String endTime,
			@RequestParam(value = "startTimeDetail") String startTimeDetail,
			@RequestParam(value = "endTimeDetail") String endTimeDetail,
			@RequestParam(value = "projectNo") int projectNo, @RequestParam(value = "calNo") int calNo) {
		System.out.println(eventTitle);
		System.out.println(startTime);
		System.out.println(endTime);
		System.out.println(startTimeDetail);
		System.out.println(endTimeDetail);
		String eventStartTime = "";
		String eventEndTime = "";
		if (startTimeDetail.equals("")) {
			eventStartTime = startTime;
		} else {
			eventStartTime = startTime + "T" + startTimeDetail;
		}
		if (endTimeDetail.equals("")) {
			eventEndTime = endTime;
		} else {
			eventEndTime = endTime + "T" + endTimeDetail;
		}
		System.out.println(eventStartTime);
		System.out.println(eventEndTime);
		ProjectCalendar pCalendar = new ProjectCalendar();
		pCalendar.setProjectCalendarEventTitle(eventTitle);
		pCalendar.setProjectCalendarStartTime(eventStartTime);
		pCalendar.setProjectCalendarEndTime(eventEndTime);
		pCalendar.setProjectNo(projectNo);
		pCalendar.setProjectCalendarNo(calNo);
		int result = service.updateProjectCalendarEvent(pCalendar);
		if (result > 0) {
			return "success";
		} else {
			return "false";
		}
	}

	@ResponseBody
	@RequestMapping(value = "deleteProjectCalendar.do", method = RequestMethod.GET)
	public String deleteEmpCalendar(@RequestParam(value = "projectNo") int empNo,
			@RequestParam(value = "calNo") int calNo) {
		System.out.println(empNo);
		System.out.println(calNo);
		ProjectCalendar pCalendar = new ProjectCalendar();
		pCalendar.setProjectCalendarNo(calNo);
		pCalendar.setProjectNo(empNo);
		int result = service.deleteProjectCalendarEvent(pCalendar);
		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}

	@ResponseBody
	@RequestMapping(value = "insertTaskProjectSearchMemberList.do", method = RequestMethod.GET)
	public void insertTaskProjectSearchMemberList(@RequestParam(value = "projectNo") int projectNo,
			@RequestParam(value = "searchText") String searchText, @RequestParam(value = "empNo") int empNo,
			HttpServletResponse response) throws IOException {

		System.out.println(searchText);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("projectNo", projectNo);
		map.put("empNo", empNo);
		map.put("searchText", searchText);
		List<ProjectMember> eList = service.selectTaskProjectSearchList(map);
		PrintWriter out = response.getWriter();
		if (!eList.isEmpty()) {
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(eList, response.getWriter());
		} else {
			out.println("<script>alert('해당하는 팀원이 없습니다');</script>");
			out.flush();
		}

	}

	@ResponseBody
	@RequestMapping(value = "updateProjectMember.do", method = RequestMethod.GET)
	public String updateProjectMember(@RequestParam(value = "projectNo") int projectNo,
			@RequestParam(value = "empNo") int empNo, @RequestParam(value = "memberAuth") String memberAuth) {
		System.out.println(projectNo);
		System.out.println(empNo);
		System.out.println(memberAuth);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("projectNo", projectNo);
		map.put("empNo", empNo);
		map.put("memberAuth", memberAuth);
		int result = service.updateProjectMember(map);
		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}

	}

	@RequestMapping(value = "deleteProject.do", method = RequestMethod.GET)
	public String deleteProject(@RequestParam(value = "projectNo") int projectNo, HttpServletResponse response)
			throws IOException {
		int result = service.deleteProjectRequest(projectNo);
		PrintWriter out = response.getWriter();
		if (result > 0) {
			out.println("<script>alert('삭제요청이 되었습니다')</script>");
			out.flush();
			return "home";
		} else {
			out.println("<script>alert('오류가 발생했습니다')</script>");
			out.flush();
			return "home";
		}
	}

	@RequestMapping(value = "insertMainWork.do", method = RequestMethod.POST)
	public void insertMainWork(@RequestParam(value = "projectNo") int projectNo,
			@RequestParam(value = "mainWorkName") String mainWorkName, HttpServletRequest request,
			HttpServletResponse response) {
		//String[] empNoList = request.getParameterValues("empNo");
		//int[] empNoList2 = Arrays.stream(empNoList).mapToInt(Integer::parseInt).toArray();
		//String[] taskList = request.getParameterValues("taskName");
		//System.out.println(projectNo);
		//System.out.println(mainWorkName);
//		for (int i = 0; i < empNoList2.length; i++) {
//			System.out.println("empNo:" + empNoList2[i]);
//		}
//		for (int i = 0; i < taskList.length; i++) {
//			System.out.println("세부사항 제목:" + taskList[i]);
//		}
//		int n = 16;
//		char[] chs = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I',
//				'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
//		Random rd = new Random();
//		String[] taskIdList = new String[taskList.length];
//		for (int j = 0; j < taskList.length; j++) {
//			StringBuilder sb = new StringBuilder();
//			for (int i = 0; i < n; i++) {
//				char ch = chs[rd.nextInt(chs.length)];
//				sb.append(ch);
//			}
//			taskIdList[j] = sb.toString();
//		}
		
//		for(int i =0; i<taskIdList.length; i++) {
//			System.out.println(taskIdList[i]);
//		}
		try {
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("projectNo", projectNo);
			map.put("mainWorkName", mainWorkName);
			int mainWorkResult = service.insertMainWork(map);
			if(mainWorkResult > 0) {
				out.println("<script>");
				out.println("alert('대표 업무가 등록되었습니다.')");
				out.println("location.href='selectProjectDetail.do?projectNo="+projectNo+"'");
				out.println("</script>");
//				out.println("<script>location.href='selectProjectDetail.do?projectNo='"+projectNo+"</script>");
				//return "";
			}else {
				out.println("<script>alert('대표 업무 등록 실패')</script>");
				//return "";
			}
			//ProjectTask task = service.selectTask(projectNo);
			//int taskNo = task.getTaskNo();
		} catch (IOException e) {
			e.printStackTrace();
			//return "";
		}
		//return "redirect:selectProjectDetail.do?projectNo="+projectNo;
	}
	
	
	@ResponseBody
	@RequestMapping(value="deleteProjectMainWork.do", method=RequestMethod.POST)
	public String deleteProjectMainWork(
			@RequestParam(value="projectNo") int projectNo
			,@RequestParam(value="taskNo") int taskNo
			) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("projectNo", projectNo);
		map.put("taskNo", taskNo);
		int result = service.deleteMainWork(map);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	
//	@ResponseBody
	@RequestMapping(value="insertTask.do", method=RequestMethod.POST)
	public void insertTask(
			@RequestParam(value="projectNo") int projectNo
			,@RequestParam(value="taskName") String taskName
			,HttpServletRequest request
			,ModelAndView mv
			,HttpServletResponse response
			) throws IOException {
		String[] empNoList = request.getParameterValues("empNo");
		int[] empNoList2 = Arrays.stream(empNoList).mapToInt(Integer::parseInt).toArray();
		System.out.println(taskName);
		System.out.println(projectNo);
		for (int i = 0; i < empNoList2.length; i++) {
			System.out.println("empNo:" + empNoList2[i]);
		}
		
		
		int n = 16;
		char[] chs = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I',
				'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
		Random rd = new Random();
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < n; i++) {
				char ch = chs[rd.nextInt(chs.length)];
				sb.append(ch);
		}
		String taskId = sb.toString();
		ProjectTask task = service.selectProjectTask(projectNo);
		int taskNo = task.getTaskNo();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("projectNo", projectNo);
		map.put("taskName", taskName);
		map.put("taskNo", taskNo);
		map.put("empNoList", empNoList2);
		map.put("taskId", taskId);
		String complete = "Y";
		map.put("complete", complete);
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		int result = service.insertProjectTaskDetail(map);
		int taskCount = service.taskTotalCount(map);
		if(result > 0) {
			int mainWorkTotalCount = service.taskTotalCount(map);
			int mainWorkTaskCompleteCount = service.mainWorkDetailCompleteCount(map);
			int mainWorkProcessivity = 0;
			if(mainWorkTaskCompleteCount > 0) {
				mainWorkProcessivity = Math.round((100*mainWorkTaskCompleteCount)/mainWorkTotalCount);
			}
			map.put("mainWorkProcessivity", mainWorkProcessivity);
			int mainWorkUpdate = service.updateMainWorkProcessivity(map);
			if(mainWorkUpdate > 0) {
				out.println("<script>");
				out.println("alert('세부업무가 등록되었습니다.')");
				out.println("location.href='selectProjectDetail.do?projectNo="+projectNo+"'");
				out.println("</script>");
				//return "redirect:selectProjectDetail.do?projectNo="+projectNo;
			}else {
				out.println("<script>alert('세부 사항 등록이 실패하였습니다.')</script>");	
				out.flush();
				//return "common/errorPage";				
			}
		}else {
			out.println("<script>alert('세부 사항 등록이 실패하였습니다.');");	
			out.flush();
			//return "common/errorPage";
		}
		//mv.setViewName("project/selectProjectMainPage");
		
	}
	
	@RequestMapping(value="moveTaskMemberList.do", method=RequestMethod.GET)
	public ModelAndView taskDetailMemberList(
			@RequestParam(value="taskNo") int taskNo
			,@RequestParam(value="taskDetailNo") int taskDetailNo
			,ModelAndView mv) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("taskNo", taskNo);
		map.put("taskDetailNo", taskDetailNo);
		List<ProjectMember> memberList = service.selectTaskMemberList(map);
		String complete = "Y";
		String progress = "N";
		mv.addObject("complete", complete);
		mv.addObject("progress", progress);
		mv.addObject("taskNo", taskNo);
		mv.addObject("memberList", memberList);
		mv.addObject("taskDetailNo", taskDetailNo);
		mv.setViewName("project/taskDetailMemberList");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="successDetailTask.do", method=RequestMethod.POST)
	public String successDetailTask(
			@RequestParam(value="taskNo") int taskNo
			,@RequestParam(value="empNo") int empNo
			,@RequestParam(value="projectNo") int projectNo
			,@RequestParam(value="taskDetailNo") int taskDetailNo
			) {
		Map<String, Object> map = new HashMap<String, Object>();
		String complete = "Y";
		map.put("complete", complete);
		map.put("taskNo", taskNo);
		map.put("empNo", empNo);
		map.put("projectNo", projectNo);
		map.put("taskDetailNo", taskDetailNo);
		int result = service.successDetailTask(map);
		if(result > 0) {
			int mainWorkTotalCount = service.taskTotalCount(map);
			int mainWorkTaskCompleteCount = service.mainWorkDetailCompleteCount(map);
			int mainWorkProcessivity = 0;
			if(mainWorkTaskCompleteCount > 0) {
				mainWorkProcessivity = Math.round((100*mainWorkTaskCompleteCount)/mainWorkTotalCount);
			}
			map.put("mainWorkProcessivity", mainWorkProcessivity);
			int mainWorkUpdate = service.updateMainWorkProcessivity(map);
			if(mainWorkUpdate > 0) {
				return "success";
			}else {
				return "fail";				
			}
		}else {
			return "fail";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="deleteTaskDetail.do", method=RequestMethod.GET)
	public String deleteTaskDetail(
			@RequestParam(value="taskNo") int taskNo
			,@RequestParam(value="taskDetailNo") int taskDetailNo
			,@RequestParam(value="projectNo") int projectNo
			) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("taskNo", taskNo);
		map.put("taskDetailNo", taskDetailNo);
		map.put("projectNo", projectNo);
		String complete = "Y";
		map.put("complete", complete);
		int result = service.deleteTaskDetail(map);
		if(result > 0) {
			int mainWorkTotalCount = service.taskTotalCount(map);
			int mainWorkTaskCompleteCount = service.mainWorkDetailCompleteCount(map);
			int mainWorkProcessivity = 0;
			if(mainWorkTaskCompleteCount > 0) {
				mainWorkProcessivity = Math.round((100*mainWorkTaskCompleteCount)/mainWorkTotalCount);
			}
			map.put("mainWorkProcessivity", mainWorkProcessivity);
			int mainWorkUpdate = service.updateMainWorkProcessivity(map);
			if(mainWorkUpdate > 0) {
				return "success";
			}else {
				return "fail";				
			}
		}else {
			return "fail";
		}
	}
	
	
	@RequestMapping(value="moveUpdateTaskDetail.do", method = RequestMethod.GET)
	public ModelAndView moveUpdateTaskDetail(
			@RequestParam(value="taskNo") int taskNo
			,@RequestParam(value="taskDetailNo") int taskDetailNo
			,@RequestParam(value="projectNo") int projectNo
			,ModelAndView mv
			) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("taskNo", taskNo);
		map.put("taskDetailNo", taskDetailNo);
		map.put("projectNo", projectNo);
		ProjectTaskDetail taskDetail = service.selectTaskDetail(map);
		if(taskDetail != null) {
			List<ProjectMember> memberList = service.selectTaskMemberList(map);
			mv.addObject("taskDetail", taskDetail);
			mv.addObject("memberList", memberList);
			mv.setViewName("project/updateTask");
		}
		return mv;
	}
	
	@RequestMapping(value="updateTask.do", method = RequestMethod.POST)
	public void updateTask(
			@RequestParam(value="projectNo") int projectNo
			,@RequestParam(value="taskNo") int taskNo
			,@RequestParam(value="taskDetailNo") int taskDetailNo
			,@RequestParam(value="taskName") String taskName
			,HttpServletRequest request
			,HttpServletResponse response
			) throws IOException {
		String[] empNoList = request.getParameterValues("empNo");
		int[] empNoList2 = Arrays.stream(empNoList).mapToInt(Integer::parseInt).toArray();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("projectNo", projectNo);
		map.put("taskNo", taskNo);
		map.put("taskDetailNo", taskDetailNo);
		map.put("taskName", taskName);
		map.put("empNoList", empNoList2);
		String complete = "Y";
		map.put("complete", complete);
		int n = 16;
		char[] chs = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I',
				'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
		Random rd = new Random();
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < n; i++) {
				char ch = chs[rd.nextInt(chs.length)];
				sb.append(ch);
		}
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		String taskId = sb.toString();
		map.put("taskId", taskId);
		int result = service.deleteTaskDetail(map);
		if(result  > 0) {
			int result1 = service.insertProjectTaskDetail(map);
			int mainWorkTotalCount = service.taskTotalCount(map);
			int mainWorkTaskCompleteCount = service.mainWorkDetailCompleteCount(map);
			int mainWorkProcessivity = 0;
			if(mainWorkTaskCompleteCount > 0) {
				mainWorkProcessivity = Math.round((100*mainWorkTaskCompleteCount)/mainWorkTotalCount);
			}
			map.put("mainWorkProcessivity", mainWorkProcessivity);
			int mainWorkUpdate = service.updateMainWorkProcessivity(map);
			if(mainWorkUpdate > 0) {
				out.println("<script>window.opener.location.reload();</script>");
				out.println("<script>alert('수정이 완료되었습니다')</script>");
				out.println("<script>window.close();</script>");
				//return "redirect:selectProjectMainWork.do?projectNo"+projectNo;
			}else {
				out.println("<script>alert('오류가 발생했습니다')</script>");
				//return "fail";				
			}
		}
		//return "common/errorPage";
	}
	
	@RequestMapping(value="selectDetailMainWork.do", method = RequestMethod.GET)
	public ModelAndView moveDetailMainWork(
			@RequestParam(value="projectNo") int projectNo
			,ModelAndView mv
			) {
		ProjectTask task = service.selectTask(projectNo);
		mv.addObject("projectNo", projectNo);
		mv.addObject("projectTask", task);
		mv.setViewName("project/detailMainWork");
		return mv;		
	}
	
	@ResponseBody
	@RequestMapping(value="updateMainWork.do", method = RequestMethod.POST)
	public String updateMainWork(
			@RequestParam(value="projectNo") int projectNo
			,@RequestParam(value="taskNo") int taskNo
			,@RequestParam(value="taskTitle") String taskTitle
			) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("projectNo", projectNo);
		map.put("taskNo", taskNo);
		map.put("taskTitle", taskTitle);
		int result = service.updateMainWork(map);
		if(result>0) {			
			return "success";
		}else {
			return "fail";
		}
	}
		
}
