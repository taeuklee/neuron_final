package com.neuron.spring.attend.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.neuron.spring.attend.domain.Attendance;
import com.neuron.spring.attend.domain.PageInfo;
import com.neuron.spring.attend.domain.Pagination;
import com.neuron.spring.attend.service.AttendanceService;

@Controller
public class AttendanceController {

	@Autowired
	public AttendanceService service;
	
	@RequestMapping(value="attendanceList.do", method=RequestMethod.GET)
		public ModelAndView attendListView(
		ModelAndView mv
		,@RequestParam(value="page", required=false) Integer page) {
			int currentPage = (page !=null) ? page: 1;
			int totalCount = service.getListCount();
			PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
			// pagination이 pageInfo를 꾸며준다
			List<Attendance> aList = service.printAll(pi);
			if(!aList.isEmpty()) {
			//	return "board/boardListView" 이건 string 일때 쓰는거임
				mv.addObject("aList", aList);
				// addObject = modelandview쓰는구나 알아야해 addObject = addAttribute
				mv.addObject("pi",pi);
				// 이걸 적어야 boardListView에서 ${pi. 뭐시기 } 쓸수 있어
				mv.setViewName("attend/attendanceList");
				
			}else {
				mv.addObject("msg", "게시글 전체조회 실패");
				mv.setViewName("attend/attendanceList");
			}
			return mv;
	}
}
