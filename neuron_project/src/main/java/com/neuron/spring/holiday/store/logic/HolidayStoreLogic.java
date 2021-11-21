package com.neuron.spring.holiday.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.neuron.spring.approval.domain.Document;
import com.neuron.spring.attend.domain.Attendance;
import com.neuron.spring.attend.domain.PageInfo;
import com.neuron.spring.employee.domain.Employee;
import com.neuron.spring.holiday.store.HolidayStore;

@Repository
public class HolidayStoreLogic implements HolidayStore{

	@Autowired
	private SqlSessionTemplate sqlSession;
	

	@Override
	public int selectListCount(int empNo) {
		int count = sqlSession.selectOne("approvalMapper.selectHlistCount", empNo); 
		return count;
	}

	@Override
	public List<Document> selectAll(PageInfo pi, int empNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		List<Document> dList = sqlSession.selectList("approvalMapper.selectAllHlist", empNo, rowBounds);
		return dList;
	}

	@Override
	public List<Employee> selectEmpAll(int empNo) {
		List<Employee> eList = sqlSession.selectList("employeeMapper.selectEmpAll", empNo);
		return eList;
	}


}
