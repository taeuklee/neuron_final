package com.neuron.spring.attend.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.neuron.spring.attend.domain.Attendance;
import com.neuron.spring.attend.domain.PageInfo;
import com.neuron.spring.attend.store.AttendanceStore;
import com.neuron.spring.employee.domain.Employee;

@Repository
public class AttendanceStoreLogic implements AttendanceStore{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount(int empNo) {
		int count = sqlSession.selectOne("attendanceMapper.selectListCount", empNo);
		return count;
	}

	@Override
	public List<Attendance> selectAll(PageInfo pi, int empNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		List<Attendance> aList = sqlSession.selectList("attendanceMapper.selectAllList", empNo, rowBounds);
		return aList;
	}


}
