package com.neuron.spring.notice.domain;

public class PageInfo {
	
	// 현재 페이지
	private int currentPage;
	// 몇개의 게시글
	private int noticeLimit;
	// 몇개의 네비게이션 수
	private int naviLimit;
	// 네비게이션 첫번째 값
	private int startNavi;
	// 네비게이션 마지막 값
	private int endNavi;
	// 전체 게시글 갯수
	private int titalCount;
	// 페이지 마지막 번호
	private int maxPage;
	
	public PageInfo() {}

	public PageInfo(int currentPage, int noticeLimit, int naviLimit, int startNavi, int endNavi, int titalCount,
			int maxPage) {
		super();
		this.currentPage = currentPage;
		this.noticeLimit = noticeLimit;
		this.naviLimit = naviLimit;
		this.startNavi = startNavi;
		this.endNavi = endNavi;
		this.titalCount = titalCount;
		this.maxPage = maxPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getNoticeLimit() {
		return noticeLimit;
	}

	public void setNoticeLimit(int noticeLimit) {
		this.noticeLimit = noticeLimit;
	}

	public int getNaviLimit() {
		return naviLimit;
	}

	public void setNaviLimit(int naviLimit) {
		this.naviLimit = naviLimit;
	}

	public int getStartNavi() {
		return startNavi;
	}

	public void setStartNavi(int startNavi) {
		this.startNavi = startNavi;
	}

	public int getEndNavi() {
		return endNavi;
	}

	public void setEndNavi(int endNavi) {
		this.endNavi = endNavi;
	}

	public int getTitalCount() {
		return titalCount;
	}

	public void setTitalCount(int titalCount) {
		this.titalCount = titalCount;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	@Override
	public String toString() {
		return "PageInfo [currentPage=" + currentPage + ", noticeLimit=" + noticeLimit + ", naviLimit=" + naviLimit
				+ ", startNavi=" + startNavi + ", endNavi=" + endNavi + ", titalCount=" + titalCount + ", maxPage="
				+ maxPage + "]";
	}
	
	

}
