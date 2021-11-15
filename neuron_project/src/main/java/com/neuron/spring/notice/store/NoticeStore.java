package com.neuron.spring.notice.store;

import java.util.List;

import com.neuron.spring.notice.domain.Notice;
import com.neuron.spring.notice.domain.PageInfo;

public interface NoticeStore {
	
	int selectListCount();

	List<Notice> selectAllNotice(PageInfo pi);


	int insertNotice(Notice notice);

	Notice selectOneNotice(int nId);

	int updateNotice(Notice notice);

	int deleteNotice(int nId);


}
