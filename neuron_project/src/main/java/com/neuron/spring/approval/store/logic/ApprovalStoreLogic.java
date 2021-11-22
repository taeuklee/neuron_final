package com.neuron.spring.approval.store.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.neuron.spring.approval.domain.CodeInfo;
import com.neuron.spring.approval.domain.Document;
import com.neuron.spring.approval.domain.DocumentFile;
import com.neuron.spring.approval.domain.PageInfo;
import com.neuron.spring.approval.store.ApprovalStore;
import com.neuron.spring.employee.domain.Dept;
import com.neuron.spring.employee.domain.Employee;
import com.neuron.spring.employee.domain.Team;
import com.neuron.spring.util.DataMap;

@Repository
public class ApprovalStoreLogic implements ApprovalStore{

	@Autowired
	private SqlSessionTemplate sqlSession;


	@Override
	public List<DataMap> selectMyAllDoc(PageInfo pi, Map empNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit()); 
		List<DataMap> bList = sqlSession.selectList("approvalMapper.selectAllList", empNo, rowBounds);
		return bList;
	}

	@Override
	public int selectListCount(int docWriterNo) {
		int count = sqlSession.selectOne("approvalMapper.selectListCount", docWriterNo);
		return count;
	}
	
	@Override
	public int selectListCount(Map param) {
		int count = sqlSession.selectOne("approvalMapper.selectListCount", param);
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
		return sqlSession.selectList("employeeMapper.selectAllList");
	}

	@Override
	public List<Team> selectAllTeam() {
		return sqlSession.selectList("deptMapper.selectAllTeam");
	}

	@Override
	public List<Dept> selectAllDept() {
		return sqlSession.selectList("deptMapper.selectAllDept");
	}

	@Override
	public int insertDocumentFile(DocumentFile file) {
		return sqlSession.insert("approvalMapper.insertDocumentFile",file);
	}


	@Override
	public List<DataMap> selectApproval(DataMap dataMap) {
		return sqlSession.selectList("approvalMapper.selectApproval",dataMap);
	}

	@Override
	public DataMap selectDocumentOne(DataMap dataMap) {
		return sqlSession.selectOne("approvalMapper.selectDocOne",dataMap);
	}

	@SuppressWarnings("unchecked")
	@Override
	public int insertDocument(DataMap dataMap) throws Exception{
		sqlSession.insert("approvalMapper.insertDocument",dataMap);
		//JSON배열 파싱하여 결재자 리스트 리턴
		List<DataMap> list = (List<DataMap>) dataMap.get("empIdList");
		System.out.println(list.size());
		for(DataMap tmp : list) {
			String empIdArr = tmp.getString("empId");
			dataMap.put("approvalEmpNo", empIdArr.split(":")[0]);
			dataMap.put("approvalType", empIdArr.split(":")[4]);
			sqlSession.insert("approvalMapper.insertAppr", dataMap);
		}
		
		DocumentFile file = (DocumentFile)dataMap.get("docFile");
		if(file.getFileName() != null || "".equals(file.getFileName())) {
			file.setDocumentNo(dataMap.getInt("documentNo"));
			sqlSession.insert("approvalMapper.insertDocumentFile",file);			
		}
		return dataMap.getInt("documentNo");
	}

	@Override
	public int updateTransApproval(DataMap dataMap) {
		int result = sqlSession.update("approvalMapper.updateTransApproval", dataMap);
		System.out.println("@@@@@@@@@@ test:"+ dataMap.getString("apprStateChk"));
		if(dataMap.getString("apprStateChk").equals("Y")) {
			sqlSession.update("approvalMapper.updateTransApprovalDoc",dataMap);
			if(dataMap.getString("docStateChk").equals("최종완료") 
					&& dataMap.getString("documentKind").equals("휴가신청서")) {
				sqlSession.update("employeeMapper.updateEmpVacation",dataMap);
			}else {
				return result;
			}
		}
		
		return result;
	}

	@Override
	public int rejectTransApproval(DataMap dataMap) {
		int result = sqlSession.update("approvalMapper.rejectTransApproval", dataMap);
		return sqlSession.update("approvalMapper.updateTransApprovalDoc",dataMap);
	}

	@Override
	public Map<String, Object> selectOneByTeam(String teamCode) {
		return sqlSession.selectOne("deptMapper.selectOneByTeam",teamCode);
	}

	@Override
	public  Map<String, Object> selectOneByEmp(int empNo) {
		return sqlSession.selectOne("employeeMapper.selectEmpJoinTeam",empNo);
	}

	@Override
	public int updateDocWithDraw(DataMap map) {
		return sqlSession.update("approvalMapper.updateDocWithDraw", map);
	}

	@Override
	public int documentRegisterProcess(DataMap map) {
		int result = 0;
		if(map.getString("codeGubun").equals("newCode")) {
			result = sqlSession.insert("approvalMapper.insertCodeInfo",map);
		}else {
			result = sqlSession.update("approvalMapper.updateCodInfo", map);
		}
			
		return result;
	}

	@Override
	public List<DataMap> selectMainPageDocList(int empNo) {
		return sqlSession.selectList("approvalMapper.selectMainPageDocList", empNo);
	}

}
