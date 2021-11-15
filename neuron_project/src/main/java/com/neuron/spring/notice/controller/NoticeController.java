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
import org.springframework.web.servlet.ModelAndView;

import com.neuron.spring.notice.domain.Notice;
import com.neuron.spring.notice.domain.PageInfo;
import com.neuron.spring.notice.domain.Pagination;
import com.neuron.spring.notice.service.NoticeService;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService service;

	// 페이징 처리
	// 모델+뷰 => 그냥 모델보다 기능이 많아요
	@RequestMapping(value="noticeListView.do", method=RequestMethod.GET)
	public ModelAndView noticeListView(ModelAndView mv, @RequestParam(value="page", required=false) Integer page) {
		int currentPage = (page != null) ? page : 1; // 첫 페이지 1로 지정
		int totalCount = service.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount); // 페이지 얼마나 출력할지 몇개 출력할지를 페이지네이션에서 정해서 가져옴
		List<Notice> nList = service.printAllNotice(pi);
		if(!nList.isEmpty()) {
			mv.addObject("nList", nList);
			mv.addObject("pi", pi);
			mv.setViewName("notice/noticeListView");
		}else {
			mv.addObject("msg", "게시글 전체조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	
//	// 리스트 띄우기
//	@RequestMapping(value="noticeListView.do", method=RequestMethod.GET)
//	public String ShowNoticeList(Model model) {
//		try {
//			List<Notice> nList = service.printAll();
//			if(!nList.isEmpty()) {
//				model.addAttribute("nList",nList);
//			}else {
//				model.addAttribute("nList",null);
//			}
//			return "notice/noticeListView";
//		}catch(Exception e) {
//			model.addAttribute("msg", e.toString());
//			return "common/errorPage";
//		}
//	}
	
	
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
			return "redirect:noticeListView.do";
		}else {
			model.addAttribute("msg", "공지사항 등록 실패");
			return "common/errorPage";
		}

	}
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		
		// 파일 저장 경로 설정
		String root = request.getSession().getServletContext().getRealPath("resources");
		// 저장 폴더 선택
		String savePath = root + "\\noUploadFiles";
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
	
	// 공지사항 상세보기
	@RequestMapping(value="noticeDetailView.do", method=RequestMethod.GET)
	public String noticeDetail(@RequestParam("noticeNo") int nId, Model model) {
		try {
			Notice notice = service.printOneNotice(nId);
			if(notice != null) {
				model.addAttribute("notice", notice);
				return "notice/noticeDetailView";
			}else {
				model.addAttribute("msg", "공지사항 상세조회 실패");
				return "common/errorPage";
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "공지사항 상세조회 실패");
			return "common/errorPage";		
		}

	}
	
	// 수정 창 띄우기
	@RequestMapping(value="noticeModifyView.do", method=RequestMethod.GET)
	public String noticeModify(@RequestParam("noticeNo") int nId, Model model) {
		Notice notice = service.printOneNotice(nId);
		model.addAttribute("notice", notice);
		return "notice/noticeModifyView";
	}
	

	// 수정하기
	@RequestMapping(value="noticeModifyView.do", method=RequestMethod.POST)
	public String noticeUpdate(
			@ModelAttribute Notice notice
			, Model model
			, HttpServletRequest request
			, @RequestParam("reloadFile") MultipartFile reloadFile) {
		// 수정은 업로드된 파일이 있을 경우
		if(reloadFile != null && !reloadFile.isEmpty()) {
			if(notice.getNoticeFilePath() != null) {
				// 삭제하고
				deleteFile(notice.getNoticeFilePath(), request);
			}
			// 다시 업로드
			String savePath = saveFile(reloadFile, request);
			if(savePath != null) {
				notice.setNoticeFilePath(reloadFile.getOriginalFilename());
			}
		}
		
		// DB 데이터 수정
		int result = service.modifyNotice(notice);
		if(result > 0) {
			return "redirect:noticeDetailView.do?noticeNo="+notice.getNoticeNo();
		}else {
			model.addAttribute("msg", "공지사항 수정 실패");
			return "common/errorPage";
			}
		}

		
		
	// 기존파일 삭제
	public void deleteFile(String fileName, HttpServletRequest request) {
		// 파일 저장 경로 설정
		String root = request.getSession().getServletContext().getRealPath("resources");
		// 저장 폴더 선택
		String deletePath = root + "\\noUploadFiles";
		File deleteFile = new File(deletePath+"\\"+fileName); 
			if(deleteFile.exists()) {
				deleteFile.delete(); // 파일삭제
			}
		
	}
	
	// 공지사항 삭제
	@RequestMapping(value="noticeDelete.do", method=RequestMethod.GET) 
	public String noticeDelete(@RequestParam("noticeNo") int nId, Model model, HttpServletRequest request) {
		Notice notice = service.printOneNotice(nId);
		int result = service.removeNotice(nId);
		if(result > 0) {
			if(notice.getNoticeFilePath() != null) {
				deleteFile(notice.getNoticeFilePath(), request);
			}
			return "redirect:noticeListView.do";
		}else {
			model.addAttribute("msg", "공지사항 삭제 실패");
			return "common/errorPage";
		}
	}
	

}
