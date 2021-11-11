package com.neuron.spring.attend.domain;


public class Pagination {
	public static PageInfo getPageInfo(int currentPage, int totalCount) {
		PageInfo pi =null;
		
		int naviLimit = 10; 
		int boardLimit = 5;
		int maxPage;		
		int startNavi;		
		int endNavi;		
		
		maxPage = (int)((double)naviLimit/boardLimit + 0.9);
		startNavi = (((int)((double)currentPage/naviLimit+ 0.9)) - 1) * naviLimit + 1;
		endNavi = startNavi + naviLimit -1;
		if(maxPage < endNavi) {
			endNavi = maxPage;
		}
		pi = new PageInfo(currentPage, boardLimit, naviLimit, startNavi, endNavi, totalCount, maxPage);
		return pi;
		
	}
}
