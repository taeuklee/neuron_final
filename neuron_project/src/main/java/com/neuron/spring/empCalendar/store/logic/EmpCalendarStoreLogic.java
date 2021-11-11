package com.neuron.spring.empCalendar.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.neuron.spring.empCalendar.domain.EmpCalendar;
import com.neuron.spring.empCalendar.store.EmpCalendarStore;

@Repository
public class EmpCalendarStoreLogic implements EmpCalendarStore{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<EmpCalendar> selectEmpCalendarList(int empNo) {
		List<EmpCalendar> empCalendarList = sqlSession.selectList("empCalendarMapper.selectEmpCalendarList", empNo);
		return empCalendarList;
	}

	@Override
	public int insertEmpCalendarEvent(EmpCalendar eCalendar) {
		int result = sqlSession.insert("empCalendarMapper.insertEvent", eCalendar);
		return result;
	}

	@Override
	public EmpCalendar selectEventDetail(int calNo) {
		EmpCalendar eventDetail = sqlSession.selectOne("empCalendarMapper.selectDetail", calNo);
		return eventDetail;
	}

	@Override
	public int updateEmpCalendarEvent(EmpCalendar eCalendar) {
		int result = sqlSession.update("empCalendarMapper.updateEvent", eCalendar);
		return result;
	}

	@Override
	public int deleteEmpCalendarEvent(EmpCalendar eCalendar) {
		int result = sqlSession.delete("empCalendarMapper.deleteEvent", eCalendar);
		return result;
	}


}
