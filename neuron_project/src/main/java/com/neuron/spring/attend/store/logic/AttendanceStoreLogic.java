package com.neuron.spring.attend.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.neuron.spring.attend.domain.Attendance;
import com.neuron.spring.attend.domain.PageInfo;
import com.neuron.spring.attend.store.AttendanceStore;

@Repository
public class AttendanceStoreLogic implements AttendanceStore{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		int count = sqlSession.selectOne("AttendanceMapper.selectListCount");
		return count;
	}

	@Override
	public List<Attendance> selectAll(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		List<Attendance> aList = sqlSession.selectList("AttendanceMapper.selectAllList", pi, rowBounds);
		return aList;
	}

}
