package com.neuron.spring.holiday.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.neuron.spring.approval.domain.Document;
import com.neuron.spring.attend.domain.Attendance;
import com.neuron.spring.attend.domain.PageInfo;
import com.neuron.spring.attend.domain.Pagination;
import com.neuron.spring.holiday.service.HolidayService;

@Controller
public class HolidayController {
	
	@Autowired
	private HolidayService service;
//
//	@RequestMapping(value="holidayList.do", method=RequestMethod.GET)
//	public ModelAndView holidayListView(
//			ModelAndView mv
//			,@RequestParam(value="page", required=false) Integer page) {
//		int currentPage = (page != null) ? page:1;
//		int totalCount = service.getListCount();
//		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
//		List<Attendance> dList = service.printAll(); //pi 넣어야해
//		if(!dList.isEmpty()) {
//			mv.addObject("dList", dList);
//			mv.addObject("pi",pi);
//			mv.setViewName("attend/holidayList");
//		}else {
//			mv.addObject("msg", "게시글 전체조회 실패");
//			mv.setViewName("common/errorPage");
//		}
//		return mv;
//		
//	}
	@RequestMapping(value="holidayList.do", method=RequestMethod.GET)
	public String showHolidayList(Model model) {
		try {
			List<Attendance> dList = service.printAll();
			if(!dList.isEmpty()) {
				model.addAttribute("dList", dList);
			}else {
				model.addAttribute("dList", null);				
			}
			return "attend/holidayList";
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.toString());
			return "common/errorPage";
		}
	}
			
}
