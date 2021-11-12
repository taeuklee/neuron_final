package com.neuron.spring.notice.store;

import java.util.List;

import com.neuron.spring.notice.domain.Notice;

public interface NoticeStore {

	List<Notice> selectAll();

	int insertNotice(Notice notice);

}
