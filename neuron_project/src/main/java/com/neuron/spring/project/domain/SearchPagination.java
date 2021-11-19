package com.neuron.spring.project.domain;

public class SearchPagination {

	public static PageInfo getPageInfo(int currentPage, int totalCount) {
		PageInfo pi = null;
		
		int naviLimit = 5; // 한 페이지에서 보여줄 ??
		int boardLimit = 5; // 한 페이지에서 보여줄 ??
		int maxPage;		// 전체 페이지에서 가장 ??
		int startNavi;		// 한 페이지에서 시작하는 페이지 번호
		int endNavi;		// 한 페이지에서 끝나는 페이지 번호
		
		maxPage = (int)((double)totalCount/boardLimit + 0.9);
		startNavi = (((int)((double)currentPage/naviLimit + 0.9)) - 1) 
						* naviLimit + 1;
		endNavi = startNavi + naviLimit - 1;
		if(maxPage < endNavi) {
			endNavi = maxPage;
		}
		pi = new PageInfo(
				currentPage, boardLimit
				, naviLimit, startNavi
				, endNavi, totalCount
				, maxPage);
		return pi;
	}
}
