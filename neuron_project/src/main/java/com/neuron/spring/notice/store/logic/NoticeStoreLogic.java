package com.neuron.spring.notice.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.neuron.spring.notice.domain.Notice;
import com.neuron.spring.notice.domain.PageInfo;
import com.neuron.spring.notice.store.NoticeStore;

@Repository
public class NoticeStoreLogic implements NoticeStore{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertNotice(Notice notice) {
		int result = sqlSession.insert("noticeMapper.insertNotice", notice);
		return result;
	}

	@Override
	public Notice selectOneNotice(int nId) {
		Notice notice = sqlSession.selectOne("noticeMapper.selectOneNotice", nId);
		return notice;
	}

	@Override
	public int updateNotice(Notice notice) {
		int result = sqlSession.update("noticeMapper.updateNotice", notice);
		return result;
	}

	@Override
	public int deleteNotice(int nId) {
		int result = sqlSession.delete("noticeMapper.deleteNotice", nId);
		return result;
	}

	@Override
	public int selectListCount() {
		int count = sqlSession.selectOne("noticeMapper.selectListCount");
		return count;
	}

	@Override
	public List<Notice> selectAllNotice(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1 ) * pi.getNoticeLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getNoticeLimit());
		List<Notice> nList = sqlSession.selectList("noticeMapper.selectAllNotice", pi, rowBounds);
		return nList;
	}


}
