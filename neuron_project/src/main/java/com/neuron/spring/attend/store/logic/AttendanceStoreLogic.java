package com.neuron.spring.attend.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.neuron.spring.attend.domain.Attendance;
import com.neuron.spring.attend.domain.PageInfo;
import com.neuron.spring.attend.domain.Search;
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

	@Override
	public int putTime(Attendance attend) {
		int result = sqlSession.insert("attendanceMapper.putTime", attend);
		return result;
	}

	@Override
	public Attendance selectOne(int empNo) {
		Attendance attend = sqlSession.selectOne("attendanceMapper.selectOne", empNo);
		return attend;
	}

	@Override
	public int putFinishTime(Attendance attend) {
		int result = sqlSession.insert("attendanceMapper.putFinishTime", attend);
		return result;
	}

	@Override
	public int selectListCountAbs(int empNo) {
		int countAbs = sqlSession.selectOne("attendanceMapper.selectListCountAbs", empNo);
		return countAbs;
	}

	@Override
	public int selectListCountLate(int empNo) {
		int countLate = sqlSession.selectOne("attendanceMapper.selectListCountLate", empNo);
		return countLate;
	}

	@Override
	public int selectListCountNor(int empNo) {
		int count = sqlSession.selectOne("attendanceMapper.selectListCountNor", empNo);
		return count;
	}

	@Override
	public List<Attendance> searchList(Search search) {
		List<Attendance> aList = sqlSession.selectList("attendanceMapper.searchList", search);
		return aList;
	}

	@Override
	public int checkDate(int empNo) {
		int result = sqlSession.selectOne("attendanceMapper.checkDate", empNo);
		return result;
	}

	@Override
	public int selectListCount() {
		int result = sqlSession.selectOne("attendanceMapper.selectListCount");
		return result;
	}

	@Override
	public List<Employee> selectAllEmpList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		List<Employee> eList 
			= sqlSession.selectList("employeeMapper.selectAllEmpList", pi, rowBounds);
		return eList;
	}




}
