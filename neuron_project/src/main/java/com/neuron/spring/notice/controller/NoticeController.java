package com.neuron.spring.notice.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.neuron.spring.notice.domain.Notice;
import com.neuron.spring.notice.service.NoticeService;



@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService service;
	
	// 리스트 띄우기
	@RequestMapping(value="noticeListView.do", method=RequestMethod.GET)
	public String ShowNoticeList(Model model) {
		try {
			List<Notice> nList = service.printAll();
			if(!nList.isEmpty()) {
				model.addAttribute("nList",nList);
			}else {
				model.addAttribute("nList",null);
			}
			return "notice/noticeListView";
		}catch(Exception e) {
			model.addAttribute("msg", e.toString());
			return "common/errorPage";
		}
	}
	
	
	// 입력창 띄우기
	@RequestMapping(value="noticeWriteForm.do", method=RequestMethod.GET)
	public String noticeWriteView() {
		return "notice/noticeWriteForm";
	}
	
	// 등록하기
	@RequestMapping(value="noticeRegister.do", method=RequestMethod.POST) 
	public String registerNotice(@ModelAttribute com.neuron.spring.notice.domain.Notice notice, 
			// false -> 파일이 있을수도 없을 수도 있음
			@RequestParam(value="uploadFile", required=false) MultipartFile uploadFile,
			HttpServletRequest request, 
			Model model){
		// value 값을 jsp의 input태그의 name 값이고
		// require=false, 파일이 필수가 아님을 알려주는 것
		// MultipartFile은 MultipartResolver 객체를 빈으로 등록해서 사용한다는 것이다.
		if(!uploadFile.getOriginalFilename().contentEquals("")) {
			// uploadFile이 비어있지 않으면
			String filePath = saveFile(uploadFile, request);
			if(filePath != null) {
				notice.setNoticeFilePath(uploadFile.getOriginalFilename());
			}
		}
		int result = service.registerNotice(notice);
		if(result > 0) {
			return "redirect:home.kh";
		}else {
			model.addAttribute("msg", "공지사항 등록 실패");
			return "common/errorPage";
		}

	}
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		
		// 파일 저장 경로 설정
		String root = request.getSession().getServletContext().getRealPath("resources");
		// 저장 폴더 선택
		String savePath = root + "\\nuploadFiles";
		// 없으면 생성
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdir(); // 폴더 생성
		}
		String filePath = folder + "\\" + file.getOriginalFilename();
		// 파일 저장
		try {
			file.transferTo(new File(filePath)); // 파일 저장
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 파일 경로 리턴
		
		return filePath;
	}

}
