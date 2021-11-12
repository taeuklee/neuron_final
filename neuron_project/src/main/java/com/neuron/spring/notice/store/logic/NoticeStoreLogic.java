package com.neuron.spring.notice.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.neuron.spring.notice.domain.Notice;
import com.neuron.spring.notice.store.NoticeStore;

@Repository
public class NoticeStoreLogic implements NoticeStore{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Notice> selectAll() {
		List<Notice> nList = sqlSession.selectList("noticeMapper.selectNoticeList");
		return nList;
	}
	
	@Override
	public int insertNotice(Notice notice) {
		int result = sqlSession.insert("noticeMapper.insertNotice", notice);
		return result;
	}


}
