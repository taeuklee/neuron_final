package com.neuron.spring.mail.store.logic;

import java.util.List;
import java.util.Map;

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
	public int selectListCount(int receiverId) {
		int count = sqlSession.selectOne("mailMapper.selectListCount",receiverId);
		return count;
	}

	@Override
	public List<Mail> selectAll(PageInfo pi, int receiverId) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		List<Mail> mList = sqlSession.selectList("mailMapper.selectAllList", receiverId, rowBounds);
		return mList;
	}

}
