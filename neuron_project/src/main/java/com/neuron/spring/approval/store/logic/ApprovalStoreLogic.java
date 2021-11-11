package com.neuron.spring.approval.store.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.neuron.spring.approval.domain.Approval;
import com.neuron.spring.approval.domain.CodeInfo;
import com.neuron.spring.approval.domain.Document;
import com.neuron.spring.approval.domain.DocumentFile;
import com.neuron.spring.approval.domain.PageInfo;
import com.neuron.spring.approval.store.ApprovalStore;
import com.neuron.spring.employee.domain.Dept;
import com.neuron.spring.employee.domain.Employee;
import com.neuron.spring.employee.domain.Team;

@Repository
public class ApprovalStoreLogic implements ApprovalStore{

	@Autowired
	private SqlSessionTemplate sqlSession;


	@Override
	public List<Document> selectMyAllDoc(PageInfo pi, Map empNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit()); 
		List<Document> bList = sqlSession.selectList("approvalMapper.selectAllList", empNo, rowBounds);

		
		return bList;
	}

	@Override
	public int selectListCount(int docWriterNo) {
		int count = sqlSession.selectOne("approvalMapper.selectListCount", docWriterNo);
		return count;
	}
	
	@Override
	public  List<Map<String, Object>> selectCodeInfo(Map<String,String> param){
		return sqlSession.selectList("approvalMapper.selectCodeInfoOne", param);
	}

	@Override
	public List<CodeInfo> selectCodeInfo() {
		return sqlSession.selectList("approvalMapper.selectCodeInfo");
	}
	
	@Override
	public List<Employee> selectAllEmployee() {
		return sqlSession.selectList("employeeMapper.selectAllEmp");
	}

	@Override
	public List<Team> selectAllTeam() {
		return sqlSession.selectList("employeeMapper.selectAllTeam");
	}

	@Override
	public List<Dept> selectAllDept() {
		return sqlSession.selectList("employeeMapper.selectAllDept");
	}

	@Override
	public int insertDocument(Document doc) {
		return sqlSession.insert("approvalMapper.insertDocument",doc);
	}

	@Override
	public int insertDocumentFile(DocumentFile file) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int issertApproval(Approval appr) {
		// TODO Auto-generated method stub
		return 0;
	}

}
