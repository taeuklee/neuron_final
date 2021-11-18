package com.neuron.spring.mail.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.neuron.spring.attend.domain.PageInfo;
import com.neuron.spring.mail.domain.Mail;
import com.neuron.spring.mail.store.MailStore;

@Repository
public class MailStoreLogic implements MailStore{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount(int empNo) {
		int count = sqlSession.selectOne("mailMapper.selectReceiverListCount",empNo);
		return count;
	}

	@Override
	public List<Mail> selectAll(PageInfo pi, int empNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		List<Mail> mList = sqlSession.selectList("mailMapper.selectReceiverAllList", empNo, rowBounds);
		return mList;
	}

	@Override
	public int selectOutListCount(int empNo) {
		int count = sqlSession.selectOne("mailMapper.selectSenderListCount",empNo);
		return count;
	}

	@Override
	public List<Mail> selectAllOut(PageInfo pi, int empNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		List<Mail> mList = sqlSession.selectList("mailMapper.selectSenderAllList", empNo, rowBounds);
		return mList;
	}

	@Override
	public int selectChkOutListCount(int empNo) {
		int count = sqlSession.selectOne("mailMapper.selectSenderListCount",empNo);
		return count;
	}

	@Override
	public List<Mail> selectAllChkOut(PageInfo pi, int empNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		List<Mail> mList = sqlSession.selectList("mailMapper.selectSenderAllList", empNo, rowBounds);
		return mList;
	}

}
