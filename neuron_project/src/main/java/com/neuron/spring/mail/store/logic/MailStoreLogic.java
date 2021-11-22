package com.neuron.spring.mail.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.neuron.spring.attend.domain.PageInfo;
import com.neuron.spring.employee.domain.Dept;
import com.neuron.spring.employee.domain.Employee;
import com.neuron.spring.employee.domain.Team;
import com.neuron.spring.mail.domain.Mail;
import com.neuron.spring.mail.domain.Search;
import com.neuron.spring.mail.store.MailStore;

@Repository
public class MailStoreLogic implements MailStore{

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Override
	public String selectOneEmail(int empNo) {
		String email = sqlSession.selectOne("employeeMapper.selectOneEmail", empNo);
		return email;
	}
	
	@Override
	public int selectListCount(String email) {
		int count = sqlSession.selectOne("mailMapper.selectReceiverListCount",email);
		return count;
	}

	@Override
	public List<Mail> selectAll(PageInfo pi, String email) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		List<Mail> mList = sqlSession.selectList("mailMapper.selectReceiverAllList", email, rowBounds);
		return mList;
	}

	@Override
	public int selectOutListCount(String email) {
		int count = sqlSession.selectOne("mailMapper.selectSenderListCount",email);
		return count;
	}

	@Override
	public List<Mail> selectAllOut(PageInfo pi, String email) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		List<Mail> mList = sqlSession.selectList("mailMapper.selectSenderAllList", email, rowBounds);
		return mList;
	}

	@Override
	public int selectChkOutListCount(String email) {
		int count = sqlSession.selectOne("mailMapper.selectSenderListCount",email);
		return count;
	}

	@Override
	public List<Mail> selectAllChkOut(PageInfo pi, String email) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		List<Mail> mList = sqlSession.selectList("mailMapper.selectSenderAllList", email, rowBounds);
		return mList;
	}

	@Override
	public int postMail(Mail mail) {
		int result = sqlSession.insert("mailMapper.postMail", mail);
		return result;
	}

	@Override
	public Mail selectOne(int mailNo) {
		Mail mail = sqlSession.selectOne("mailMapper.selectOne", mailNo);
		return mail;
	}

	@Override
	public int deleteReceiveMail(String mailNo) {
		int result = sqlSession.delete("mailMapper.deleteRecieveMail", mailNo);
		return result;
	}

	@Override
	public int deleteSendMail(String mailNo) {
		int result = sqlSession.delete("mailMapper.deleteSendMail", mailNo);
		return result;
	}

	@Override
	public int addMail(int mailNo) {
		int result = sqlSession.update("mailMapper.addMail", mailNo);
		return result;
	}

	@Override
	public List<Employee> selectAllEmpList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1 ) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		List<Employee> eList = sqlSession.selectList("employeeMapper.selectAllEmpList", pi, rowBounds);
		return eList;
	}

	@Override
	public List<Team> selectAllTeamList() {
		List<Team> tList = sqlSession.selectList("deptMapper.selectAllTeam");
		return tList;
	}

	@Override
	public List<Dept> selectAllDeptList() {
		List<Dept> dList = sqlSession.selectList("deptMapper.selectAllDept");
		return dList;
	}

	@Override
	public List<Employee> selectSearchEmpAll(PageInfo pi,Search search) {
		int offset = (pi.getCurrentPage() - 1 ) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		List<Employee> eList = sqlSession.selectList("employeeMapper.selectSearchEmpAll", search, rowBounds);
		return eList;
	}

	@Override
	public List<Employee> selectAll(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1 ) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		List<Employee> eList = sqlSession.selectList("employeeMapper.selectAllList", pi, rowBounds);
		return eList;
	}

	@Override
	public int selectListCount() {
		int count = sqlSession.selectOne("employeeMapper.selectListCount");
		return count;
	}

	@Override
	public List<Mail> selectmSearchAll(PageInfo pi,Search search) {
		int offset = (pi.getCurrentPage() - 1 ) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		List<Mail> mList = sqlSession.selectList("mailMapper.selectmSearchAll", search, rowBounds);
		return mList;
	}

	@Override
	public List<Mail> selectMainMailList(String email) {
		List<Mail> mList = sqlSession.selectList("mailMapper.selectMainMailList", email);
		return mList;
	}

	
}
