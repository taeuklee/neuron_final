package com.neuron.spring.holiday.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.neuron.spring.approval.domain.Document;
import com.neuron.spring.attend.domain.Attendance;
import com.neuron.spring.attend.domain.PageInfo;
import com.neuron.spring.holiday.store.HolidayStore;

@Repository
public class HolidayStoreLogic implements HolidayStore{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		int count = sqlSession.selectOne("attendanceMapper.selectListCount"); 
		return count;
	}

	@Override
	public List<Attendance> selectAll() {
		List<Attendance> dList = sqlSession.selectList("attendanceMapper.selectAllList");
		return dList;
	}

//	@Override
//	public int selectListCount(int empNo) {
//		int count = sqlSession.selectOne("attendanceMapper.selectListCount", empNo); 
//		return count;
//	}
//
//	@Override
//	public List<Document> selectAll(PageInfo pi, int empNo) {
//		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
//		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
//		List<Document> dList = sqlSession.selectList("attendanceMapper.selectAllList", empNo, rowBounds);
//		return dList;
//	}
//

}
